import 'package:ecomikstoreapp/controller/settings.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/settings_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  /// Toggle value of notification
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsScreenController>(
        init: SettingsScreenController(),
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
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.settingTransKey))),
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
                                LanguageHelper.preferenceTransKey),
                            style: Theme.of(context).textTheme.headlineMedium),
                        AppGaps.hGap16,
                        /* <---- 'Country' List Tile ----> */
                        /* SettingsListTileWidget(
                            titleText: 'Country',
                            valueWidget:
                                const SettingsValueTextWidget(text: 'USA'),
                            onTap: () {
                              Get.toNamed(AppPageNames.countryScreen);
                            }),
                        AppGaps.hGap16, */
                        /* <---- 'Currency' List Tile ----> */
                        /* SettingsListTileWidget(
                            titleText: 'Currency',
                            valueWidget:
                                const SettingsValueTextWidget(text: 'USD'),
                            onTap: () {
                              Get.toNamed(AppPageNames.currencyScreen);
                            }),
                        AppGaps.hGap16, */
                        /* <---- 'Language' List Tile ----> */
                        SettingsListTileWidget(
                            titleText: LanguageHelper.currentLanguageText(
                                LanguageHelper.languageTransKey),
                            valueWidget: SettingsValueTextWidget(
                                text: controller.currentLanguageText),
                            onTap: () async {
                              await Get.toNamed(AppPageNames.languageScreen);
                              controller.update();
                            }),
                        /* <---- Section space ----> */
                        /*  AppGaps.hGap32,
                        Text('Application setting',
                            style: Theme.of(context).textTheme.headlineMedium),
                        AppGaps.hGap16,
                        /* <---- 'Notification' List Tile ----> */
                        SettingsListTileWidget(
                            titleText: 'Popup notification',
                            showRightArrow: false,
                            valueWidget: FlutterSwitch(
                              value: controller.toggleNotification.value,
                              width: 35,
                              height: 20,
                              toggleSize: 12,
                              activeColor: AppColors.primaryColor,
                              onToggle: (value) {
                                // setState(() {
                                controller.toggleNotification.value = value;
                                // });
                              },
                            ),
                            onTap: () {
                              // setState(
                              //   () {
                              controller.toggleNotification.value =
                                  !controller.toggleNotification.value;
                              // });
                            }), */
                        /* <---- Section space ----> */
                        // AppGaps.hGap32,
                        // Text('Support', style: Theme.of(context).textTheme.headline4),
                        // AppGaps.hGap16,
                        // /* <---- 'Help center' List Tile ----> */
                        // SettingsListTileWidget(titleText: 'Help center', onTap: () {}),
                        // AppGaps.hGap16,
                        // /* <---- 'Terms & conditions' List Tile ----> */
                        // SettingsListTileWidget(
                        //     titleText: 'Terms & conditions', onTap: () {}),
                        // // Bottom extra spaces
                        // AppGaps.hGap30,
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
