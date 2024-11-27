import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class StoreCategoriesResponse {
  bool error;
  String msg;
  List<StoreCategory> data;

  StoreCategoriesResponse(
      {this.error = false, this.msg = '', this.data = const []});

  factory StoreCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return StoreCategoriesResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: (APIHelper.getSafeListValue(json['data']))
          .map((e) => StoreCategory.getAPIResponseObjectSafeValue(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.map((e) => e.toJson()).toList(),
      };

  static StoreCategoriesResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? StoreCategoriesResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : StoreCategoriesResponse();
}

class StoreCategory {
  String id;
  String name;

  StoreCategory({this.id = '', this.name = ''});

  factory StoreCategory.fromJson(Map<String, dynamic> json) => StoreCategory(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };
  static StoreCategory getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? StoreCategory.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : StoreCategory();
}
