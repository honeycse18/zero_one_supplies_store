import 'package:ecomikstoreapp/controller/verify_password_email_otp_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PasswordRecoveryEmailPromptScreen extends StatelessWidget {
  const PasswordRecoveryEmailPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordEmailOtpController>(
        init: ResetPasswordEmailOtpController(),
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
                          AppGaps.hGap80,
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                    AppAssetImages.passwordRecoveryIllustration,
                                    height: 240),
                                AppGaps.hGap20,
                                Text(
                                    LanguageHelper.currentLanguageText(
                                        LanguageHelper
                                            .passWordRecoveryTransKey),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall),
                                AppGaps.hGap16,
                                Text(
                                    LanguageHelper.currentLanguageText(
                                        LanguageHelper
                                            .pleaseConfirmYourEmailTransKey),
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
                          /* <---- Country selection text field ----> */
                          TextFormFieldWidget(
                            controller: controller.emailTextEditingController,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.emailAddressTransKey),
                            hintText: 'contact@gmail.com',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.messageSVGLogoLine),
                          ),
                          AppGaps.hGap30,
                        ],
                      ),
                    ),
                  ),
                ),
                /* <-------- Bottom bar of sign up text --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                  child: CustomStretchedTextButtonWidget(
                      isLoading: controller.isLoading,
                      buttonText: LanguageHelper.currentLanguageText(
                          LanguageHelper.sendCodeTransKey),
                      onTap: controller.onSendCodeButtonTap
                      /* () {
                        Get.toNamed(context,
                            AppPageNames.passwordRecoveryVerificationScreen);
                      } */
                      ),
                ),
              ),
            ));
  }
}
