import 'package:ecomikstoreapp/controller/currency_screen_controller.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/language_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  /// Currently selected language

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrencyScreenController>(
        init: CurrencyScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Appbar --------> */
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context,
                    hasBackButton: true,
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.currencyTransKey))),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top extra spaces
                        AppGaps.hGap15,
                        Text(
                            LanguageHelper.currentLanguageText(
                                LanguageHelper.selectCurrencyTransKey),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: AppColors.primaryColor)),
                        AppGaps.hGap16,
                        /* <---- English language choice list tile ----> */
                        LanguageListTileWidget(
                          onTap: () {
                            controller.currentCurrency =
                                CurrencySetting.english;
                            controller.update();
                          },
                          languageFlagLocalAssetFileName:
                              AppAssetImages.usaFlagSVGLogoColor,
                          languageNameText: 'USD',
                          isLanguageSelected: controller.currentCurrency ==
                              CurrencySetting.english,
                        ),
                        AppGaps.hGap16,
                        /* <---- Russian language choice list tile ----> */
                        LanguageListTileWidget(
                          onTap: () {
                            controller.currentCurrency =
                                CurrencySetting.russian;
                            controller.update();
                          },
                          languageFlagLocalAssetFileName: AppAssetImages.gbpsvg,
                          languageNameText: 'GBP',
                          isLanguageSelected: controller.currentCurrency ==
                              CurrencySetting.russian,
                        ),
                        AppGaps.hGap16,
                        /* <---- French language choice list tile ----> */
                        LanguageListTileWidget(
                          onTap: () {
                            controller.currentCurrency = CurrencySetting.bdt;
                            controller.update();
                          },
                          languageFlagLocalAssetFileName: AppAssetImages.bdtsvg,
                          languageNameText: 'BDT',
                          isLanguageSelected:
                              controller.currentCurrency == CurrencySetting.bdt,
                        ),
                        AppGaps.hGap16,
                        /* <---- Canada language choice list tile ----> */
                        LanguageListTileWidget(
                          onTap: () {
                            controller.currentCurrency = CurrencySetting.canada;
                            controller.update();
                          },
                          languageFlagLocalAssetFileName:
                              AppAssetImages.canadaFlagSVGLogoColor,
                          languageNameText: 'CAD',
                          isLanguageSelected: controller.currentCurrency ==
                              CurrencySetting.canada,
                        ),
                        AppGaps.hGap16,
                        /* <---- Australia language choice list tile ----> */
                        LanguageListTileWidget(
                          onTap: () {
                            controller.currentCurrency =
                                CurrencySetting.australian;
                            controller.update();
                          },
                          languageFlagLocalAssetFileName:
                              AppAssetImages.australiaFlagSVGLogoColor,
                          languageNameText: 'AUS',
                          isLanguageSelected: controller.currentCurrency ==
                              CurrencySetting.australian,
                        ),
                        AppGaps.hGap16,
                        /* <---- German language choice list tile ----> */
                        LanguageListTileWidget(
                          onTap: () {
                            controller.currentCurrency = CurrencySetting.german;
                            controller.update();
                          },
                          languageFlagLocalAssetFileName: AppAssetImages.jpysvg,
                          languageNameText: 'JPY',
                          isLanguageSelected: controller.currentCurrency ==
                              CurrencySetting.german,
                        ),
                        // Bottom extra spaces
                        AppGaps.hGap30,
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
