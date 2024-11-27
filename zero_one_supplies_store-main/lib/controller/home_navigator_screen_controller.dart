import 'dart:io';

import 'package:disable_battery_optimization/disable_battery_optimization.dart';
import 'package:ecomikstoreapp/models/api_responses/vendor_with_store_details_response.dart';
import 'package:ecomikstoreapp/screens/chat_recipients_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screens/home_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screens/my_account_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screens/orders_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screens/products_screen.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeNavigatorScreenController extends GetxController {
  /// Current page index
  int currentPageIndex = 2;

  /// Tabbed screen widget of selected tab
  Widget nestedScreenWidget = const Scaffold();
  DateTime currentBackPressTime = AppComponents.defaultUnsetDateTime;

  Future<bool> onWillPop(BuildContext context) {
/*     if (Scaffold.of(context).isDrawerOpen) {
      Scaffold.of(context).closeDrawer();
      return Future.value(false);
    } */
    DateTime now = DateTime.now();
    if (currentBackPressTime.year == Constants.defaultUnsetDateTimeYear ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Helper.showSnackBar(
          AppLanguageTranslation.tapBackAgainToExitTransKey.toCurrentLanguage);
      // ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Tap back again to exit')));
      return Future.value(false);
    }
    Helper.exitApp();
    return Future.value(true);
  }

  /* <-------- Select current tab screen --------> */
  void setCurrentTab() {
    const int productScreenIndex = 0;
    const int orderScreenIndex = 1;
    const int homeScreenIndex = 2;
    const int messageScreenIndex = 3;
    const int accountScreenIndex = 4;
    switch (currentPageIndex) {
      case productScreenIndex:
        nestedScreenWidget = const ProductsScreen();
        break;
      case orderScreenIndex:
        nestedScreenWidget = const OrdersScreen();
        break;
      case homeScreenIndex:
        nestedScreenWidget = const HomeScreen();
        break;
      case messageScreenIndex:
        // nestedScreenWidget = const ChatDeliverymanScreen();
        // nestedScreenWidget = const MessageRecipientsScreen();
        nestedScreenWidget = const ChatRecipientsScreen();
        break;
      case accountScreenIndex:
        nestedScreenWidget = const MyAccountScreen();
        break;
      default:
        // Invalid page index set tab to dashboard screen
        nestedScreenWidget = const HomeScreen();
    }
    update();
  }

  Widget bottomMenuButton(String name, String image, int index) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            color: (currentPageIndex == index)
                ? AppColors.primaryColor
                : AppColors.bodyTextColor,
          ),
          Text(
            name,
            style: TextStyle(
                color: (currentPageIndex == index)
                    ? AppColors.primaryColor
                    : AppColors.bodyTextColor,
                fontWeight: (currentPageIndex == index)
                    ? FontWeight.w500
                    : FontWeight.normal),
          ),
        ],
      ),
      onTap: () {
        currentPageIndex = index;
        setCurrentTab();
      },
    );
  }

  void _getScreenParameter() {
    final argument = Get.arguments;
    if (argument != null) {
      if (argument is int) {
        currentPageIndex = argument;
      }
    }
  }

  void _setNotificationPermission() async {
    await Helper.setNotificationPermission();
  }

  Future<void> _checkBatteryOptimizationDisabled() async {
    if (Platform.isAndroid) {
/*       await DisableBatteryOptimization.isAllBatteryOptimizationDisabled;
      await DisableBatteryOptimization.showDisableAllOptimizationsSettings(
          'Enable Auto Start',
          'Follow the steps and enable the auto start of this app',
          'Your device has additional battery optimization',
          'Follow the steps and disable the optimizations to allow smooth functioning of this app'); */
      final bool? isAutoStartEnabled =
          await DisableBatteryOptimization.isAutoStartEnabled;
      if (isAutoStartEnabled == false) {
        await DisableBatteryOptimization.showEnableAutoStartSettings(
            'Enable Auto Start',
            'Follow the steps and enable the auto start of this app');
      }
      final bool? isBatteryOptimizationDisabled =
          await DisableBatteryOptimization.isBatteryOptimizationDisabled;
      if (isBatteryOptimizationDisabled == false) {
        final bool? isEnableAutoStartSettingsShown =
            await DisableBatteryOptimization.showEnableAutoStartSettings(
                'Enable Auto Start',
                'Follow the steps and enable the auto start of this app');
      }
/*       final bool? isManBatteryOptimizationDisabled =
          await DisableBatteryOptimization
              .isManufacturerBatteryOptimizationDisabled;
      final bool? isDisableManufacturerBatteryOptimizationSettingsShown =
          await DisableBatteryOptimization
              .showDisableManufacturerBatteryOptimizationSettings(
                  'Your device has additional battery optimization',
                  'Follow the steps and disable the optimizations to allow smooth functioning of this app'); */
    }
  }

  @override
  void onInit() {
    _getScreenParameter();
    setCurrentTab();
    _checkBatteryOptimizationDisabled();
    super.onInit();
  }

  @override
  void onReady() {
    final VendorDetails vendorDetails = Helper.getVendor();
    if (vendorDetails.store.status != 'approved') {
      Get.offNamed(AppPageNames.storeNotApprovedYetScreen);
    }
    _setNotificationPermission();
    super.onReady();
  }
}
