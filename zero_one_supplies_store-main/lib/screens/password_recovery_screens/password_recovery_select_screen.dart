import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/password_recovery_select_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordRecoverySelectScreen extends StatefulWidget {
  const PasswordRecoverySelectScreen({super.key});

  @override
  State<PasswordRecoverySelectScreen> createState() =>
      _PasswordRecoverySelectScreenState();
}

class _PasswordRecoverySelectScreenState
    extends State<PasswordRecoverySelectScreen> {
  /// Reset password choice
  ResetPasswordSelectedChoice _currentlySelectedChoice =
      ResetPasswordSelectedChoice.none;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: Image.asset(AppAssetImages.backgroundFullPng).image,
              fit: BoxFit.fill)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        /* <-------- Empty appbar with back button --------> */
        appBar: CoreWidgets.appBarWidget(screenContext: context),
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
                  // Top extra spaces
                  AppGaps.hGap80,
                  /* <---- Verification icon and text ----> */
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppGaps.hGap20,
                        Text(
                            LanguageHelper.currentLanguageText(
                                LanguageHelper.resetYourPasswordTransKey),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displaySmall),
                        AppGaps.hGap16,
                        Text(
                            LanguageHelper.currentLanguageText(
                                LanguageHelper.willBeSentTransKey),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: AppColors.bodyTextColor,
                                    overflow: TextOverflow.clip)),
                      ],
                    ),
                  ),
                  AppGaps.hGap40,
                  /* <---- Email option select ----> */
                  Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SelectResetPasswordWidget(
                        titleText: LanguageHelper.currentLanguageText(
                            LanguageHelper.sendToYourMailTransKey),
                        contentText: LanguageHelper.currentLanguageText(
                            LanguageHelper.sendToYourMailSubtitleTransKey),
                        isSelected: _currentlySelectedChoice ==
                            ResetPasswordSelectedChoice.mail,
                        currentSelectedRadioValue:
                            ResetPasswordSelectedChoice.mail,
                        groupRadioValue: _currentlySelectedChoice,
                        localSVGIconName: AppAssetImages.messageSVGLogoLine,
                        onTap: () => setState(() => _currentlySelectedChoice =
                            ResetPasswordSelectedChoice.mail),
                      ),
                      AppGaps.hGap24,
                      SelectResetPasswordWidget(
                        titleText: LanguageHelper.currentLanguageText(
                            LanguageHelper.sendToYourPhoneTransKey),
                        contentText: LanguageHelper.currentLanguageText(
                            LanguageHelper.sendToYourPhoneSubtitleTransKey),
                        currentSelectedRadioValue:
                            ResetPasswordSelectedChoice.phoneNumber,
                        groupRadioValue: _currentlySelectedChoice,
                        isSelected: _currentlySelectedChoice ==
                            ResetPasswordSelectedChoice.phoneNumber,
                        localSVGIconName: AppAssetImages.phoneSVGLogoLine,
                        onTap: () => setState(() => _currentlySelectedChoice =
                            ResetPasswordSelectedChoice.phoneNumber),
                      ),
                    ],
                  )),
                  AppGaps.hGap30,
                ],
              ),
            ),
          ),
        ),
        /* <-------- Bottom bar of sign up text --------> */
        bottomNavigationBar: CustomScaffoldBottomBarWidget(
          child: CustomStretchedTextButtonWidget(
              buttonText: LanguageHelper.currentLanguageText(
                  LanguageHelper.resetPasswordTransKey),
              onTap: _currentlySelectedChoice ==
                      ResetPasswordSelectedChoice.none
                  ? null
                  : _currentlySelectedChoice == ResetPasswordSelectedChoice.mail
                      ? () {
                          Get.toNamed(
                              AppPageNames.passwordRecoveryEmailPromptScreen);
                        }
                      : () {
                          Get.toNamed(
                              AppPageNames.passwordRecoveryPromptScreen);
                        }),
        ),
      ),
    );
  }
}
