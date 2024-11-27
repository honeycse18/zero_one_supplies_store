import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/review_count_response.dart';
import 'package:ecomikstoreapp/models/api_responses/store_reviews_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class StoreReviewsScreenController extends GetxController {
  final PagingController<int, StoreReviewsShortItem>
      storeReviewPagingController = PagingController(firstPageKey: 1);
  StoreReviewCountShortItem storeReviewCount =
      StoreReviewCountShortItem.empty();
  double getStarPregressValue(double currentStar) {
    double percentValue = 0;
    for (var element in storeReviewCount.ratingPercentage) {
      if (element.id.rating == currentStar) {
        percentValue =
            (100 / storeReviewCount.rating.sellerReviews) * element.count;
      }
    }
    return percentValue / 100;
  }

  Future<void> getReviewCount() async {
    final String storeId = Helper.getVendor().store.id;

    ReviewCountResponse? response = await APIRepo.getReviewCount(storeId);
    if (response == null) {
      onErrorGetReviewCount(response);
      return;
    } else if (response.error) {
      onFailureGetReviewCount(response);
      return;
    }
    log((response.toJson().toString()));
    onSuccessGetReviewCount(response);
  }

  void onErrorGetReviewCount(ReviewCountResponse? response) {}

  void onFailureGetReviewCount(ReviewCountResponse response) {}
  void onSuccessGetReviewCount(ReviewCountResponse response) {
    storeReviewCount = response.data;
    update();
  }

// Add Everywhere when we need to toggle add to favorite list  -- End

  Future<void> getStoreReview(int currentPageNumber) async {
    final String storeId = Helper.getVendor().store.id;
    StoreReviewsResponse? response =
        await APIRepo.getStoreReview(currentPageNumber, storeId);
    if (response == null) {
      onErrorGetStoreReview(response);
      return;
    } else if (response.error) {
      onFailureGetStoreReview(response);
      return;
    }
    log((response.toJson().toString()));
    onSuccessGetStoreReview(response);
  }

  void onErrorGetStoreReview(StoreReviewsResponse? response) {
    storeReviewPagingController.error = response;
  }

  void onFailureGetStoreReview(StoreReviewsResponse response) {
    storeReviewPagingController.error = response;
  }

  void onSuccessGetStoreReview(StoreReviewsResponse response) {
    final isLastPage = !response.data.hasNextPage;
    if (isLastPage) {
      storeReviewPagingController.appendLastPage(response.data.docs);
      return;
    }
    final nextPageNumber = response.data.page + 1;
    storeReviewPagingController.appendPage(response.data.docs, nextPageNumber);
  }

  @override
  void onInit() {
    getReviewCount();
    storeReviewPagingController.addPageRequestListener((pageKey) {
      getStoreReview(pageKey);
    });

    super.onInit();
  }

  @override
  void onClose() {
    storeReviewPagingController.dispose();
    super.onClose();
  }
}
