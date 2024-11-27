import 'package:ecomikstoreapp/models/api_responses/core_api_responses/paginated_data_response.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class ProductElementSubcategoriesResponse {
  bool error;
  String msg;
  PaginatedDataResponse<ProductElementSubcategory> data;

  ProductElementSubcategoriesResponse(
      {this.error = false, this.msg = '', required this.data});

  factory ProductElementSubcategoriesResponse.fromJson(
      Map<String, dynamic> json) {
    return ProductElementSubcategoriesResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: PaginatedDataResponse.getAPIResponseObjectSafeValue(
        json['data'],
        docFromJson: (data) =>
            ProductElementSubcategory.getAPIResponseObjectSafeValue(data),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson((item) => item.toJson()),
      };

  factory ProductElementSubcategoriesResponse.empty() =>
      ProductElementSubcategoriesResponse(data: PaginatedDataResponse.empty());

  static ProductElementSubcategoriesResponse getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductElementSubcategoriesResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductElementSubcategoriesResponse.empty();
}

class ProductElementSubcategory {
  String id;
  String name;
  String description;
  bool active;
  String parent;

  ProductElementSubcategory(
      {this.id = '',
      this.name = '',
      this.description = '',
      this.active = false,
      this.parent = ''});

  factory ProductElementSubcategory.fromJson(Map<String, dynamic> json) =>
      ProductElementSubcategory(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
        description: APIHelper.getSafeStringValue(json['description']),
        active: APIHelper.getSafeBoolValue(json['active']),
        parent: APIHelper.getSafeStringValue(json['parent']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'active': active,
        'parent': parent,
      };

  static ProductElementSubcategory getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductElementSubcategory.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductElementSubcategory();
}
