import 'package:ecomikstoreapp/utils/constants/app_components.dart';

import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class SingleBrandListApiResponse {
  bool error;
  String msg;
  SingleBrandListItem data;

  SingleBrandListApiResponse(
      {this.error = false, this.msg = '', required this.data});

  factory SingleBrandListApiResponse.fromJson(Map<String, dynamic> json) {
    return SingleBrandListApiResponse(
        error: APIHelper.getSafeBoolValue(json['error']),
        msg: APIHelper.getSafeStringValue(json['msg']),
        data: SingleBrandListItem.getAPIResponseObjectSafeValue(json['data']));
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson(),
      };

  factory SingleBrandListApiResponse.empty() =>
      SingleBrandListApiResponse(data: SingleBrandListItem.empty());
  static SingleBrandListApiResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? SingleBrandListApiResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : SingleBrandListApiResponse.empty();
}

class SingleBrandListItem {
  String id;
  String name;
  String description;
  String image;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  bool isAdded;

  SingleBrandListItem({
    this.id = '',
    this.name = '',
    this.description = '',
    this.image = '',
    this.active = false,
    required this.createdAt,
    required this.updatedAt,
    this.isAdded = false,
  });

  factory SingleBrandListItem.fromJson(Map<String, dynamic> json) =>
      SingleBrandListItem(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
        description: APIHelper.getSafeStringValue(json['description']),
        image: APIHelper.getSafeStringValue(json['image']),
        active: APIHelper.getSafeBoolValue(json['active']),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
        isAdded: APIHelper.getSafeBoolValue(json['isAdded']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'image': image,
        'active': active,
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
        'isAdded': isAdded,
      };

  factory SingleBrandListItem.empty() => SingleBrandListItem(
        createdAt: AppComponents.defaultUnsetDateTime,
        updatedAt: AppComponents.defaultUnsetDateTime,
      );
  static SingleBrandListItem getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? SingleBrandListItem.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : SingleBrandListItem.empty();
}
