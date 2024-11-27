import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/all_orders_response.dart';
import 'package:ecomikstoreapp/models/api_responses/vendor_with_store_details_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrderScreenController extends GetxController {
  /// New orders or past order tab selected toggle value
  RxBool isPastOrderSelected = false.obs;
  VendorDetails vendorStore = VendorDetails.empty();
  Future<void> getStoreId() async {
    vendorStore = Helper.getVendor();
  }

  final PagingController<int, StoreOrder> ordersPagingController =
      PagingController(firstPageKey: 1);

  Future<void> getOrders(int currentPageNumber) async {
    StoreOrdersResponse? response = await APIRepo.getAllOrders(
        currentPageNumber, vendorStore.store.id, isPastOrderSelected.value);
    if (response == null) {
      AppDialogs.showErrorDialog(
          messageText: LanguageHelper.currentLanguageText(
              LanguageHelper.responseIsNullTransKey));
      return;
    } else if (response.error) {
      AppDialogs.showErrorDialog(
          messageText: LanguageHelper.currentLanguageText(
              LanguageHelper.somethingErrorTransKey));
      return;
    }
    log(response.toJson().toString());
    onSuccessRetrievingResponse(response);
  }

  onSuccessRetrievingResponse(StoreOrdersResponse response) {
    final isLastPage = !response.data.hasNextPage;
    if (isLastPage) {
      ordersPagingController.appendLastPage(response.data.docs);
      return;
    }
    final nextPageNumber = response.data.page + 1;
    ordersPagingController.appendPage(response.data.docs, nextPageNumber);
  }

  @override
  void onInit() {
    getStoreId();
    ordersPagingController.addPageRequestListener((pageKey) {
      getOrders(pageKey);
    });
    super.onInit();
  }
}
