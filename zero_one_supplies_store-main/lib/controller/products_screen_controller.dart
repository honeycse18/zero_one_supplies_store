import 'dart:convert';
import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/auctions_response.dart';
import 'package:ecomikstoreapp/models/api_responses/core_api_responses/raw_api_response.dart';
import 'package:ecomikstoreapp/models/api_responses/products_response.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsScreenController extends GetxController {
  RxBool isNewProductsTabSelected = false.obs;
  RxBool isNewAuctionsTabSelected = false.obs;
  TextEditingController searchTextEditingController = TextEditingController();
  final Rx<ProductScreenTab> _currentTab = ProductScreenTab.products.obs;
  ProductScreenTab get currentTab => _currentTab.value;
  set currentTab(ProductScreenTab value) {
    _currentTab.value = value;
  }

  final PagingController<int, Product> productsPagingController =
      PagingController(firstPageKey: 1);
  final PagingController<int, Product> trashProductsPagingController =
      PagingController(firstPageKey: 1);
  final PagingController<int, AuctionShortItem> auctionsPagingController =
      PagingController(firstPageKey: 1);

  void onSearchTextEditOnChange(String? text) {
    switch (currentTab) {
      case ProductScreenTab.auctions:
        auctionsPagingController.refresh();
        break;
      case ProductScreenTab.products:
        productsPagingController.refresh();
        break;
      case ProductScreenTab.trash:
        trashProductsPagingController.refresh();
        break;
    }
  }

  void onProductItemTap(Product myOrder) async {
    // Get.toNamed(AppPageNames.editProductScreen, arguments: myOrder);
    await Get.toNamed(AppPageNames.addProduct1stScreen, arguments: myOrder.id);
    productsPagingController.refresh();
    auctionsPagingController.refresh();
    trashProductsPagingController.refresh();
    // productsPagingController.refresh();
    update();
  }

  void onTrashProductRecoverButtonTap(Product product) async {
    AppDialogs.showConfirmDialog(
      messageText: 'Confirm to recover?',
      onYesTap: () async {
        _recoverTrashProduct(product.id);
      },
    );
  }

  void onProductMoveToTrashButtonTap(Product product) async {
    AppDialogs.showConfirmDialog(
      messageText: 'Confirm to trash?',
      onYesTap: () async {
        _moveTrashProduct(product.id);
      },
    );
  }

  void onTrashProductPermanentDeleteButtonTap(Product product) async {
    AppDialogs.showConfirmDialog(
      messageText: 'Confirm to permanent delete?',
      onYesTap: () async {
        _permanentDeleteProduct(product.id);
      },
    );
  }

  Future<void> _moveTrashProduct(String productID) async {
    final Map<String, dynamic> requestBody = {
      '_id': productID,
      'trash': 'true',
    };
    String requestBodyJson = jsonEncode(requestBody);
    final RawAPIResponse? response = await APIRepo.moveToTrash(requestBodyJson);
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    _onSuccessMoveTrashProduct(response);
  }

  void _onSuccessMoveTrashProduct(RawAPIResponse response) {
    AppDialogs.showSuccessDialog(messageText: response.msg);
    productsPagingController.refresh();
    auctionsPagingController.refresh();
    trashProductsPagingController.refresh();
    update();
  }

  Future<void> _recoverTrashProduct(String productID) async {
    final Map<String, dynamic> requestBody = {
      '_id': productID,
      'trash': 'false',
    };
    String requestBodyJson = jsonEncode(requestBody);
    final RawAPIResponse? response =
        await APIRepo.recoverTrash(requestBodyJson);
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    _onSuccessRecoverTrashProduct(response);
  }

  void _onSuccessRecoverTrashProduct(RawAPIResponse response) {
    AppDialogs.showSuccessDialog(messageText: response.msg);
    productsPagingController.refresh();
    auctionsPagingController.refresh();
    trashProductsPagingController.refresh();
    update();
  }

  Future<void> _permanentDeleteProduct(String productID) async {
    final Map<String, String> requestBody = {
      '_id': productID,
    };
    final RawAPIResponse? response =
        await APIRepo.permanentDeleteProduct(requestBody);
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    _onSuccessPermanentDeleteProduct(response);
  }

  void _onSuccessPermanentDeleteProduct(RawAPIResponse response) {
    AppDialogs.showSuccessDialog(messageText: response.msg);
    productsPagingController.refresh();
    auctionsPagingController.refresh();
    trashProductsPagingController.refresh();
    update();
  }

  void outOfStockToggleOnTap(Product product) {
    product.stockAvailable = !product.stockAvailable;
    update();
  }

  void outOfStockGestureOnTap(Product myOrder) {
    outOfStockToggleOnTap(myOrder);
  }

//=======================================================================
  Future<void> getProducts(int currentPageNumber) async {
    ProductsResponse? response = await APIRepo.getProducts(
        currentPageNumber, searchTextEditingController.text);
    if (response == null) {
      productsPagingController.error = response;
      return;
    } else if (response.error) {
      productsPagingController.error = response;
      return;
    }
    log((response.toJson().toString()));
    onSuccessGetProducts(response);
  }

  void onSuccessGetProducts(ProductsResponse response) {
    final isLastPage = !response.data.hasNextPage;
    if (isLastPage) {
      productsPagingController.appendLastPage(response.data.docs);
      return;
    }
    final nextPageNumber = response.data.page + 1;
    productsPagingController.appendPage(response.data.docs, nextPageNumber);
  }

  Future<void> getTrashProducts(int currentPageNumber) async {
    ProductsResponse? response = await APIRepo.getTrashProducts(
        currentPageNumber, searchTextEditingController.text);
    if (response == null) {
      trashProductsPagingController.error = response;
      return;
    } else if (response.error) {
      trashProductsPagingController.error = response;
      return;
    }
    log((response.toJson().toString()));
    _onSuccessGetTrashProducts(response);
  }

  void _onSuccessGetTrashProducts(ProductsResponse response) {
    final isLastPage = !response.data.hasNextPage;
    if (isLastPage) {
      trashProductsPagingController.appendLastPage(response.data.docs);
      return;
    }
    final nextPageNumber = response.data.page + 1;
    trashProductsPagingController.appendPage(
        response.data.docs, nextPageNumber);
  }

// ==============================================================================
/* ---------------------Duplicate ---------------------------------------------*/

  Future<void> getAuctions(int currentPageNumber) async {
    AuctionsResponse? response = await APIRepo.getAuctions(
        currentPageNumber, searchTextEditingController.text);
    if (response == null) {
      onErrorGetAuctions(response);
      return;
    } else if (response.error) {
      onFailureGetAuctions(response);
      return;
    }
    log((response.toJson().toString()));
    onSuccessGetAuctions(response);
  }

  void onErrorGetAuctions(AuctionsResponse? response) {
    auctionsPagingController.error = response;
  }

  void onFailureGetAuctions(AuctionsResponse response) {
    auctionsPagingController.error = response;
  }

  void onSuccessGetAuctions(AuctionsResponse response) {
    final isLastPage = !response.data.hasNextPage;
    if (isLastPage) {
      auctionsPagingController.appendLastPage(response.data.docs);
      return;
    }
    final nextPageNumber = response.data.page + 1;
    auctionsPagingController.appendPage(response.data.docs, nextPageNumber);
  }

/* ---------------------Duplicate ---------------------------------------------*/
  @override
  void onInit() {
    trashProductsPagingController.addPageRequestListener((pageKey) {
      getTrashProducts(pageKey);
    });
    auctionsPagingController.addPageRequestListener((pageKey) {
      getAuctions(pageKey);
    });
    productsPagingController.addPageRequestListener((pageKey) {
      getProducts(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    productsPagingController.dispose();
    auctionsPagingController.dispose();
    trashProductsPagingController.dispose();
    searchTextEditingController.dispose();
    super.onClose();
  }
}
