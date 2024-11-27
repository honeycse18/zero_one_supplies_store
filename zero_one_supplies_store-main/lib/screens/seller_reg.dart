// import 'package:ecomikstoreapp/screens/add_bank_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecomikstoreapp/controller/seller_reg_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StoreRegScreen extends StatelessWidget {
  const StoreRegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellerRegScreenController>(
      init: SellerRegScreenController(),
      global: false,
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
                child: Form(
                  key: controller.sellerRegFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: Image.asset(AppAssetImages.logotext)
                                      .image))),
                      AppGaps.hGap10,
                      HighlightAndDetailTextWidget(
                          isSpaceShorter: true,
                          slogan: LanguageHelper.currentLanguageText(
                              LanguageHelper.sellerRegTransKey),
                          subtitle: ''),
                      AppGaps.hGap15,
                      /* <---- Vendor first name text field ----> */
                      TextFormFieldWidget(
                        controller: controller.firstNameController,
                        validator: controller.nameFormValidator,
                        labelText: LanguageHelper.currentLanguageText(
                            LanguageHelper.firstNameTransKey),
                        hintText: AppLanguageTranslation
                            .addFirstNameTransKey.toCurrentLanguage,
                        prefixIcon:
                            SvgPicture.asset(AppAssetImages.profileSVGLogoLine),
                      ),
                      AppGaps.hGap15,
                      /* <---- Vendor last name text field ----> */
                      TextFormFieldWidget(
                        controller: controller.lastNameController,
                        validator: controller.nameFormValidator,
                        labelText: LanguageHelper.currentLanguageText(
                            LanguageHelper.lastNameTransKey),
                        hintText: AppLanguageTranslation
                            .addLastNameTransKey.toCurrentLanguage,
                        prefixIcon:
                            SvgPicture.asset(AppAssetImages.profileSVGLogoLine),
                      ),
                      AppGaps.hGap15,
                      /* <---- User full name text field ----> */
                      TextFormFieldWidget(
                        labelText: LanguageHelper.currentLanguageText(
                            LanguageHelper.phoneTransKey),
                        controller: controller.phoneController,
                        textInputType: TextInputType.phone,
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CountryCodePicker(
                              initialSelection:
                                  controller.currentCountryCode.code,
                              onChanged: controller.onCountryChange,
                              builder: (country) {
                                return Text(
                                  country?.dialCode ?? '',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.bodyTextColor),
                                );
                              },
                            ),
                            AppGaps.wGap10,
                            Container(
                                height: 26,
                                width: 2,
                                color: AppColors.lineShapeColor),
                          ],
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(maxHeight: 32, maxWidth: 80),
                        hintText: '823 394 939',
                        suffixIconConstraints:
                            const BoxConstraints(minHeight: 32, minWidth: 32),
                      ),
                      AppGaps.hGap15,
                      /* <---- Email text field ----> */
                      TextFormFieldWidget(
                        controller: controller.emailController,
                        validator: controller.emailFormValidator,
                        labelText: LanguageHelper.currentLanguageText(
                            LanguageHelper.emailAddressTransKey),
                        hintText: 'Contact@appstick.com',
                        prefixIcon: Image.asset(AppAssetImages.email),
                      ),
                      AppGaps.hGap24,
                      /* <---- Password text field ----> */
                      Obx(() => TextFormFieldWidget(
                            controller: controller.passwordController,
                            validator: controller.passwordFormValidator,
                            isPasswordTextField:
                                controller.toggleHidePassword.value,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.passwordTransKey),
                            hintText: '********',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.unlockSVGLogoLine),
                            /* <---- Password hide icon button ----> */
                            suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                color: Colors.transparent,
                                onPressed:
                                    controller.onPasswordSuffixEyeButtonTap,
                                icon: SvgPicture.asset(
                                    AppAssetImages.hideSVGLogoLine,
                                    color: controller.toggleHidePassword.value
                                        ? AppColors.bodyTextColor
                                        : AppColors.primaryColor)),
                          )),
                      AppGaps.hGap24,
                      /* <---- Confirm password text field ----> */
                      Obx(() => TextFormFieldWidget(
                            controller: controller.confirmPasswordController,
                            validator: controller.confirmPasswordFormValidator,
                            isPasswordTextField:
                                controller.toggleHideConfirmPassword.value,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.confirmPasswordTransKey),
                            hintText: '********',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.unlockSVGLogoLine),
                            /* <---- Password hide icon button ----> */
                            suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                color: Colors.transparent,
                                onPressed: controller
                                    .onConfirmPasswordSuffixEyeButtonTap,
                                icon: SvgPicture.asset(
                                    AppAssetImages.hideSVGLogoLine,
                                    color: controller
                                            .toggleHideConfirmPassword.value
                                        ? AppColors.bodyTextColor
                                        : AppColors.primaryColor)),
                          )),
                      AppGaps.hGap30,
                    ],
                  ),
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
                        LanguageHelper.signUpTransKey),
                    onTap: controller.onSignUpButtonTap)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
