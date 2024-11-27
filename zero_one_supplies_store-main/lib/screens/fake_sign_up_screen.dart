import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  /// Toggle value of hide password
  bool _toggleHidePassword = true;

  /// Toggle value of agree terms and conditions
  bool _toggleAgreeTermsConditions = false;

  @override
  Widget build(BuildContext context) {
    /// Get screen size
    final screenSize = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: Image.asset(AppAssetImages.backgroundScreen).image,
              fit: BoxFit.fill)),
      child: Scaffold(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset(AppAssetImages.logoAndText)
                                  .image))),
                  AppGaps.hGap10,
                  Center(
                    child: HighlightAndDetailTextWidget(
                        isSpaceShorter: true,
                        slogan: LanguageHelper.currentLanguageText(
                            LanguageHelper.gettingStartedTransKey),
                        subtitle: LanguageHelper.currentLanguageText(
                            LanguageHelper.helloThereTransKey)),
                  ),
                  AppGaps.hGap24,
                  /* <---- User full name text field ----> */
                  TextFormFieldWidget(
                    labelText: LanguageHelper.currentLanguageText(
                        LanguageHelper.yourNameTransKey),
                    hintText: LanguageHelper.currentLanguageText(
                        LanguageHelper.yourNameTransKey),
                    prefixIcon:
                        SvgPicture.asset(AppAssetImages.profileSVGLogoLine),
                  ),
                  AppGaps.hGap24,
                  /* <---- Email text field ----> */
                  TextFormFieldWidget(
                    labelText: LanguageHelper.currentLanguageText(
                        LanguageHelper.emailAddressTransKey),
                    hintText: 'contact@gmail.com',
                    prefixIcon:
                        SvgPicture.asset(AppAssetImages.messageSVGLogoLine),
                  ),
                  AppGaps.hGap24,
                  /* <---- Password text field ----> */
                  TextFormFieldWidget(
                    isPasswordTextField: _toggleHidePassword,
                    labelText: LanguageHelper.currentLanguageText(
                        LanguageHelper.passwordTransKey),
                    hintText: '********',
                    prefixIcon:
                        SvgPicture.asset(AppAssetImages.unlockSVGLogoLine),
                    suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity),
                        color: Colors.transparent,
                        onPressed: () => setState(
                            () => _toggleHidePassword = !_toggleHidePassword),
                        icon: SvgPicture.asset(AppAssetImages.hideSVGLogoLine,
                            color: _toggleHidePassword
                                ? AppColors.bodyTextColor
                                : AppColors.primaryColor)),
                  ),
                  AppGaps.hGap24,
                  /* <---- Terms and conditions CheckBox ----> */
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: screenSize.width < 458
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: Checkbox(
                              value: _toggleAgreeTermsConditions,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              onChanged: (value) => setState(() =>
                                  _toggleAgreeTermsConditions =
                                      value ?? false)),
                        ),
                      ),
                      AppGaps.wGap16,
                      Expanded(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(LanguageHelper.currentLanguageText(
                                LanguageHelper.bySigningUpTransKey)),
                            CustomTightTextButtonWidget(
                                onTap: () {},
                                child: Text(
                                  LanguageHelper.currentLanguageText(
                                      LanguageHelper.termsOfServiceTransKey),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.primaryColor),
                                )),
                            Text(LanguageHelper.currentLanguageText(
                                LanguageHelper.andSpacedTransKey)),
                            CustomTightTextButtonWidget(
                                onTap: () {},
                                child: Text(
                                  LanguageHelper.currentLanguageText(
                                      LanguageHelper.privacyPolicyTransKey),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.primaryColor),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Bottom extra spaces
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
                  buttonText: LanguageHelper.currentLanguageText(
                      LanguageHelper.signUpTransKey),
                  onTap: _toggleAgreeTermsConditions
                      ? () {
                          Get.toNamed(AppPageNames.signUpSuccessScreen);
                        }
                      : null),
              AppGaps.hGap19,
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      LanguageHelper.currentLanguageText(
                          LanguageHelper.alreadyHaveAnAccountTransKey),
                      style: const TextStyle(color: AppColors.bodyTextColor)),
                  AppGaps.wGap5,
                  /* <---- Sign in TextButton ----> */
                  CustomTightTextButtonWidget(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                        LanguageHelper.currentLanguageText(
                            LanguageHelper.signInTransKey),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.primaryColor)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
