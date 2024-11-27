import 'package:ecomikstoreapp/models/api_responses/core_api_responses/paginated_data_response.dart';
import 'package:ecomikstoreapp/utils/constants/app_components.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class ProductsResponse {
  bool error;
  String msg;
  PaginatedDataResponse<Product> data;

  ProductsResponse({this.error = false, this.msg = '', required this.data});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: PaginatedDataResponse.getAPIResponseObjectSafeValue(
        json['data'],
        docFromJson: (data) => Product.getAPIResponseObjectSafeValue(data),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson((item) => item.toJson()),
      };

  factory ProductsResponse.empty() =>
      ProductsResponse(data: PaginatedDataResponse.empty());

  static ProductsResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductsResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductsResponse.empty();
}

class Product {
  String id;
  String name;
  String model;
  ProductBrand brand;
  bool isDraft;
  List<ProductCategory> categories;
  List<ProductSubcategory> subcategories;
  String unit;
  ProductQuantity quantity;
  List<String> tags;
  List<String> galleryImages;
  ProductAttribute attributes;
  bool stockAvailable;
  bool stockVisibility;
  bool flashDeal;
  bool onSell;
  bool bestSell;
  bool hotSell;
  bool trend;
  bool featured;
  bool newArrival;
  bool bulk;
  bool trash;
  bool userRequested;
  bool isStatus;
  List<ProductSpecification> specifications;
  List<dynamic> variants;
  DateTime createdAt;
  DateTime updatedAt;
  ProductDescription description;
  ProductDiscount discountValue;
  bool discount;
  double price;
  double currentPrice;
  String image;
  String productImage;
  String specificationDescription;
  String thumbImage;

  Product({
    this.id = '',
    this.name = '',
    this.model = '',
    required this.brand,
    this.isDraft = false,
    this.categories = const [],
    this.subcategories = const [],
    this.unit = '',
    required this.quantity,
    this.tags = const [],
    this.galleryImages = const [],
    required this.attributes,
    this.stockAvailable = false,
    this.stockVisibility = false,
    this.flashDeal = false,
    this.onSell = false,
    this.bestSell = false,
    this.hotSell = false,
    this.trend = false,
    this.featured = false,
    this.newArrival = false,
    this.bulk = false,
    this.trash = false,
    this.userRequested = false,
    this.isStatus = false,
    this.specifications = const [],
    this.variants = const [],
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.discountValue,
    this.discount = false,
    this.price = 0,
    this.currentPrice = 0,
    this.productImage = '',
    this.image = '',
    this.specificationDescription = '',
    this.thumbImage = '',
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
        model: APIHelper.getSafeStringValue(json['model']),
        brand: ProductBrand.getAPIResponseObjectSafeValue(json['brand']),
        isDraft: APIHelper.getSafeBoolValue(json['is_draft']),
        categories: (APIHelper.getSafeListValue(json['categories']))
            .map((e) => ProductCategory.getAPIResponseObjectSafeValue(e))
            .toList(),
        subcategories: (APIHelper.getSafeListValue(json['subcategories']))
            .map((e) => ProductSubcategory.getAPIResponseObjectSafeValue(e))
            .toList(),
        unit: APIHelper.getSafeStringValue(json['unit']),
        quantity:
            ProductQuantity.getAPIResponseObjectSafeValue(json['quantity']),
        tags: APIHelper.getSafeListValue(json['tags'])
            .map((e) => APIHelper.getSafeStringValue(json['tags']))
            .toList(),
        galleryImages: APIHelper.getSafeListValue(json['gallery_images'])
            .map((e) => APIHelper.getSafeStringValue(json['gallery_images']))
            .toList(),
        attributes:
            ProductAttribute.getAPIResponseObjectSafeValue(json['attributes']),
        stockAvailable: APIHelper.getSafeBoolValue(json['stock_available']),
        stockVisibility: APIHelper.getSafeBoolValue(json['stock_visibility']),
        flashDeal: APIHelper.getSafeBoolValue(json['flash_deal']),
        onSell: APIHelper.getSafeBoolValue(json['on_sell']),
        bestSell: APIHelper.getSafeBoolValue(json['best_sell']),
        hotSell: APIHelper.getSafeBoolValue(json['hot_sell']),
        trend: APIHelper.getSafeBoolValue(json['trend']),
        featured: APIHelper.getSafeBoolValue(json['featured']),
        newArrival: APIHelper.getSafeBoolValue(json['new_arrival']),
        bulk: APIHelper.getSafeBoolValue(json['bulk']),
        trash: APIHelper.getSafeBoolValue(json['trash']),
        userRequested: APIHelper.getSafeBoolValue(json['user_requested']),
        isStatus: APIHelper.getSafeBoolValue(json['is_status']),
        specifications: (APIHelper.getSafeListValue(json['specifications']))
            .map((e) => ProductSpecification.getAPIResponseObjectSafeValue(e))
            .toList(),
        variants:
            APIHelper.getSafeListValue(json['variants']).map((e) => e).toList(),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
        description: ProductDescription.getAPIResponseObjectSafeValue(
            json['description']),
        discountValue: ProductDiscount.getAPIResponseObjectSafeValue(
            json['discount_value']),
        discount: APIHelper.getSafeBoolValue(json['discount']),
        price: APIHelper.getSafeDoubleValue(json['price'], 0),
        currentPrice: APIHelper.getSafeDoubleValue(json['current_price'], 0),
        productImage: APIHelper.getSafeStringValue(json['product_image']),
        image: APIHelper.getSafeStringValue(json['image']),
        specificationDescription:
            APIHelper.getSafeStringValue(json['specification_description']),
        thumbImage: APIHelper.getSafeStringValue(json['thumb_image']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'model': model,
        'brand': brand.toJson(),
        'is_draft': isDraft,
        'categories': categories.map((e) => e.toJson()).toList(),
        'subcategories': subcategories.map((e) => e.toJson()).toList(),
        'unit': unit,
        'quantity': quantity.toJson(),
        'tags': tags,
        'gallery_images': galleryImages,
        'attributes': attributes.toJson(),
        'stock_available': stockAvailable,
        'stock_visibility': stockVisibility,
        'flash_deal': flashDeal,
        'on_sell': onSell,
        'best_sell': bestSell,
        'hot_sell': hotSell,
        'trend': trend,
        'featured': featured,
        'new_arrival': newArrival,
        'bulk': bulk,
        'trash': trash,
        'user_requested': userRequested,
        'is_status': isStatus,
        'specifications': specifications.map((e) => e.toJson()).toList(),
        'variants': variants,
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
        'description': description.toJson(),
        'discount_value': discountValue.toJson(),
        'discount': discount,
        'price': price,
        'current_price': currentPrice,
        'product_image': productImage,
        'image': image,
        'specification_description': specificationDescription,
        'thumb_image': thumbImage,
      };

  factory Product.empty() => Product(
      brand: ProductBrand(),
      quantity: ProductQuantity(),
      attributes: ProductAttribute(),
      createdAt: AppComponents.defaultUnsetDateTime,
      updatedAt: AppComponents.defaultUnsetDateTime,
      description: ProductDescription(),
      discountValue: ProductDiscount.empty());

  static Product getAPIResponseObjectSafeValue(dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? Product.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : Product.empty();
}

class ProductAttribute {
  String name;
  List<String> values;

  ProductAttribute({this.name = '', this.values = const []});

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      ProductAttribute(
        name: APIHelper.getSafeStringValue(json['name']),
        values: APIHelper.getSafeListValue(json['values'])
            .map((e) => APIHelper.getSafeStringValue(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'values': values.map((e) => e).toList(),
      };

  static ProductAttribute getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAttribute.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAttribute();
}

class ProductBrand {
  String id;
  String name;

  ProductBrand({this.id = '', this.name = ''});

  factory ProductBrand.fromJson(Map<String, dynamic> json) => ProductBrand(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };

  static ProductBrand getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductBrand.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : ProductBrand();
}

class ProductCategory {
  String id;
  String name;

  ProductCategory({this.id = '', this.name = ''});

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };

  static ProductCategory getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductCategory.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductCategory();
}

class ProductDescription {
  String short;
  String long;

  ProductDescription({this.short = '', this.long = ''});

  factory ProductDescription.fromJson(Map<String, dynamic> json) =>
      ProductDescription(
        short: APIHelper.getSafeStringValue(json['short']),
        long: APIHelper.getSafeStringValue(json['long']),
      );

  Map<String, dynamic> toJson() => {
        'short': short,
        'long': long,
      };

  static ProductDescription getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDescription.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDescription();
}

class ProductDiscount {
  String type;
  double amount;
  DateTime startDate;
  DateTime endDate;

  ProductDiscount(
      {this.type = '',
      this.amount = 0,
      required this.startDate,
      required this.endDate});

  factory ProductDiscount.fromJson(Map<String, dynamic> json) =>
      ProductDiscount(
        type: APIHelper.getSafeStringValue(json['type']),
        amount: APIHelper.getSafeDoubleValue(json['amount'], 0),
        startDate: APIHelper.getSafeDateTimeValue(json['start_date']),
        endDate: APIHelper.getSafeDateTimeValue(json['end_date']),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'amount': amount,
        'start_date': APIHelper.getSafeDateTimeValue(startDate),
        'end_date': APIHelper.getSafeDateTimeValue(endDate),
      };

  factory ProductDiscount.empty() => ProductDiscount(
      startDate: AppComponents.defaultUnsetDateTime,
      endDate: AppComponents.defaultUnsetDateTime);

  static ProductDiscount getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDiscount.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDiscount.empty();
}

class ProductQuantity {
  int unitQuantity;
  int stockQuantity;
  int minPurchaseQuantity;
  int stockAlertQuantity;

  ProductQuantity({
    this.unitQuantity = 0,
    this.stockQuantity = 0,
    this.minPurchaseQuantity = 0,
    this.stockAlertQuantity = 0,
  });

  factory ProductQuantity.fromJson(Map<String, dynamic> json) =>
      ProductQuantity(
        unitQuantity: APIHelper.getSafeIntValue(json['unit_quantity'], 0),
        stockQuantity: APIHelper.getSafeIntValue(json['stock_quantity'], 0),
        minPurchaseQuantity:
            APIHelper.getSafeIntValue(json['min_purchase_quantity'], 0),
        stockAlertQuantity:
            APIHelper.getSafeIntValue(json['stock_alert_quantity'], 0),
      );

  Map<String, dynamic> toJson() => {
        'unit_quantity': unitQuantity,
        'stock_quantity': stockQuantity,
        'min_purchase_quantity': minPurchaseQuantity,
        'stock_alert_quantity': stockAlertQuantity,
      };

  static ProductQuantity getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductQuantity.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductQuantity();
}

class ProductSpecification {
  String name;
  String value;

  ProductSpecification({this.name = '', this.value = ''});

  factory ProductSpecification.fromJson(Map<String, dynamic> json) =>
      ProductSpecification(
        name: APIHelper.getSafeStringValue(json['name']),
        value: APIHelper.getSafeStringValue(json['value']),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };

  static ProductSpecification getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductSpecification.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductSpecification();
}

class ProductSubcategory {
  String id;
  String name;

  ProductSubcategory({this.id = '', this.name = ''});

  factory ProductSubcategory.fromJson(Map<String, dynamic> json) =>
      ProductSubcategory(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };

  static ProductSubcategory getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductSubcategory.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductSubcategory();
}
