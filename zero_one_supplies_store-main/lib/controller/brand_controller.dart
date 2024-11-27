import 'dart:convert';
import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/brand_list_api_response.dart';
import 'package:ecomikstoreapp/models/api_responses/edit_brand_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BrandsScreenController extends GetxController {
  final PagingController<int, BrandListItem> brandListPagingController =
      PagingController(firstPageKey: 1);
  bool isAvailableToStock = false;
  // BrandListItem brandItem = BrandListItem.empty();

// use for active -inactive
  void onEditTab(BrandListItem brand) async {
    await Get.toNamed(AppPageNames.addBrandScreen, arguments: brand);
    brandListPagingController.refresh();
  }

  void onAddNewButtonTab() async {
    await Get.toNamed(AppPageNames.addBrandScreen);
    brandListPagingController.refresh();
  }

  Future<void> toggleChanges(bool value, BrandListItem brand) async {
    brand.active = value;
    update();
    final Map<String, Object> requestBody = {
      '_id': brand.id,
      'active': brand.active,
    };
    String requestBodyJson = jsonEncode(requestBody);
    EditBrandResponse? response = await APIRepo.editBrand(requestBodyJson);
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log(response.toJson().toString());
    _onSuccessEditingAccountResponse(response);
  }

  void _onSuccessEditingAccountResponse(EditBrandResponse response) {
    AppDialogs.showSuccessDialog(messageText: response.msg);
  }
  // Add Everywhere when we need to toggle add to favorite list  -- End

  Future<void> getBrandList(int currentPageNumber) async {
    BrandListApiResponse? response =
        await APIRepo.getBrandList(currentPageNumber);
    if (response == null) {
      onErrorGetBrandList(response);
      return;
    } else if (response.error) {
      onFailureGetStoreReview(response);
      return;
    }
    log((response.toJson().toString()));
    onSuccessGetStoreReview(response);
  }

  void onErrorGetBrandList(BrandListApiResponse? response) {
    brandListPagingController.error = response;
  }

  void onFailureGetStoreReview(BrandListApiResponse response) {
    brandListPagingController.error = response;
  }

  void onSuccessGetStoreReview(BrandListApiResponse response) {
    final isLastPage = !response.data.hasNextPage;
    if (isLastPage) {
      brandListPagingController.appendLastPage(response.data.docs);
      return;
    }
    final nextPageNumber = response.data.page + 1;
    brandListPagingController.appendPage(response.data.docs, nextPageNumber);
  }

  @override
  void onInit() {
    brandListPagingController.addPageRequestListener((pageKey) {
      getBrandList(pageKey);
    });
    super.onInit();
  }
}
