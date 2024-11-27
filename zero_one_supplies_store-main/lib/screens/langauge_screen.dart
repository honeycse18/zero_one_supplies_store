import 'package:ecomikstoreapp/controller/language_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/language_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageScreenController>(
        init: LanguageScreenController(),
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
                        LanguageHelper.languageTransKey))),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: CustomScrollView(
                    slivers: [
                      // Top extra spaces
                      const SliverToBoxAdapter(child: AppGaps.hGap15),
                      SliverToBoxAdapter(
                        child: Text(
                            LanguageHelper.currentLanguageText(
                                LanguageHelper.selectLanguageTransKey),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: AppColors.primaryColor)),
                      ),
                      const SliverToBoxAdapter(child: AppGaps.hGap16),
                      /* <---- Language choice list ----> */
                      SliverList.separated(
                        itemBuilder: (context, index) {
                          final language = controller.languages[index];
                          return LanguageListTileWidget(
                              // languageFlagLocalAssetFileName: AppAssetImages.usaFlagSVGLogoColor,
                              languageNameText: language.name,
                              isLanguageSelected:
                                  controller.selectedLanguage.id == language.id,
                              onTap: () => controller.onLanguageTap(language));
                        },
                        separatorBuilder: (context, index) => AppGaps.hGap16,
                        itemCount: controller.languages.length,
                      ),
                      // Bottom extra spaces
                      const SliverToBoxAdapter(child: AppGaps.hGap30),
                      // SliverToBoxAdapter(
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.min,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       // Top extra spaces
                      //       AppGaps.hGap15,
                      //       Text('Select language',
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .headlineMedium
                      //               ?.copyWith(color: AppColors.primaryColor)),
                      //       AppGaps.hGap16,
                      //       /* <---- English language choice list tile ----> */

                      //       LanguageListTileWidget(
                      //         onTap: () {
                      //           controller.currentLanguage =
                      //               LanguageSetting.english;
                      //           controller.update();
                      //         },
                      //         languageFlagLocalAssetFileName:
                      //             AppAssetImages.usaFlagSVGLogoColor,
                      //         languageNameText: 'English',
                      //         isLanguageSelected: controller.currentLanguage ==
                      //             LanguageSetting.english,
                      //       ),
                      //       AppGaps.hGap16,
                      //       /* <---- Russian language choice list tile ----> */
                      //       LanguageListTileWidget(
                      //         onTap: () {
                      //           controller.currentLanguage =
                      //               LanguageSetting.russian;
                      //           controller.update();
                      //         },
                      //         languageFlagLocalAssetFileName:
                      //             AppAssetImages.russiaFlagSVGLogoColor,
                      //         languageNameText: 'Russian',
                      //         isLanguageSelected: controller.currentLanguage ==
                      //             LanguageSetting.russian,
                      //       ),
                      //       AppGaps.hGap16,
                      //       /* <---- French language choice list tile ----> */
                      //       LanguageListTileWidget(
                      //         onTap: () {
                      //           controller.currentLanguage =
                      //               LanguageSetting.french;
                      //           controller.update();
                      //         },
                      //         languageFlagLocalAssetFileName:
                      //             AppAssetImages.franceFlagSVGLogoColor,
                      //         languageNameText: 'French',
                      //         isLanguageSelected: controller.currentLanguage ==
                      //             LanguageSetting.french,
                      //       ),
                      //       AppGaps.hGap16,
                      //       /* <---- Canada language choice list tile ----> */
                      //       LanguageListTileWidget(
                      //         onTap: () {
                      //           controller.currentLanguage =
                      //               LanguageSetting.canada;
                      //           controller.update();
                      //         },
                      //         languageFlagLocalAssetFileName:
                      //             AppAssetImages.canadaFlagSVGLogoColor,
                      //         languageNameText: 'Canada',
                      //         isLanguageSelected: controller.currentLanguage ==
                      //             LanguageSetting.canada,
                      //       ),
                      //       AppGaps.hGap16,
                      //       /* <---- Australia language choice list tile ----> */
                      //       LanguageListTileWidget(
                      //         onTap: () {
                      //           controller.currentLanguage =
                      //               LanguageSetting.australian;
                      //           controller.update();
                      //         },
                      //         languageFlagLocalAssetFileName:
                      //             AppAssetImages.australiaFlagSVGLogoColor,
                      //         languageNameText: 'Australia',
                      //         isLanguageSelected: controller.currentLanguage ==
                      //             LanguageSetting.australian,
                      //       ),
                      //       AppGaps.hGap16,
                      //       /* <---- German language choice list tile ----> */
                      //       LanguageListTileWidget(
                      //         onTap: () {
                      //           controller.currentLanguage =
                      //               LanguageSetting.german;
                      //           controller.update();
                      //         },
                      //         languageFlagLocalAssetFileName:
                      //             AppAssetImages.germanFlagSVGLogoColor,
                      //         languageNameText: 'German',
                      //         isLanguageSelected: controller.currentLanguage ==
                      //             LanguageSetting.german,
                      //       ),
                      //       // Bottom extra spaces
                      //       AppGaps.hGap30,
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ));
  }
}
