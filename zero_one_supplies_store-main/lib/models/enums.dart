/* <-------- Enums for various screens --------> */

import 'package:ecomikstoreapp/utils/constants/app_constants.dart';

enum ProductScreenTab { auctions, products, trash }

enum ResetPasswordSelectedChoice {
  none,
  mail,
  phoneNumber,
}

enum PasswordStrongLevel {
  none,
  error,
  weak,
  normal,
  strong,
  veryStrong,
}

enum LanguageSetting { english, russian, french, canada, australian, german }

enum CurrencySetting { english, russian, bdt, canada, australian, german }

enum UserGender {
  male(Constants.userGenderMale, 'Male'),
  female(Constants.userGenderFemale, 'Female'),
  unknown(Constants.unknown, Constants.unknown);

  final String stringValue;
  final String stringValueForView;
  const UserGender(this.stringValue, this.stringValueForView);

  static UserGender toEnumValue(String value) {
    final Map<String, UserGender> stringToEnumMap = {
      UserGender.male.stringValue: UserGender.male,
      UserGender.female.stringValue: UserGender.female,
      UserGender.unknown.stringValue: UserGender.unknown,
    };
    return stringToEnumMap[value] ?? UserGender.unknown;
  }

  static UserGender toEnumValueFromViewable(String value) {
    final Map<String, UserGender> stringToEnumMap = {
      UserGender.male.stringValueForView: UserGender.male,
      UserGender.female.stringValueForView: UserGender.female,
      UserGender.unknown.stringValueForView: UserGender.unknown,
    };
    return stringToEnumMap[value] ?? UserGender.unknown;
  }
}

enum FromScreenName {
  signupScreen,
  googleSignupScreen,
  resetOrForgetPassScreen,
  vendorScreen,
  homeScreen;
}

enum SettingsOTPOption {
  email(Constants.otpOptionEmail, 'Email'),
  sms(Constants.otpOptionSMS, 'SMS'),
  unknown(Constants.unknown, 'Unknown');

  final String stringValue;
  final String stringValueForView;
  const SettingsOTPOption(this.stringValue, this.stringValueForView);

  static SettingsOTPOption toEnumValue(String value) {
    final Map<String, SettingsOTPOption> stringToEnumMap = {
      SettingsOTPOption.email.stringValue: SettingsOTPOption.email,
      SettingsOTPOption.sms.stringValue: SettingsOTPOption.sms,
      SettingsOTPOption.unknown.stringValue: SettingsOTPOption.unknown,
    };
    return stringToEnumMap[value] ?? SettingsOTPOption.unknown;
  }
}

enum PushNotificationTypeStatus {
  delivered(Constants.pushNotificationTypeDelivered, 'Delivered'),
  unknown(Constants.unknown, 'Unknown');

  final String stringValue;
  final String stringValueForView;
  const PushNotificationTypeStatus(this.stringValue, this.stringValueForView);

  static PushNotificationTypeStatus toEnumValue(String value) {
    final Map<String, PushNotificationTypeStatus> stringToEnumMap = {
      PushNotificationTypeStatus.delivered.stringValue:
          PushNotificationTypeStatus.delivered,
    };
    return stringToEnumMap[value] ?? PushNotificationTypeStatus.unknown;
  }

  static PushNotificationTypeStatus toEnumValueFromViewable(String value) {
    final Map<String, PushNotificationTypeStatus> stringToEnumMap = {
      PushNotificationTypeStatus.delivered.stringValueForView:
          PushNotificationTypeStatus.delivered,
    };
    return stringToEnumMap[value] ?? PushNotificationTypeStatus.unknown;
  }
}

enum ProductCondition {
  newCondition(Constants.productConditionNew, 'New'),
  oldCondition(Constants.productConditionOld, 'Old');

  final String stringValue;
  final String viewableText;
  const ProductCondition(this.stringValue, this.viewableText);

  static ProductCondition toEnumValue(String value) {
    final Map<String, ProductCondition> stringToEnumMap = {
      ProductCondition.newCondition.stringValue: ProductCondition.newCondition,
      ProductCondition.oldCondition.stringValue: ProductCondition.oldCondition,
    };
    return stringToEnumMap[value] ?? ProductCondition.newCondition;
  }
}

enum CouponScreenTab { active, trash }

enum DiscountType {
  percentage(Constants.discountTypePercentage, 'Percentage'),
  flat(Constants.discountTypeFlat, 'Flat');

  static DiscountType get defaultValue => DiscountType.flat;

  final String stringValue;
  final String stringValueForView;
  const DiscountType(this.stringValue, this.stringValueForView);

  static DiscountType toEnumValue(String value) {
    final Map<String, DiscountType> stringToEnumMap = {
      DiscountType.percentage.stringValue: DiscountType.percentage,
      DiscountType.flat.stringValue: DiscountType.flat,
    };
    return stringToEnumMap[value] ?? defaultValue;
  }
}

enum ProductLocation {
  none(-1, '', ''),
  store(1, 'store', 'Store'),
  pickupStations(2, 'replay_point', 'Pickup station');

  final int selectionIndex;
  final String type;
  final String viewableText;
  const ProductLocation(this.selectionIndex, this.type, this.viewableText);

  static ProductLocation get defaultValue => ProductLocation.none;

  static List<ProductLocation> get list => [store, pickupStations];

  static ProductLocation toEnumValue(int selectionIndex) {
    final Map<int, ProductLocation> stringToEnumMap = {
      ProductLocation.store.selectionIndex: ProductLocation.store,
      ProductLocation.pickupStations.selectionIndex:
          ProductLocation.pickupStations,
    };
    return stringToEnumMap[selectionIndex] ?? defaultValue;
  }

  static ProductLocation typeToEnumValue(String type) {
    final Map<String, ProductLocation> stringToEnumMap = {
      ProductLocation.store.type: ProductLocation.store,
      ProductLocation.pickupStations.type: ProductLocation.pickupStations,
    };
    return stringToEnumMap[type] ?? defaultValue;
  }
}
