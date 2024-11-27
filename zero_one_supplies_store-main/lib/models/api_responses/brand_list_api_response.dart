import 'package:ecomikstoreapp/models/api_responses/core_api_responses/paginated_data_response.dart';
import 'package:ecomikstoreapp/utils/constants/app_components.dart';

import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class BrandListApiResponse {
  bool error;
  String msg;
  PaginatedDataResponse<BrandListItem> data;

  BrandListApiResponse({this.error = false, this.msg = '', required this.data});

  factory BrandListApiResponse.fromJson(Map<String, dynamic> json) {
    return BrandListApiResponse(
        error: APIHelper.getSafeBoolValue(json['error']),
        msg: APIHelper.getSafeStringValue(json['msg']),
        data: PaginatedDataResponse.getAPIResponseObjectSafeValue(json['data'],
            docFromJson: (data) =>
                BrandListItem.getAPIResponseObjectSafeValue(data)));
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'data': data.toJson((data) => data.toJson()),
      };

  factory BrandListApiResponse.empty() =>
      BrandListApiResponse(data: PaginatedDataResponse.empty());
  static BrandListApiResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? BrandListApiResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : BrandListApiResponse.empty();
}

class BrandListItem {
  String id;
  String name;
  String description;
  String image;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  bool isAdded;

  BrandListItem({
    this.id = '',
    this.name = '',
    this.description = '',
    this.image = '',
    this.active = false,
    required this.createdAt,
    required this.updatedAt,
    this.isAdded = false,
  });

  factory BrandListItem.fromJson(Map<String, dynamic> json) => BrandListItem(
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

  factory BrandListItem.empty() => BrandListItem(
        createdAt: AppComponents.defaultUnsetDateTime,
        updatedAt: AppComponents.defaultUnsetDateTime,
      );
  static BrandListItem getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? BrandListItem.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : BrandListItem.empty();

  bool get isEmpty => id.isEmpty;
}
