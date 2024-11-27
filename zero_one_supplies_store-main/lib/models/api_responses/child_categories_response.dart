import 'package:ecomikstoreapp/models/api_responses/core_api_responses/paginated_data_response.dart';
import 'package:ecomikstoreapp/utils/constants/app_components.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class ChildCategoriesResponse {
  bool error;
  String msg;
  PaginatedDataResponse<ChildCategory> data;

  ChildCategoriesResponse(
      {this.error = false, this.msg = '', required this.data});

  factory ChildCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return ChildCategoriesResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: PaginatedDataResponse.getAPIResponseObjectSafeValue(json['data'],
          docFromJson: (data) =>
              ChildCategory.getAPIResponseObjectSafeValue(data)),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson((item) => item.toJson()),
      };

  factory ChildCategoriesResponse.empty() =>
      ChildCategoriesResponse(data: PaginatedDataResponse.empty());

  static ChildCategoriesResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ChildCategoriesResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ChildCategoriesResponse.empty();
}

class ChildCategory {
  String id;
  String name;
  String description;
  String image;
  bool active;
  String subcategory;
  DateTime createdAt;
  DateTime updatedAt;
  List<ChildCategoryProduct> totalProducts;

  ChildCategory({
    this.id = '',
    this.name = '',
    this.description = '',
    this.image = '',
    this.active = false,
    this.subcategory = '',
    required this.createdAt,
    required this.updatedAt,
    this.totalProducts = const [],
  });

  factory ChildCategory.fromJson(Map<String, dynamic> json) => ChildCategory(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
        description: APIHelper.getSafeStringValue(json['description']),
        image: APIHelper.getSafeStringValue(json['image']),
        active: APIHelper.getSafeBoolValue(json['active']),
        subcategory: APIHelper.getSafeStringValue(json['subcategory']),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
        totalProducts: APIHelper.getSafeListValue(json['totalProducts'])
            .map((e) => ChildCategoryProduct.getAPIResponseObjectSafeValue(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'image': image,
        'active': active,
        'subcategory': subcategory,
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
        'totalProducts': totalProducts.map((e) => e.toJson()).toList(),
      };

  factory ChildCategory.empty() => ChildCategory(
      createdAt: AppComponents.defaultUnsetDateTime,
      updatedAt: AppComponents.defaultUnsetDateTime);

  static ChildCategory getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ChildCategory.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : ChildCategory.empty();
}

class ChildCategoryProduct {
  String id;
  int count;

  ChildCategoryProduct({this.id = '', this.count = 0});

  factory ChildCategoryProduct.fromJson(Map<String, dynamic> json) =>
      ChildCategoryProduct(
        id: APIHelper.getSafeStringValue(json['_id']),
        count: APIHelper.getSafeIntValue(json['count']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'count': count,
      };
  static ChildCategoryProduct getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ChildCategoryProduct.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ChildCategoryProduct();
}
