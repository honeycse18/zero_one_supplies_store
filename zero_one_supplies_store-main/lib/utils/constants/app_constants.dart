import 'package:google_maps_flutter/google_maps_flutter.dart';

class Constants {
  // static const String appLiveBaseURL = 'https://zerobackend.appstick.com.bd/'; // Old live backend url
  // static const String appLiveBaseURL = 'https://backend.01supplies.com/'; // Live backend url
  static const String appLiveBaseURL =
      'https://devbackend.01supplies.com/'; // Dev backend url
  static const String appLocalhostBaseURL =
      'http://192.168.0.185:8080/'; // Local backend url
  // static const String appLocalhostBaseURL = 'https://cb4e-27-147-201-241.ngrok-free.app/';
  static const bool isTestOnLocalhost = false;
  static const String appBaseURL =
      isTestOnLocalhost ? appLocalhostBaseURL : appLiveBaseURL;

  static const double bottomSheetBorderRadiusValue = 40;

  static const int defaultUnsetDateTimeYear = 2000;

  static const String userRoleVendor = 'vendor';

  static const double smallBorderRadiusValue = 5;

  /// Screen horizontal padding value
  static const double screenPaddingValue = 24;
  static const double bottomScreenSpaceValue = 30;
  static const double bottomSheetTopPaddingValue = 24;

  static const double defaultBorderRadiusValue = 18;
  static const double dialogBorderRadiusValue = 20;
  static const double buttonBorderRadiusValue = 18;
  static const double uploadImageButtonBorderRadiusValue = 12;
  static const String userGenderMale = 'male';
  static const String userGenderFemale = 'female';
  static const String unknown = 'unknown';
  // Dialog padding values
  static const double dialogVerticalSpaceValue = 16;
  static const double dialogHalfVerticalSpaceValue = 8;
  static const double dialogHorizontalSpaceValue = 18;
  static const double auctionGridItemBorderRadiusValue = 20;
  static const double imageBorderRadiusValue = 14;
  static const double unsetMapLatLng = -999;
  static const LatLng defaultMapLatLng = LatLng(22.8456, 89.5403);
  static const CameraPosition defaultMapCameraPosition = CameraPosition(
    target: defaultMapLatLng,
    zoom: defaultMapZoomLevel,
  );
  static const double defaultMapZoomLevel = 12.4746;
  static const String apiDateTimeFormatValue =
      'yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'';

  static const String hiveBoxName = 'zero_one_supplies_vendor';
  static const String hiveDefaultLanguageKey = 'default_language';
  static const String languageTranslationKeyCode = '_code';
  static const String fallbackLocale = 'en_US';
  static const String fallbackFrenchLocale = 'fr_FR';

  // Push notification info
  static const String notificationChannelID = '01suppliesVendor';
  static const String notificationChannelName =
      '01Supplies Vendor Notifications';
  static const String notificationChannelDescription =
      '01 Supplies Vendor app notification channel';
  static const String notificationChannelTicker = 'zeroonevendorticker';

  // Push notification types
  static const String pushNotificationTypeDelivered = 'delivered';

  static const String otpOptionEmail = 'email';
  static const String otpOptionSMS = 'sms';

  static const String productConditionNew = 'new';
  static const String productConditionOld = 'old';

  static const String discountTypePercentage = 'percentage';
  static const String discountTypeFlat = 'flat';
}
