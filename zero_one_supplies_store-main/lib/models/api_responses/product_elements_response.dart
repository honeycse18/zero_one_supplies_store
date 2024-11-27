import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class ProductElementsResponse {
  bool error;
  String msg;
  ProductElementsData data;

  ProductElementsResponse(
      {this.error = false, this.msg = '', required this.data});

  factory ProductElementsResponse.fromJson(Map<String, dynamic> json) {
    return ProductElementsResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: ProductElementsData.getAPIResponseObjectSafeValue(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson(),
      };

  factory ProductElementsResponse.empty() =>
      ProductElementsResponse(data: ProductElementsData());

  static ProductElementsResponse getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductElementsResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductElementsResponse.empty();
}

class ProductElementsData {
  List<ProductElementBrand> brands;
  List<ProductElementTag> tags;
  List<ProductElementUnit> units;
  List<ProductElementAttribute> attributes;
  List<ProductElementCategory> categories;

  ProductElementsData({
    this.brands = const [],
    this.tags = const [],
    this.units = const [],
    this.attributes = const [],
    this.categories = const [],
  });

  factory ProductElementsData.fromJson(Map<String, dynamic> json) =>
      ProductElementsData(
        brands: (APIHelper.getSafeListValue(json['brands']))
            .map((e) => ProductElementBrand.getAPIResponseObjectSafeValue(e))
            .toList(),
        tags: (APIHelper.getSafeListValue(json['tags']))
            .map((e) => ProductElementTag.getAPIResponseObjectSafeValue(e))
            .toList(),
        units: (APIHelper.getSafeListValue(json['units']))
            .map((e) => ProductElementUnit.getAPIResponseObjectSafeValue(e))
            .toList(),
        attributes: (APIHelper.getSafeListValue(json['attributes']))
            .map(
                (e) => ProductElementAttribute.getAPIResponseObjectSafeValue(e))
            .toList(),
        categories: (APIHelper.getSafeListValue(json['categories']))
            .map((e) => ProductElementCategory.getAPIResponseObjectSafeValue(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'brands': brands.map((e) => e.toJson()).toList(),
        'tags': tags.map((e) => e.toJson()).toList(),
        'units': units.map((e) => e.toJson()).toList(),
        'attributes': attributes.map((e) => e.toJson()).toList(),
        'categories': categories.map((e) => e.toJson()).toList(),
      };

  static ProductElementsData getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductElementsData.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductElementsData();
}

class ProductElementAttribute {
  String id;
  String name;
  List<String> attributes;

  ProductElementAttribute(
      {this.id = '', this.name = '', this.attributes = const []});

  factory ProductElementAttribute.fromJson(Map<String, dynamic> json) =>
      ProductElementAttribute(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
        attributes: APIHelper.getSafeListValue(json['attributes'])
            .map((e) => APIHelper.getSafeStringValue(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'attributes': attributes.map((e) => e).toList(),
      };

  static ProductElementAttribute getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductElementAttribute.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductElementAttribute();
}

class ProductElementBrand {
  String id;
  String name;

  ProductElementBrand({this.id = '', this.name = ''});

  factory ProductElementBrand.fromJson(Map<String, dynamic> json) =>
      ProductElementBrand(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };
  static ProductElementBrand getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductElementBrand.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductElementBrand();
}

class ProductElementCategory {
  String id;
  String name;

  ProductElementCategory({this.id = '', this.name = ''});

  factory ProductElementCategory.fromJson(Map<String, dynamic> json) =>
      ProductElementCategory(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };
  static ProductElementCategory getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductElementCategory.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductElementCategory();
}

class ProductElementTag {
  String id;
  String name;

  ProductElementTag({this.id = '', this.name = ''});

  factory ProductElementTag.fromJson(Map<String, dynamic> json) =>
      ProductElementTag(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };
  static ProductElementTag getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductElementTag.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductElementTag();
}

class ProductElementUnit {
  String id;
  String name;

  ProductElementUnit({this.id = '', this.name = ''});

  factory ProductElementUnit.fromJson(Map<String, dynamic> json) =>
      ProductElementUnit(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };

  static ProductElementUnit getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductElementUnit.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductElementUnit();
}
