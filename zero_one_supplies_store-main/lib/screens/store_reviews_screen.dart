import 'package:ecomikstoreapp/controller/store_review-controller.dart';
import 'package:ecomikstoreapp/models/api_responses/store_reviews_response.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/store_reviews_screen_widgets.dart';
import 'package:ecomikstoreapp/widgets/star_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sliver_tools/sliver_tools.dart';

class StoreReviewsScreen extends StatelessWidget {
  const StoreReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreReviewsScreenController>(
        init: StoreReviewsScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backfake).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Appbar --------> */
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context,
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.storeReviewsTransKey))),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: RefreshIndicator(
                    onRefresh: () async =>
                        controller.storeReviewPagingController.refresh(),
                    child: CustomScrollView(
                      slivers: [
                        // Top extra spaces
                        const SliverToBoxAdapter(child: AppGaps.hGap15),
                        /* <---- Review statistics card ----> */
                        MultiSliver(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(24),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                '${controller.storeReviewCount.rating.avgRating}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            AppGaps.wGap5,
                                            const Text('/5'),
                                          ],
                                        ),
                                        AppGaps.hGap8,
                                        Text(
                                            LanguageHelper.currentLanguageText(
                                                LanguageHelper.basedOnTransKey),
                                            style: const TextStyle(
                                                color:
                                                    AppColors.bodyTextColor)),
                                        AppGaps.hGap8,
                                        Text(
                                            '${LanguageHelper.currentLanguageText(LanguageHelper.totalTransKey)} ${controller.storeReviewCount.rating.sellerReviews} ${LanguageHelper.currentLanguageText(LanguageHelper.reviewsTransKey)}',
                                            style: const TextStyle(
                                                color:
                                                    AppColors.bodyTextColor)),
                                        AppGaps.hGap16,
                                        StarWidget(
                                            review: controller.storeReviewCount
                                                .rating.avgRating)
                                        /* SizedBox(
                                            height: 20,
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              separatorBuilder:
                                                  (context, index) =>
                                                      AppGaps.wGap2,
                                              itemCount: 5,
                                              itemBuilder: (context, index) =>
                                                  SvgPicture.asset(
                                                AppAssetImages.starSVGLogoSolid,
                                                color: 4 >= (index + 1)
                                                    ? AppColors.secondaryColor
                                                    : AppColors.secondaryColor
                                                        .withOpacity(0.5),
                                              ),
                                            )) */
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        /* <---- 5 star progress bar ----> */
                                        ReviewStarTextProgressBar(
                                            starCount: 5,
                                            starProgressValue: controller
                                                .getStarPregressValue(5)),
                                        AppGaps.hGap8,
                                        /* <---- 4 star progress bar ----> */
                                        ReviewStarTextProgressBar(
                                            starCount: 4,
                                            starProgressValue: controller
                                                .getStarPregressValue(4)),
                                        AppGaps.hGap8,
                                        /* <---- 4 star progress bar ----> */
                                        ReviewStarTextProgressBar(
                                            starCount: 3.5,
                                            starProgressValue: controller
                                                .getStarPregressValue(3.5)),
                                        AppGaps.hGap8,
                                        /* <---- 3 star progress bar ----> */
                                        ReviewStarTextProgressBar(
                                            starCount: 3,
                                            starProgressValue: controller
                                                .getStarPregressValue(3)),
                                        AppGaps.hGap8,
                                        /* <---- 2 star progress bar ----> */
                                        ReviewStarTextProgressBar(
                                            starCount: 2,
                                            starProgressValue: controller
                                                .getStarPregressValue(2)),
                                        AppGaps.hGap8,
                                        /* <---- 1 star progress bar ----> */
                                        ReviewStarTextProgressBar(
                                            starCount: 1,
                                            starProgressValue: controller
                                                .getStarPregressValue(1)),
                                        AppGaps.hGap8,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SliverToBoxAdapter(child: AppGaps.hGap16),
                        /* <---- 'User reviews' and its category dropdown menu ----> */
                        SliverToBoxAdapter(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  LanguageHelper.currentLanguageText(
                                      LanguageHelper.userReviewTransKey),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              PopupMenuButton<int>(
                                  padding: const EdgeInsets.only(right: 5),
                                  position: PopupMenuPosition.under,
                                  // icon: const Icon(Icons.more_vert_rounded, color: AppColors.darkColor),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .mostUsefulTransKey),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500)),
                                      SvgPicture.asset(
                                          AppAssetImages.arrowDown2SVGLogoSolid,
                                          color: AppColors.darkColor,
                                          height: 12,
                                          width: 12),
                                    ],
                                  ),
                                  itemBuilder: (context) => [
                                        PopupMenuItem<int>(
                                          value: 0,
                                          child: Text(
                                            LanguageHelper.currentLanguageText(
                                                LanguageHelper.newestTransKey),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 1,
                                          child: Text(
                                            LanguageHelper.currentLanguageText(
                                                LanguageHelper.basedOnTransKey),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 2,
                                          child: Text(
                                            LanguageHelper.currentLanguageText(
                                                LanguageHelper
                                                    .mostRelevantTransKey),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ])
                            ],
                          ),
                        ),
                        const SliverToBoxAdapter(child: AppGaps.hGap16),
                        /* <---- User review list ----> */
                        PagedSliverList.separated(
                          pagingController:
                              controller.storeReviewPagingController,
                          builderDelegate:
                              PagedChildBuilderDelegate<StoreReviewsShortItem>(
                                  itemBuilder: (context, item, index) {
                            final StoreReviewsShortItem review = item;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 32),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        Image.network(review.user.image).image,
                                    radius: 24,
                                  ),
                                  AppGaps.wGap16,
                                  Expanded(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        review.user.firstName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      AppGaps.hGap5,
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          StarWidget(review: review.rating),
                                          Text(
                                            Helper.eeeMMMdFormattedDateTime(
                                                review.createdAt),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                    color: AppColors
                                                        .bodyTextColor),
                                          ),
                                        ],
                                      ),
                                      AppGaps.hGap11,
                                      Text(
                                        review.review,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: AppColors.bodyTextColor),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            );
                          }),
                          separatorBuilder: (context, index) => AppGaps.hGap16,
                        ),

                        // Bottom extra spaces
                        const SliverToBoxAdapter(child: AppGaps.hGap30),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
