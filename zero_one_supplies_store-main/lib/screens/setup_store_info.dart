import 'package:ecomikstoreapp/controller/setup_store_info_controller.dart';
import 'package:ecomikstoreapp/models/api_responses/store_categories_response.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SetupStoreInfoScreen extends StatelessWidget {
  const SetupStoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetupStoreInfoController>(
        global: false,
        init: SetupStoreInfoController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Empty appbar with back button --------> */
                /* <-------- Appbar --------> */
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context, titleWidget: const Text('')),
                // appBar: CoreWidgets.appBarWidget(screenContext: context),
                /* <-------- Content --------> */
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppGaps.screenPaddingValue),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          Image.asset(AppAssetImages.logotext)
                                              .image))),
                          AppGaps.hGap10,
                          HighlightAndDetailTextWidget(
                              isSpaceShorter: true,
                              slogan: LanguageHelper.currentLanguageText(
                                  LanguageHelper.setupStoreInformationTransKey),
                              subtitle: ''),
                          AppGaps.hGap15,
                          /* <---- User full name text field ----> */
                          //==================================
                          TextFormFieldWidget(
                            controller: controller.storeNameController,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.storeNameTransKey),
                            hintText: AppLanguageTranslation
                                .storeNameTransKey.toCurrentLanguage,
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.shopSVGLogoLine),
                          ),
                          AppGaps.hGap15,

                          DropdownButtonFormFieldWidget<StoreCategory>(
                              items: controller.storeCategories,
                              getItemText: (value) => value.name,
                              hintText: LanguageHelper.currentLanguageText(
                                  LanguageHelper.categoriesTransKey),
                              labelText: LanguageHelper.currentLanguageText(
                                  LanguageHelper.categoriesTransKey),
                              value: controller.selectedStoreCategory,
                              onChanged: controller.onStoreCategoryChanged),
                          AppGaps.hGap15,
                          /* <---- Email text field ----> */
                          TextFormFieldWidget(
                            controller: controller.locationController,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.locationTransKey),
                            hintText: AppLanguageTranslation
                                .locationTransKey.toCurrentLanguage,
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.locationSVGLogoLine),
                          ),
                          AppGaps.hGap15,
                          /* <---- Email text field ----> */
                          TextFormFieldWidget(
                            controller: controller.descriptionController,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.descriptionTransKey),
                            hintText: AppLanguageTranslation
                                .descriptionTransKey.toCurrentLanguage,
                            prefixIcon:
                                SvgPicture.asset(AppAssetImages.document),
                          ),
/*                          AppGaps.hGap15,
                           /* <---- Email text field ----> */
                          CustomTextFormField(
                            controller: controller.taxNameController,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.taxNameTransKey),
                            hintText:AppLanguageTranslation.yourNameTransKey.toCurrentLanguage,
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.profileSVGLogoLine),
                          ),

                          AppGaps.hGap24,
                          CustomTextFormField(
                            controller: controller.taxNumberController,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.taxNumberTransKey),
                            hintText: AppLanguageTranslation.taxNumberTransKey.toCurrentLanguage,
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.profileSVGLogoLine),
                          ), */

                          AppGaps.hGap24,
                          TextFormFieldWidget(
                            controller: controller.nidNumberController,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.nidNumberTransKey),
                            hintText: AppLanguageTranslation
                                .nidNumberTransKey.toCurrentLanguage,
                            prefixIcon: SvgPicture.asset(AppAssetImages.task),
                          ),
                          AppGaps.hGap24,
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                LanguageHelper.currentLanguageText(
                                    LanguageHelper.storeLogoTransKey),
                                style: const TextStyle(
                                    color: AppColors.darkColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          AppGaps.hGap10,
                          Container(
                            height: 126,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(18))),
                            child: Builder(
                                builder: (context) => controller
                                        .vendorDetails.store.logo.isEmpty
                                    ? SelectImageButton(
                                        onTap: controller
                                            .onStoreLogoImageButtonTap)
                                    : SelectedNetworkImageWidget(
                                        imageURL:
                                            controller.vendorDetails.store.logo,
                                        onEditButtonTap: controller
                                            .onStoreLogoImageButtonTap,
                                      )),
                          ),
                          AppGaps.hGap24,
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                LanguageHelper.currentLanguageText(
                                    LanguageHelper
                                        .nationalIdentityNumberTransKey),
                                style: const TextStyle(
                                    color: AppColors.darkColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          AppGaps.hGap10,
                          Container(
                            height: 126,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(18))),
                            child: Builder(
                                builder: (context) => controller
                                        .vendorDetails.store.nidImage.isEmpty
                                    ? SelectImageButton(
                                        onTap:
                                            controller.onNIDCardImageButtonTap)
                                    : SelectedNetworkImageWidget(
                                        imageURL: controller
                                            .vendorDetails.store.nidImage,
                                        onEditButtonTap:
                                            controller.onNIDCardImageButtonTap,
                                      )),
                          ),
                          AppGaps.hGap24,
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                LanguageHelper.currentLanguageText(
                                    LanguageHelper.addressProofTransKey),
                                style: const TextStyle(
                                    color: AppColors.darkColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          AppGaps.hGap10,
                          Container(
                            height: 126,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(18))),
                            child: Builder(
                                builder: (context) => controller.vendorDetails
                                        .store.addressProof.isEmpty
                                    ? SelectImageButton(
                                        onTap: controller
                                            .onAddressProofImageButtonTap)
                                    : SelectedNetworkImageWidget(
                                        imageURL: controller
                                            .vendorDetails.store.addressProof,
                                        onEditButtonTap: controller
                                            .onAddressProofImageButtonTap,
                                      )),
                          ),
                          AppGaps.hGap30,
                        ],
                      ),
                    ),
                  ),
                ),

                /* <-------- Bottom bar of sign up text --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /* <---- Sign up text button ----> */
                      CustomStretchedTextButtonWidget(
                          isLoading: controller.isLoading,
                          buttonText: LanguageHelper.currentLanguageText(
                              LanguageHelper.applyNowTransKey),
                          onTap: controller.onApplyNowButtonTap)
                    ],
                  ),
                ),
              ),
            ));
  }
}
