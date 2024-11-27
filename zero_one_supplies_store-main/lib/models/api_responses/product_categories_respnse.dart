import 'package:ecomikstoreapp/models/api_responses/product_elements_response.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class ProductCategoriesResponse {
  bool error;
  String msg;
  List<ProductElementCategory> data;

  ProductCategoriesResponse(
      {this.error = false, this.msg = '', this.data = const []});

  factory ProductCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return ProductCategoriesResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: (APIHelper.getSafeListValue(json['data']))
          .map((e) => ProductElementCategory.getAPIResponseObjectSafeValue(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.map((e) => e.toJson()).toList(),
      };

  static ProductCategoriesResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductCategoriesResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductCategoriesResponse();
}
