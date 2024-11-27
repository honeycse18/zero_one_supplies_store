import 'package:ecomikstoreapp/controller/coupons_screen_controller.dart';
import 'package:ecomikstoreapp/models/api_responses/auctions_response.dart';
import 'package:ecomikstoreapp/models/api_responses/coupon_list_response.dart';
import 'package:ecomikstoreapp/models/api_responses/products_response.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/models/screen_parameters/add_auction_2nd_screen_parameter.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/extensions/datetime.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/bid_screen_widget.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/coupons_screen_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/products_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CouponsScreenController>(
        init: CouponsScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Appbar --------> */
                appBar: CoreWidgets.appBarWidget(
                    hasBackButton: false,
                    screenContext: context,
                    titleWidget: Text(AppLanguageTranslation
                        .couponTransKey.toCurrentLanguage)),

                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      return controller.couponsPagingController.refresh();
                    },
                    child: Column(
                      children: [
                        /* <---- Top extra spaces ----> */
                        AppGaps.hGap10,
                        /* <---- Search and filter button row ----> */
/*                         DecoratedBox(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /* <---- Product Active Auctions tab button ----> */
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    height: 48,
                                    child: Obx(() =>
                                        CustomTabToggleButtonWidget(
                                            text: LanguageHelper
                                                .currentLanguageText(
                                                    LanguageHelper
                                                        .auctionsTransKey),
                                            isSelected: controller.currentTab ==
                                                ProductScreenTab.auctions,
                                            onTap: () {
                                              controller.currentTab =
                                                  ProductScreenTab.auctions;
                                              controller.update();
                                            })),
                                  ),
                                ),
                              ),
                              AppGaps.wGap2,
                              /* <---- Product Won Auctions tab button ----> */
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    height: 48,
                                    child: Obx(() =>
                                        CustomTabToggleButtonWidget(
                                            text: LanguageHelper
                                                .currentLanguageText(
                                                    LanguageHelper
                                                        .newProductsTransKey),
                                            isSelected: controller.currentTab ==
                                                ProductScreenTab.products,
                                            onTap: () {
                                              controller.currentTab =
                                                  ProductScreenTab.products;
                                              controller.update();
                                            })),
                                  ),
                                ),
                              ),
                              AppGaps.wGap2,
                              /* <---- Product Won Auctions tab button ----> */
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    height: 48,
                                    child: Obx(() =>
                                        CustomTabToggleButtonWidget(
                                            text: 'Trash',
                                            isSelected: controller.currentTab ==
                                                ProductScreenTab.trash,
                                            onTap: () {
                                              controller.currentTab =
                                                  ProductScreenTab.trash;
                                              controller.update();
                                            })),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ), */
                        /* AppGaps.hGap12,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /* <---- Search text field ----> */
                            Expanded(
                                child: CustomTextFormField(
                                    hasShadow: false,
                                    controller:
                                        controller.searchTextEditingController,
                                    onChanged:
                                        controller.onSearchTextEditOnChange,
                                    hintText:
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper
                                                .searchProductTransKey),
                                    prefixIcon: SvgPicture.asset(
                                        AppAssetImages.searchSVGLogoLine,
                                        color: AppColors.primaryColor))),
                          ],
                        ), */
                        AppGaps.hGap5,
                        Builder(
                          builder: (context) {
                            return Expanded(
                              child: PagedListView.separated(
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 30),
                                pagingController:
                                    controller.couponsPagingController,
                                builderDelegate:
                                    PagedChildBuilderDelegate<Coupon>(
                                  itemBuilder: (context, item, index) {
                                    final Coupon coupon = item;
                                    return CouponListTileWidget(
                                      name: coupon.name,
                                      value: coupon.value,
                                      type: coupon.discountTypeEnum,
                                      isActive: coupon.active,
                                      code: coupon.code,
                                      status: coupon.active.toString(),
                                      endDate: coupon.endDate,
                                      onTap: () =>
                                          controller.onCouponItemTap(coupon),
                                      onDeleteTap: () => controller
                                          .onCouponMoveToTrashButtonTap(coupon),
                                    );
                                  },
                                ),
                                separatorBuilder: (context, index) =>
                                    AppGaps.hGap16,
                              ),
                            );
                          },
                        ),

                        /* <---- Bottom extra spaces ----> */
                        // AppGaps.hGap30,
                      ],
                    ),
                  ),
                ),
                floatingActionButton: Container(
                  height: 62,
                  width: 62,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      color: Colors.white),
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      await Get.toNamed(AppPageNames.addCouponScreen);
                      controller.couponsPagingController.refresh();
                    },
                    label: SvgPicture.asset(AppAssetImages.plusaction,
                        color: Colors.white, height: 24, width: 24),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    backgroundColor: AppColors.primaryColor,
                  ),
                ),
              ),
            ));
  }
}
