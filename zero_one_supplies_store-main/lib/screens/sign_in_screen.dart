import 'package:ecomikstoreapp/controller/sign_in_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
      global: false,
      builder: (controller) => DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: Image.asset(AppAssetImages.backgroundScreen).image,
                fit: BoxFit.fill)),
        child: Scaffold(
          /* <-------- Empty appbar --------> */
          appBar: CoreWidgets.appBarWidget(
              screenContext: context, hasBackButton: false),
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
                                image: Image.asset(AppAssetImages.logoAndText)
                                    .image))),
                    AppGaps.hGap10,
                    HighlightAndDetailTextWidget(
                        isSpaceShorter: true,
                        slogan: LanguageHelper.currentLanguageText(
                            LanguageHelper.welcome01SuppliesTransKey),
                        subtitle: LanguageHelper.currentLanguageText(
                            LanguageHelper.helloThereSignInToContinueTransKey)),
                    AppGaps.hGap24,
                    /* <---- Email text field ----> */
                    TextFormFieldWidget(
                      controller: controller.emailTextEditingController,
                      labelText: LanguageHelper.currentLanguageText(
                          LanguageHelper.emailAddressTransKey),
                      hintText: 'contact@gmail.com',
                      prefixIcon:
                          SvgPicture.asset(AppAssetImages.messageSVGLogoLine),
                    ),
                    AppGaps.hGap24,
                    /* <---- Password text field ----> */
                    Obx(() => TextFormFieldWidget(
                          controller: controller.passTextEditingController,
                          hasShadow: false,
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
                              onPressed: controller.onPasswordHideButtonTap,
                              icon: SvgPicture.asset(
                                  AppAssetImages.hideSVGLogoLine,
                                  color: controller.toggleHidePassword.value
                                      ? AppColors.bodyTextColor
                                      : AppColors.primaryColor)),
                        )),
                    AppGaps.hGap24,
                    /* <---- Remember me, forget password row ----> */
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /* <---- Remember me toggle button ----> */
                            Obx(() => FlutterSwitch(
                                value: controller.toggleRememberLogin.value,
                                width: 35,
                                height: 20,
                                toggleSize: 12,
                                activeColor: AppColors.primaryColor,
                                onToggle: controller.onToggleRememberMe)),
                            AppGaps.wGap8,
                            Obx(() => Text(
                                LanguageHelper.currentLanguageText(
                                    LanguageHelper.rememberMeTransKey),
                                style: TextStyle(
                                    color: controller.toggleRememberLogin.value
                                        ? AppColors.primaryColor
                                        : AppColors.bodyTextColor))),
                          ],
                        ),
                        /* <---- Forget password? text button ----> */
                        CustomTightTextButtonWidget(
                          onTap: controller.onForgetPasswordButtonTap,
                          child: Text(
                              LanguageHelper.currentLanguageText(
                                  LanguageHelper.forgotPasswordTransKey),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.alertColor)),
                        ),
                      ],
                    ),
                    AppGaps.hGap48,
                    /* <---- Sign in button ----> */
                    CustomStretchedTextButtonWidget(
                        isLoading: controller.isLoading,
                        buttonText: LanguageHelper.currentLanguageText(
                            LanguageHelper.signInTransKey),
                        onTap: controller
                            .onSignInButtonTap /* () {
                          // Goto home screen
                          Get.toNamed(context, AppPageNames.homeScreen);
                        } */
                        ),
                    // AppGaps.hGap48,
                    /*  Center(
                        child: Text('Or Sign in with social account',
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: AppColors.bodyTextColor,
                                    ))),
                    AppGaps.hGap48, */
                    /* <---- Social buttons row ----> */
                    /* Center(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /* <---- Google icon button ----> */
                        CustomIconButtonWidget(
                            border: Border.all(color: AppColors.lineShapeColor),
                            child: SvgPicture.asset(
                                AppAssetImages.googleSVGLogoColor),
                            onTap: () {}),
                        AppGaps.wGap15,
                        /* <---- Apple sign in icon button ----> */
                        CustomIconButtonWidget(
                            border: Border.all(color: AppColors.lineShapeColor),
                            child: SvgPicture.asset(
                                AppAssetImages.appleSVGLogoColor),
                            onTap: () {}),
                        AppGaps.wGap15,
                        /* <---- Twitter icon button ----> */
                        CustomIconButtonWidget(
                            border: Border.all(color: AppColors.lineShapeColor),
                            child: SvgPicture.asset(
                                AppAssetImages.twitterSVGLogoColor),
                            onTap: () {})
                      ],
                    )), */
                    // Bottom extra spaces
                    // AppGaps.hGap30,
                  ],
                ),
              ),
            ),
          ),
          /* <-------- Bottom bar of sign up text --------> */
          bottomNavigationBar: CustomScaffoldBottomBarWidget(
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                    LanguageHelper.currentLanguageText(
                        LanguageHelper.rememberMeTransKey),
                    style: const TextStyle(color: AppColors.bodyTextColor)),
                AppGaps.wGap5,
                /* <---- Sign up TextButton ----> */
                CustomTightTextButtonWidget(
                  onTap: () {
                    // Goto sign up screen.
                    Get.toNamed(AppPageNames.storeRegScreen);
                  },
                  child: Text('Sign up',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.primaryColor)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
