import 'package:ecomikstoreapp/controller/reset_password_otp_verification_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class PasswordRecoveryVerificationScreen extends StatelessWidget {
  const PasswordRecoveryVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordOtpVerificationController>(
        init: ResetPasswordOtpVerificationController(),
        global: false,
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
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
                                Image.asset(
                                    AppAssetImages.verificationIllustration,
                                    height: 240),
                                AppGaps.hGap20,
                                (controller.otpScreenParameter.type == 'phone')
                                    ? HighlightAndDetailTextWidget(
                                        slogan:
                                            LanguageHelper.currentLanguageText(
                                                LanguageHelper
                                                    .verificationTransKey),
                                        subtitle:
                                            '${LanguageHelper.currentLanguageText(LanguageHelper.sentToNumberWhichIsTransKey)} ${controller.otpScreenParameter.userInput}')
                                    : HighlightAndDetailTextWidget(
                                        slogan:
                                            LanguageHelper.currentLanguageText(
                                                LanguageHelper
                                                    .verificationTransKey),
                                        subtitle:
                                            '${LanguageHelper.currentLanguageText(LanguageHelper.sentToMailWhichIsTransKey)} ${controller.otpScreenParameter.userInput}')
                              ],
                            ),
                          ),
                          AppGaps.hGap40,
                          /* <---- OTP input field ----> */
                          Pinput(
                            controller: controller.otpInputTextController,
                            length: 4,
                            focusedPinTheme: PinTheme(
                              width: 56,
                              height: 56,
                              textStyle:
                                  const TextStyle(color: AppColors.darkColor),
                              decoration: BoxDecoration(
                                color: AppColors.shadeColor2,
                                border: Border.all(
                                    color: AppColors.primaryColor, width: 2),
                                borderRadius: const BorderRadius.all(
                                    AppComponents.defaultBorderRadius),
                              ),
                            ),
                            errorPinTheme: PinTheme(
                              width: 56,
                              height: 56,
                              textStyle: const TextStyle(
                                color: Colors.red,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius: const BorderRadius.all(
                                    AppComponents.defaultBorderRadius),
                              ),
                            ),
                            submittedPinTheme: const PinTheme(
                              width: 56,
                              height: 56,
                              textStyle: TextStyle(color: Colors.white),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.all(
                                    AppComponents.defaultBorderRadius),
                              ),
                            ),
                            followingPinTheme: PinTheme(
                              width: 56,
                              height: 56,
                              textStyle: const TextStyle(
                                  color: AppColors.darkColor,
                                  fontWeight: FontWeight.w600),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: AppColors.lineShapeColor),
                                borderRadius: const BorderRadius.all(
                                    AppComponents.defaultBorderRadius),
                              ),
                            ),
                          ),
                          AppGaps.hGap24,
                          Center(
                              child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(LanguageHelper.currentLanguageText(
                                  LanguageHelper.resendCodeInTransKey)),
                              /* <---- Resend otp code remaining text ----> */
                              Text(
                                  '${controller.otpTimerDuration.inMinutes.toString().padLeft(2, '0')}'
                                  ':${(controller.otpTimerDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                                  style: const TextStyle(
                                      color: AppColors.primaryColor)),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomStretchedTextButtonWidget(
                          isLoading: controller.isLoading,
                          buttonText: LanguageHelper.currentLanguageText(
                              LanguageHelper.submitCodeTransKey),
                          onTap: () {
                            controller.onSendCodeButtonTap();
                          }),
                      TextButton(
                          onPressed: controller.isDurationOver()
                              ? () {
                                  controller.onResendButtonTap();
                                }
                              : null,
                          child: Text(
                              LanguageHelper.currentLanguageText(
                                  LanguageHelper.resendTransKey),
                              style:
                                  const TextStyle(color: AppColors.darkColor))),
                    ],
                  ),
                ),
              ),
            ));
  }
}
