import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/dash_board_response.dart';
import 'package:ecomikstoreapp/models/api_responses/vendor_with_store_details_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  DashBoardShortItem homepage = DashBoardShortItem.empty();
  List<EarningGraphDatum> earningGraphData = [];

  Future<void> getDashBoardResponse() async {
    isLoading.value = true;
    DashBoardResponse? response = await APIRepo.getDashBoardResponse();
    isLoading.value = false;
    if (response == null) {
      onErrorGetDashBoardResponse(response);
      return;
    } else if (response.error) {
      onFailureGetDashBoardResponse(response);
      return;
    }
    log((response.toJson().toString()));
    onSuccessGetDashBoardResponse(response);
  }

  void onErrorGetDashBoardResponse(DashBoardResponse? response) {}

  void onFailureGetDashBoardResponse(DashBoardResponse response) {}
  void onSuccessGetDashBoardResponse(DashBoardResponse response) {
    homepage = response.data;
    earningGraphData = response.data.earningGraphData;
    update();
  }

  void gotoSignInScreen() {
    Helper.showSnackBar(AppLanguageTranslation
        .sessionExpiredPleaseLoginTransKey.toCurrentLanguage);
    Get.offAllNamed(AppPageNames.signInScreen, arguments: true);
  }

  Future<void> getLoggedInVendorDetails() async {
    VendorDetailsResponse? response = await APIRepo.getVendorDetails();
    if (response == null) {
      onErrorGetLoggedInVendorDetails(response);
      return;
    } else if (response.error) {
      onFailureGetLoggedInVendorDetails(response);
      return;
    }
    log((response.toJson().toString()).toString());
    onSuccessGetLoggedInVendorDetails(response);
  }

  void onErrorGetLoggedInVendorDetails(VendorDetailsResponse? response) {
    gotoSignInScreen();
  }

  void onFailureGetLoggedInVendorDetails(VendorDetailsResponse response) {
    gotoSignInScreen();
  }

  void onSuccessGetLoggedInVendorDetails(VendorDetailsResponse response) async {
    await Helper.setLoggedInUserToLocalStorage(response.data);
    BuildContext? context = Get.context;
    if (response.data.store.status == 'approved') {
      if (context != null) {
        Get.toNamed(AppPageNames.homeNavigatorScreen);
      }
    } else {
      Get.toNamed(AppPageNames.storeNotApprovedYetScreen);
    }
  }

  @override
  void onInit() {
    // Verify token
    getLoggedInVendorDetails();
    getDashBoardResponse();
    super.onInit();
  }
}
