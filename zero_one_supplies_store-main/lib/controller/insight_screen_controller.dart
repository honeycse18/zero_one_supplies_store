import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/insight_details_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:get/get.dart';

class InsightScreenController extends GetxController {
  final RxBool isLoading = false.obs;
  InsightDetails insightDetails = InsightDetails();

  double get highestTotalEarning {
    if (insightDetails.storeBalanceHistoryGraph.isEmpty) {
      return 1;
    }
    InsightShortItemStoreBalanceHistoryGraph highestTotalItem =
        insightDetails.storeBalanceHistoryGraph.reduce(
            (value, element) => value.total > element.total ? value : element);
    return highestTotalItem.total;
  }

  Future<void> getInsightDetails() async {
    final storeID = Helper.getVendor().store.id;
    isLoading.value = true;
    final InsightDetailsResponse? response =
        await APIRepo.getInsightResponse(storeID);
    isLoading.value = false;
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log((response.toJson().toString()));
    _onSuccessGetInsightDetails(response);
  }

  void _onSuccessGetInsightDetails(InsightDetailsResponse response) {
    insightDetails = response.data;
    update();
  }

  @override
  void onInit() {
    getInsightDetails();
    super.onInit();
  }
}
