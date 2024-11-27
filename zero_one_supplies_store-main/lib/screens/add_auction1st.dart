import 'package:ecomikstoreapp/controller/add_auction_controller.dart';
import 'package:ecomikstoreapp/models/api_responses/products_response.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/add_product_screen_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/products_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AddAuction1stScreen extends StatelessWidget {
  const AddAuction1stScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAuction1stScreenController>(
        init: AddAuction1stScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Appbar --------> */
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context,
                    hasBackButton: true,
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.addAuctionTransKey))),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // CircleAvatar(
                      //   backgroundImage: Image.asset(
                      //     AppAssetImages.myAccountProfilePicture,
                      //   ).image,
                      //   radius: 64,
                      // ),
                      // Top extra spaces
                      AppGaps.hGap15,
                      /* <---- Product picture ----> */
/*                               Container(
                            child: Row(
                              children: [
                                Text(
                                    LanguageHelper.currentLanguageText(
                                        LanguageHelper.auctionInfoTransKey),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(color: Colors.black)),
                              ],
                            ),
                          ), */
                      SectionHeaderTextWidget(
                          text: LanguageHelper.currentLanguageText(
                              LanguageHelper.selectProductTransKey)),
                      AppGaps.hGap16,
                      TextFormFieldWidget(
                        controller: controller.searchController,
                        labelText: LanguageHelper.currentLanguageText(
                            LanguageHelper.searchProductTransKey),
                        hintText: LanguageHelper.currentLanguageText(
                            LanguageHelper.searchProductHereTransKey),
                      ),
                      AppGaps.hGap16,
                      Expanded(
                          child: PagedListView.separated(
                        padding: const EdgeInsets.only(bottom: 30),
                        pagingController: controller.productsPagingController,
                        builderDelegate: PagedChildBuilderDelegate<Product>(
                          itemBuilder: (context, item, index) {
                            final Product product = item;
                            return ProductListTileForAuction(
                              productImageUrl: product.image,
                              productName: product.name,
                              price: product.currentPrice,
                              backgroundColor:
                                  product.id == controller.selectedProduct.id
                                      ? AppColors.primaryColor
                                      : Colors.white,
                              isSelected:
                                  product.id == controller.selectedProduct.id,
                              onTap: () => controller.onProductItemTap(product),
                            );
                          },
                        ),
                        separatorBuilder: (context, index) => AppGaps.hGap16,
                      )),
                      // AppGaps.hGap24,
                      /* <---- Edit your name ----> */
/*                               CustomTextFormField(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.auctionInfoTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.apple12TransKey),
                          ),
                          // prefixIcon: SvgPicture.asset(
                          //     AppAssetImages.shopSVGLogoLine,
                          //     color: AppColors.bodyTextColor)),
                          AppGaps.hGap24,
                          /* <---- Edit your email address ----> */
                          CustomTextFormField(
                            isReadOnly: true,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.productCategoryTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.chooseCategoryTransKey),
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.menuSVGLogoLine,
                                color: AppColors.bodyTextColor),
                            suffixIcon: PopupMenuButton<int>(
                                padding: const EdgeInsets.only(right: 5),
                                position: PopupMenuPosition.under,
                                child: CustomIconButtonWidget(
                                  fixedSize: const Size(20, 20),
                                  child: SvgPicture.asset(
                                      AppAssetImages.arrowDownSVGLogoLine,
                                      height: 12,
                                      color: AppColors.bodyTextColor),
                                ),
                                itemBuilder: (context) => [
                                      const PopupMenuItem<int>(
                                        value: 0,
                                        child: Text(
                                          'Headphone',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const PopupMenuItem<int>(
                                        value: 1,
                                        child: Text(
                                          'Camera',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const PopupMenuItem<int>(
                                        value: 2,
                                        child: Text(
                                          'Electronics',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ]),
                          ),
                          AppGaps.hGap24,
                          /* <---- Edit your phone number ----> */
                          CustomTextFormField(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.descriptionTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.descriptionSubtitleTransKey),
                            textInputType: TextInputType.phone,
                            // prefixIcon: SvgPicture.asset(
                            //     AppAssetImages.callingSVGLogoLine,
                            //     color: AppColors.bodyTextColor)
                          ),
                          AppGaps.hGap24,

                          Container(
                            child: Row(
                              children: [
                                Text(
                                    LanguageHelper.currentLanguageText(
                                        LanguageHelper
                                            .specificationTransKey),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(color: Colors.black)),
                              ],
                            ),
                          ),
                          AppGaps.hGap24,
                          /* <---- Edit your email address ----> */
                          CustomTextFormField(
                            isReadOnly: true,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.chargingPowerTransKey),
                            hintText: 'Choose category',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.menuSVGLogoLine,
                                color: AppColors.bodyTextColor),
                            suffixIcon: PopupMenuButton<int>(
                                padding: const EdgeInsets.only(right: 5),
                                position: PopupMenuPosition.under,
                                child: CustomIconButtonWidget(
                                  fixedSize: const Size(20, 20),
                                  child: SvgPicture.asset(
                                      AppAssetImages.arrowDownSVGLogoLine,
                                      height: 12,
                                      color: AppColors.bodyTextColor),
                                ),
                                itemBuilder: (context) => [
                                      const PopupMenuItem<int>(
                                        value: 0,
                                        child: Text(
                                          'Headphone',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const PopupMenuItem<int>(
                                        value: 1,
                                        child: Text(
                                          'Camera',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const PopupMenuItem<int>(
                                        value: 2,
                                        child: Text(
                                          'Electronics',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ]),
                          ),
                          AppGaps.hGap24,
                          CustomTextFormField(
                            isReadOnly: true,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.touchScreenTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.chooseCategoryTransKey),
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.menuSVGLogoLine,
                                color: AppColors.bodyTextColor),
                            suffixIcon: PopupMenuButton<int>(
                                padding: const EdgeInsets.only(right: 5),
                                position: PopupMenuPosition.under,
                                child: CustomIconButtonWidget(
                                  fixedSize: const Size(20, 20),
                                  child: SvgPicture.asset(
                                      AppAssetImages.arrowDownSVGLogoLine,
                                      height: 12,
                                      color: AppColors.bodyTextColor),
                                ),
                                itemBuilder: (context) => [
                                      const PopupMenuItem<int>(
                                        value: 0,
                                        child: Text(
                                          'Headphone',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const PopupMenuItem<int>(
                                        value: 1,
                                        child: Text(
                                          'Camera',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const PopupMenuItem<int>(
                                        value: 2,
                                        child: Text(
                                          'Electronics',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ]),
                          ),
                          AppGaps.hGap24,
                          /* <---- Edit opening and closing time row ----> */
                          CustomTextFormField(
                            isReadOnly: true,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.ramTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.chooseCategoryTransKey),
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.menuSVGLogoLine,
                                color: AppColors.bodyTextColor),
                            suffixIcon: PopupMenuButton<int>(
                                padding: const EdgeInsets.only(right: 5),
                                position: PopupMenuPosition.under,
                                child: CustomIconButtonWidget(
                                  fixedSize: const Size(20, 20),
                                  child: SvgPicture.asset(
                                      AppAssetImages.arrowDownSVGLogoLine,
                                      height: 12,
                                      color: AppColors.bodyTextColor),
                                ),
                                itemBuilder: (context) => [
                                      const PopupMenuItem<int>(
                                        value: 0,
                                        child: Text(
                                          'Headphone',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const PopupMenuItem<int>(
                                        value: 1,
                                        child: Text(
                                          'Camera',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const PopupMenuItem<int>(
                                        value: 2,
                                        child: Text(
                                          'Electronics',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ]),
                          ),
                          // AppGaps.hGap24,
                          /* <---- Edit your location address ----> */ */

                      // Bottom extra spaces
                      // AppGaps.hGap30,
                    ],
                  ),
                ),
                /* <-------- Bottom bar --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                    child: CustomStretchedTextButtonWidget(
                  buttonText: LanguageHelper.currentLanguageText(
                      LanguageHelper.nextTransKey),
                  onTap: controller.selectedProduct.id.isNotEmpty
                      ? controller.onNextButtonTap
                      : null,
                )),
              ),
            ));
  }
}
