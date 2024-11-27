import 'dart:convert';
import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/core_api_responses/raw_api_response.dart';
import 'package:ecomikstoreapp/models/api_responses/coupon_list_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CouponsScreenController extends GetxController {
  TextEditingController searchTextEditingController = TextEditingController();
  // CouponScreenTab _currentTab = CouponScreenTab.active;
  // CouponScreenTab get currentTab => _currentTab;
  // set currentTab(CouponScreenTab value) { _currentTab = value; update(); }

  final PagingController<int, Coupon> couponsPagingController =
      PagingController(firstPageKey: 1);

  void onSearchTextEditOnChange(String? text) {
    couponsPagingController.refresh();
  }

  void onCouponItemTap(Coupon coupon) async {
    await Get.toNamed(AppPageNames.addCouponScreen, arguments: coupon);
    couponsPagingController.refresh();
    update();
  }

  void onCouponMoveToTrashButtonTap(Coupon coupon) async {
    AppDialogs.showConfirmDialog(
      messageText: 'Confirm to trash?',
      onYesTap: () async {
        _moveTrashProduct(coupon.id);
      },
    );
  }

  Future<void> _moveTrashProduct(String couponID) async {
    final Map<String, String> requestBody = {
      '_id': couponID,
    };
    final RawAPIResponse? response = await APIRepo.deleteCoupon(requestBody);
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
    couponsPagingController.refresh();
    update();
  }

  Future<void> getCoupons(int currentPageNumber) async {
    final CouponListsResponse? response = await APIRepo.getCoupons(
      currentPageNumber,
      // searchTextEditingController.text,
    );
    if (response == null) {
      couponsPagingController.error = response;
      return;
    } else if (response.error) {
      couponsPagingController.error = response;
      return;
    }
    log((response.toJson().toString()));
    _onSuccessGetCoupons(response);
  }

  void _onSuccessGetCoupons(CouponListsResponse response) {
    final isLastPage = !response.data.hasNextPage;
    if (isLastPage) {
      couponsPagingController.appendLastPage(response.data.docs);
      return;
    }
    final nextPageNumber = response.data.page + 1;
    couponsPagingController.appendPage(response.data.docs, nextPageNumber);
  }

  @override
  void onInit() {
    couponsPagingController.addPageRequestListener((pageKey) {
      getCoupons(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    couponsPagingController.dispose();
    searchTextEditingController.dispose();
    super.onClose();
  }
}
