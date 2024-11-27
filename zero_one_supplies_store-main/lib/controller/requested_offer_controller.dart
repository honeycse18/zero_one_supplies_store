import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/requested_offer_list_ressponse.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RequestedOfferScreenController extends GetxController {
  final PagingController<int, VendorRecietOfferList>
      receiveOffersPagingController = PagingController(firstPageKey: 1);

  VendorRecietOfferList receiveOfferListItem = VendorRecietOfferList.empty();

  Future<void> getSendOfferList(int currentPageNumber) async {
    VendorRecietOfferListResponse? response =
        await APIRepo.getReceiveOfferList(currentPageNumber);
    if (response == null) {
      onErrorGetEndingSoon(response);
      return;
    } else if (response.error) {
      onFailureGetOnErrorGetEndingSoon(response);
      return;
    }
    log((response.toJson().toString()));
    onSuccessGetEndingSoon(response);
  }

  void onErrorGetEndingSoon(VendorRecietOfferListResponse? response) {
    receiveOffersPagingController.error = response;
  }

  void onFailureGetOnErrorGetEndingSoon(
      VendorRecietOfferListResponse response) {
    receiveOffersPagingController.error = response;
  }

  void onSuccessGetEndingSoon(VendorRecietOfferListResponse response) {
    final isLastPage = !response.data.hasNextPage;
    if (isLastPage) {
      receiveOffersPagingController.appendLastPage(response.data.docs);
      return;
    }
    final nextPageNumber = response.data.page + 1;
    receiveOffersPagingController.appendPage(
        response.data.docs, nextPageNumber);
  }

  @override
  void onInit() {
    receiveOffersPagingController.addPageRequestListener((pageKey) {
      getSendOfferList(pageKey);
    });
    super.onInit();
  }
}
