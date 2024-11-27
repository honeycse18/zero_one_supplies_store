import 'package:ecomikstoreapp/controller/add_bank_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddBankScreen extends StatelessWidget {
  const AddBankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Get screen size
    // final screenSize = MediaQuery.of(context).size;
    return GetBuilder<AddBankScreenController>(
        init: AddBankScreenController(),
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
                    screenContext: context,
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.addBankTransKey))),
                // appBar: CoreWidgets.appBarWidget(screenContext: context),
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
                          AppGaps.hGap5,
                          Text(
                            LanguageHelper.currentLanguageText(
                                LanguageHelper.bankInfoTransKey),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AppGaps.hGap15,
                          /* <---- User full name text field ----> */
                          TextFormFieldWidget(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.accountHolderNameTransKey),
                            hintText:
                                '  ${LanguageHelper.currentLanguageText(LanguageHelper.accountHolderNameTransKey)}',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.profileSVGLogoLine),
                          ),
                          AppGaps.hGap15,
                          /* <---- User full name text field ----> */
                          TextFormFieldWidget(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.bankNameTransKey),
                            hintText: '  NFD Bank of New York',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.bankSVGLogoLine),
                          ),
                          AppGaps.hGap15,
                          /* <---- Email text field ----> */
                          TextFormFieldWidget(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.branchCodeTransKey),
                            hintText: '  +3892 2839',
                            prefixIcon: SvgPicture.asset(AppAssetImages.branch),
                          ),
                          AppGaps.hGap15,
                          /* <---- Email text field ----> */
                          TextFormFieldWidget(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.accountNumberTransKey),
                            hintText: '  3823 4389 2390',
                            prefixIcon:
                                SvgPicture.asset(AppAssetImages.securitycrd),
                          ),
                          AppGaps.hGap24,
                          /* <---- Password text field ----> */

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
                              LanguageHelper.addBankAccountTransKey),
                          onTap: () {
                            Get.toNamed(AppPageNames.addCardScreen);
                          })
                    ],
                  ),
                ),
              ),
            ));
  }
}
