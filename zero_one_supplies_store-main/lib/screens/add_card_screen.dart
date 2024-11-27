import 'package:ecomikstoreapp/controller/add_card_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  /// Toggle value of hide password

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCardScreenController>(
        init: AddCardScreenController(),
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
                        LanguageHelper.addCardTransKey))),
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
                                LanguageHelper.cardInfoTransKey),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          AppGaps.hGap15,
                          /* <---- User full name text field ----> */
                          TextFormFieldWidget(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.nameOnCardTransKey),
                            hintText: AppLanguageTranslation
                                .cardNameTransKey.toCurrentLanguage,
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.cardSVGLogoLine),
                          ),
                          AppGaps.hGap15,
                          /* <---- User full name text field ----> */

                          Obx(() => TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.cardNumberTransKey),
                                isPasswordTextField:
                                    controller.toggleHidePassword.value,
                                hintText: '  **** ***** ****',
                                prefixIcon: SvgPicture.asset(
                                    AppAssetImages.unlockSVGLogoLine),
                                suffixIcon: IconButton(
                                    padding: EdgeInsets.zero,
                                    visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity),
                                    color: Colors.transparent,
                                    onPressed: () {
                                      controller.toggleHidePassword.value =
                                          !controller.toggleHidePassword.value;
                                      controller.update();
                                    },
                                    icon: SvgPicture.asset(
                                        AppAssetImages.hideSVGLogoLine,
                                        color:
                                            controller.toggleHidePassword.value
                                                ? AppColors.bodyTextColor
                                                : AppColors.primaryColor)),
                              )),
                          AppGaps.hGap15,
                          Row(
                            children: [
                              Expanded(
                                //width: 150,
                                child: TextFormFieldWidget(
                                  labelText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.expirationTransKey),
                                  hintText: '  02/11/21',
                                  prefixIcon: SvgPicture.asset(
                                      AppAssetImages.calenderSVGLogoLine),
                                ),
                                // const Spacer()
                              ),
                              AppGaps.wGap10,
                              Expanded(
                                // width: 150,
                                child: TextFormFieldWidget(
                                  labelText: 'Cvv',
                                  hintText: '  398',
                                  prefixIcon: SvgPicture.asset(
                                      AppAssetImages.editSVGLogoLine),
                                ),
                              )
                            ],
                          ),
                          AppGaps.hGap15,
                          /* <---- Email text field ----> */
                          TextFormFieldWidget(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.postalCodeTransKey),
                            hintText: '  6 3 5 0',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.routesquareSVGLogoLine),
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
                              LanguageHelper.addCardTransKey),
                          onTap: () {
                            Get.toNamed(AppPageNames.addPaypalScreen);
                          })
                    ],
                  ),
                ),
              ),
            ));
  }
}
