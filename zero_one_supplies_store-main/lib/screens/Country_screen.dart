import 'package:ecomikstoreapp/controller/country_screen_controller.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/language_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  /// Currently selected language

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountryScreenController>(
        init: CountryScreenController(),
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
                        LanguageHelper.countryTransKey))),
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
                                LanguageHelper.selectCountryTransKey),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: AppColors.primaryColor)),
                        AppGaps.hGap16,
                        /* <---- English language choice list tile ----> */
                        LanguageListTileWidget(
                          onTap: () {
                            controller.currentLanguage =
                                LanguageSetting.english;
                            controller.update();
                          },
                          languageFlagLocalAssetFileName:
                              AppAssetImages.usaFlagSVGLogoColor,
                          languageNameText: 'USA',
                          isLanguageSelected: controller.currentLanguage ==
                              LanguageSetting.english,
                        ),
                        AppGaps.hGap16,
                        /* <---- Russian language choice list tile ----> */
                        LanguageListTileWidget(
                          onTap: () {
                            controller.currentLanguage =
                                LanguageSetting.russian;
                            controller.update();
                          },
                          languageFlagLocalAssetFileName:
                              AppAssetImages.russiaFlagSVGLogoColor,
                          languageNameText: 'Russia',
                          isLanguageSelected: controller.currentLanguage ==
                              LanguageSetting.russian,
                        ),
                        AppGaps.hGap16,
                        /* <---- French language choice list tile ----> */
                        LanguageListTileWidget(
                          onTap: () {
                            controller.currentLanguage = LanguageSetting.french;
                            controller.update();
                          },
                          languageFlagLocalAssetFileName:
                              AppAssetImages.franceFlagSVGLogoColor,
                          languageNameText: 'France',
                          isLanguageSelected: controller.currentLanguage ==
                              LanguageSetting.french,
                        ),
                        AppGaps.hGap16,
                        /* <---- Canada language choice list tile ----> */
                        LanguageListTileWidget(
                          onTap: () {
                            controller.currentLanguage = LanguageSetting.canada;
                            controller.update();
                          },
                          languageFlagLocalAssetFileName:
                              AppAssetImages.canadaFlagSVGLogoColor,
                          languageNameText: 'Canada',
                          isLanguageSelected: controller.currentLanguage ==
                              LanguageSetting.canada,
                        ),
                        AppGaps.hGap16,
                        /* <---- Australia language choice list tile ----> */
                        LanguageListTileWidget(
                          onTap: () {
                            controller.currentLanguage =
                                LanguageSetting.australian;
                            controller.update();
                          },
                          languageFlagLocalAssetFileName:
                              AppAssetImages.australiaFlagSVGLogoColor,
                          languageNameText: 'Australia',
                          isLanguageSelected: controller.currentLanguage ==
                              LanguageSetting.australian,
                        ),
                        AppGaps.hGap16,
                        /* <---- German language choice list tile ----> */
                        LanguageListTileWidget(
                          onTap: () {
                            controller.currentLanguage = LanguageSetting.german;
                            controller.update();
                          },
                          languageFlagLocalAssetFileName:
                              AppAssetImages.germanFlagSVGLogoColor,
                          languageNameText: 'German',
                          isLanguageSelected: controller.currentLanguage ==
                              LanguageSetting.german,
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
