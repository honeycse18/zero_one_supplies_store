import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class VendorAccountDetailsResponse {
  bool error;
  String msg;
  VendorAccountInformationShortItem data;

  VendorAccountDetailsResponse(
      {this.error = false, this.msg = '', required this.data});

  factory VendorAccountDetailsResponse.fromJson(Map<String, dynamic> json) {
    return VendorAccountDetailsResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: VendorAccountInformationShortItem.getAPIResponseObjectSafeValue(
          json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson(),
      };

  factory VendorAccountDetailsResponse.empty() => VendorAccountDetailsResponse(
        data: VendorAccountInformationShortItem.empty(),
      );

  static VendorAccountDetailsResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? VendorAccountDetailsResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : VendorAccountDetailsResponse.empty();
}

class VendorAccountInformationShortItem {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String role;
  bool verified;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime birthday;
  String gender;
  String image;

  VendorAccountInformationShortItem({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.role = '',
    this.verified = false,
    this.active = false,
    required this.createdAt,
    required this.updatedAt,
    required this.birthday,
    this.gender = '',
    this.image = '',
  });

  factory VendorAccountInformationShortItem.fromJson(
          Map<String, dynamic> json) =>
      VendorAccountInformationShortItem(
        id: APIHelper.getSafeStringValue(json['_id']),
        firstName: APIHelper.getSafeStringValue(json['first_name']),
        lastName: APIHelper.getSafeStringValue(json['last_name']),
        email: APIHelper.getSafeStringValue(json['email']),
        phone: APIHelper.getSafeStringValue(json['phone']),
        role: APIHelper.getSafeStringValue(json['role']),
        verified: APIHelper.getSafeBoolValue(json['verified']),
        active: APIHelper.getSafeBoolValue(json['active']),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
        birthday: APIHelper.getSafeDateTimeValue(json['birthday']),
        gender: APIHelper.getSafeStringValue(json['gender']),
        image: APIHelper.getSafeStringValue(json['image']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'role': role,
        'verified': verified,
        'active': active,
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
        'birthday':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(birthday),
        'gender': gender,
        'image': image,
      };

  factory VendorAccountInformationShortItem.empty() =>
      VendorAccountInformationShortItem(
        birthday: AppComponents.defaultUnsetDateTime,
        createdAt: AppComponents.defaultUnsetDateTime,
        updatedAt: AppComponents.defaultUnsetDateTime,
      );

  static VendorAccountInformationShortItem getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? VendorAccountInformationShortItem.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : VendorAccountInformationShortItem.empty();

  bool isEmpty() => id.isEmpty;
}
