import 'package:ecomikstoreapp/controller/my_account_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/my_account_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAccountScreenController>(
        init: MyAccountScreenController(),
        builder: (controller) => Scaffold(
              /* <-------- Appbar --------> */
              appBar: CoreWidgets.appBarWidget(
                  screenContext: context,
                  hasBackButton: false,
                  titleWidget: Text(LanguageHelper.currentLanguageText(
                      LanguageHelper.myAccountTransKey))),
              /* <-------- Content --------> */
              body: CustomScaffoldBodyWidget(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top extra spaces
                      AppGaps.hGap15,
                      /* <---- Profile picture, name, phone number, email address
                       ----> */
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                /* <---- Profile picture ----> */
                                CachedNetworkImageWidget(
                                  imageURL:
                                      controller.vendorAccountDetails.image,
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: imageProvider,
                                    radius: 64,
                                  ),
                                ),
                                /* CircleAvatar(
                                  backgroundImage: Image.asset(
                                    AppAssetImages.myAccountProfilePicture,
                                  ).image,
                                  radius: 64,
                                ), */
                                /* <---- Small edit circle icon button ----> */
                                Positioned(
                                    bottom: 7,
                                    right: -3,
                                    child: IconButton(
                                      onPressed: () {
                                        // Tapping on it goes to edit my account screen
                                        Get.toNamed(
                                            AppPageNames.editAccountScreen);
                                        controller.getVendorAccountDetails();
                                        controller.update();
                                      },
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(
                                          minHeight: 34, minWidth: 34),
                                      icon: Container(
                                        height: 34,
                                        width: 34,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.primaryColor,
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: SvgPicture.asset(
                                          AppAssetImages.editSVGLogoSolid,
                                          height: 14,
                                          width: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            AppGaps.hGap18,
                            /* <---- Profile name ----> */
                            Text(
                              '${controller.vendorAccountDetails.firstName} ${controller.vendorAccountDetails.lastName}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(),
                            ),
                            AppGaps.hGap8,
                            /* <---- Profile phone number ----> */
                            Text(controller.vendorAccountDetails.phone,
                                style: const TextStyle(
                                    color: AppColors.bodyTextColor)),
                            AppGaps.hGap5,
                            /* <---- Profile email address ----> */
                            Text(controller.vendorAccountDetails.email,
                                style: const TextStyle(
                                    color: AppColors.bodyTextColor)),
                            // AppGaps.hGap32,
                            // CustomHorizontalDashedLineWidget(
                            //     color: AppColors.darkColor.withOpacity(0.1)),
                            // AppGaps.hGap24,
                            /* <---- 'My reviews' list tile button ----> */
                            AppGaps.hGap24,
                            CustomListTileMyAccountWidget(
                                text: LanguageHelper.currentLanguageText(
                                    LanguageHelper.uploadStoreDetailsTransKey),
                                icon: SvgPicture.asset(
                                  AppAssetImages.editSVGLogoLine,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(
                                      AppPageNames.setupStoreInfoScreen);
                                }),
                            /* CustomListTileMyAccountWidget(
                                text: 'Seller Registration',
                                icon: SvgPicture.asset(
                                  AppAssetImages.sendSVGLogoDualTone,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(AppPageNames.storeRegScreen);
                                }), */
                            AppGaps.hGap24,
                            /* <---- 'Insight' list tile button ----> */
                            CustomListTileMyAccountWidget(
                                text: LanguageHelper.currentLanguageText(
                                    LanguageHelper.insightTransKey),
                                icon: SvgPicture.asset(
                                  AppAssetImages.chartSVGLogoDualTone,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(AppPageNames.insightScreen);
                                }),
                            AppGaps.hGap24,
                            /* <---- 'Brand' list tile button ----> */
                            CustomListTileMyAccountWidget(
                                text: AppLanguageTranslation
                                    .couponTransKey.toCurrentLanguage,
                                icon: SvgPicture.asset(
                                  AppAssetImages.couponSVGLogoLine,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(AppPageNames.couponsScreen);
                                }),
                            AppGaps.hGap24,
                            /* <---- 'Brand' list tile button ----> */
                            CustomListTileMyAccountWidget(
                                text: 'Requested Offers',
                                icon: const Icon(
                                  Icons.local_offer,
                                  color: AppColors.primaryColor,
                                  size: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(
                                      AppPageNames.requestedOfferScreen);
                                }),
                            AppGaps.hGap24,
                            /* <---- 'Set Store location' list tile button ----> */
                            CustomListTileMyAccountWidget(
                                text: AppLanguageTranslation
                                    .setStoreLocationTransKey.toCurrentLanguage,
                                icon: SvgPicture.asset(
                                  AppAssetImages.locationSVGLogoLine,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(
                                      AppPageNames.setStoreLocationScreen);
                                }),
                            AppGaps.hGap24,
                            /* <---- 'Brand' list tile button ----> */
                            CustomListTileMyAccountWidget(
                                text: AppLanguageTranslation
                                    .brandTransKey.toCurrentLanguage,
                                icon: SvgPicture.asset(
                                  AppAssetImages.brandSVGLogoDualTone,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(AppPageNames.brandsScreen);
                                }),
                            /* AppGaps.hGap24,
                            /* <---- 'My wallet' list tile button ----> */
                            CustomListTileMyAccountWidget(
                                text: 'My wallet',
                                icon: SvgPicture.asset(
                                  AppAssetImages.walletSVGLogoDualTone,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(AppPageNames.myWalletScreen);
                                }), */

                            AppGaps.hGap24,
                            /* <---- 'My reviews' list tile button ----> */
                            // CustomListTileMyAccountWidget(
                            //     text: 'Stock Management',
                            //     icon: SvgPicture.asset(
                            //       AppAssetImages.stock,
                            //       // color: AppColors.primaryColor,
                            //       height: 24,
                            //       width: 24,
                            //     ),
                            //     onTap: () {
                            //       Get.toNamed(
                            //           AppPageNames.stockManagementScreen);
                            //     }),
                            // AppGaps.hGap24,
                            /* <---- 'My reviews' list tile button ----> */
                            CustomListTileMyAccountWidget(
                                text: LanguageHelper.currentLanguageText(
                                    LanguageHelper.myReviewsTransKey),
                                icon: SvgPicture.asset(
                                  AppAssetImages.starBlowingSVGLogoDualTone,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(AppPageNames.storeReviewsScreen);
                                }),
                            // AppGaps.hGap24,
                            /* /* <---- 'My reviews' list tile button ----> */
                            CustomListTileMyAccountWidget(
                                text: LanguageHelper.currentLanguageText(
                                    LanguageHelper.supportTicketTransKey),
                                icon: SvgPicture.asset(
                                  AppAssetImages.sendSVGLogoDualTone,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(AppPageNames.supportScreen);
                                }), */
                            AppGaps.hGap24,
                            /* <---- 'Terms & conditions' list tile button ----> */
                            CustomListTileMyAccountWidget(
                                text: LanguageHelper.currentLanguageText(
                                    LanguageHelper.termsAndConditionsTransKey),
                                icon: SvgPicture.asset(
                                  AppAssetImages.noteSVGLogoDualTone,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(
                                      AppPageNames.termsConditionScreen);
                                }),

                            AppGaps.hGap24,
                            /*   /* <---- 'Setting' list tile button ----> */
                            CustomListTileMyAccountWidget(
                                text: LanguageHelper.currentLanguageText(
                                    LanguageHelper.deliveryServiceTransKey),
                                icon: SvgPicture.asset(
                                  AppAssetImages.delivery,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(AppPageNames.deliveryService);
                                }),
                            AppGaps.hGap24, */
                            /* <---- 'Setting' list tile button ----> */
                            CustomListTileMyAccountWidget(
                                text: LanguageHelper.currentLanguageText(
                                    LanguageHelper.settingTransKey),
                                icon: SvgPicture.asset(
                                  AppAssetImages.settingSVGLogoDualTone,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () async {
                                  await Get.toNamed(
                                      AppPageNames.settingsScreen);
                                  controller.update();
                                }),
                            // AppGaps.hGap24,
                            // /* <---- 'Setting' list tile button ----> */
                            // CustomListTileMyAccountWidget(
                            //     text: 'Delivery',
                            //     icon: SvgPicture.asset(
                            //       AppAssetImages.settingSVGLogoDualTone,
                            //       color: AppColors.primaryColor,
                            //       height: 24,
                            //       width: 24,
                            //     ),
                            //     onTap: () {
                            //       Get.toNamed(
                            //           context, AppPageNames.pickupScreen);
                            //     }),
                            // AppGaps.hGap24,
                            // /* <---- 'Setting' list tile button ----> */
                            // CustomListTileMyAccountWidget(
                            //     text: 'Delivery',
                            //     icon: SvgPicture.asset(
                            //       AppAssetImages.settingSVGLogoDualTone,
                            //       color: AppColors.primaryColor,
                            //       height: 24,
                            //       width: 24,
                            //     ),
                            //     onTap: () {
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: ((context) => const Deliveries())));
                            //     }),
                            AppGaps.hGap24,
                            // / <---- 'Settings' list tile button ----> /
                            CustomListTileMyAccountWidget(
                                text: LanguageHelper.currentLanguageText(
                                    LanguageHelper.deleteAccountTransKey),
                                icon: SvgPicture.asset(
                                  AppAssetImages.deleteSvg,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Get.toNamed(AppPageNames.deleteAccountScreen);
                                }),

                            AppGaps.hGap24,
                            /* <---- 'Sign out' list tile button ----> */
                            CustomListTileMyAccountWidget(
                                text: LanguageHelper.currentLanguageText(
                                    LanguageHelper.signOutTransKey),
                                icon: SvgPicture.asset(
                                  AppAssetImages.logoutSVGLogoDualTone,
                                  color: AppColors.primaryColor,
                                  height: 24,
                                  width: 24,
                                ),
                                onTap: () {
                                  Helper.logout();
                                  // Get.toNamed( context, AppPageNames.signInScreen);
                                }),
                            // Bottom extra spaces
                            AppGaps.hGap30,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
