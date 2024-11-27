import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/products_response.dart';
import 'package:ecomikstoreapp/models/screen_parameters/add_auction_2nd_screen_parameter.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AddAuction1stScreenController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final PagingController<int, Product> productsPagingController =
      PagingController(firstPageKey: 1);
  Product selectedProduct = Product.empty();

  void onProductItemTap(Product product) {
    selectedProduct = product;
    update();
  }

  void onNextButtonTap() {
    Get.toNamed(AppPageNames.addActionSecondScreen,
        arguments: AddAuction2ndScreenParameter(productID: selectedProduct.id));
  }

  Future<void> getProducts(int currentPageNumber) async {
    ProductsResponse? response =
        await APIRepo.getProducts(currentPageNumber, searchController.text);
    if (response == null) {
      onErrorGetProducts(response);
      return;
    } else if (response.error) {
      onFailureGetProducts(response);
      return;
    }
    log((response.toJson().toString()));
    onSuccessGetProducts(response);
  }

  void onErrorGetProducts(ProductsResponse? response) {
    productsPagingController.error = response;
  }

  void onFailureGetProducts(ProductsResponse response) {
    productsPagingController.error = response;
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

  @override
  void onInit() {
    productsPagingController.addPageRequestListener((pageKey) {
      getProducts(pageKey);
    });
    searchController.addListener(() {
      productsPagingController.refresh();
    });
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    productsPagingController.dispose();
    super.onClose();
  }
}
