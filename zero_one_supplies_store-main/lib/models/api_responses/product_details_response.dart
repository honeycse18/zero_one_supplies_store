import 'dart:convert';

import 'package:ecomikstoreapp/models/local/product_add_details/product_add_details.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:get/get.dart';

class ProductDetailsResponse {
  bool error;
  String msg;
  ProductDetails data;

  ProductDetailsResponse(
      {this.error = false, this.msg = '', required this.data});

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: ProductDetails.getAPIResponseObjectSafeValue(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson(),
      };

  factory ProductDetailsResponse.empty() =>
      ProductDetailsResponse(data: ProductDetails.empty());

  static ProductDetailsResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsResponse.empty();
}

class ProductDetails {
  String id;
  ProductDetailsStore store;
  String name;
  String model;
  String productCondition;
  ProductDetailsBrand brand;
  List<ProductDetailsCategory> categories;
  List<ProductDetailsSubcategory> subcategories;
  List<String> childCategory;
  String unit;
  ProductDetailsQuantity quantity;
  List<QuantityBasedPrice> quantityBasedPrices;
  List<String> tags;
  ProductDetailsDescription description;
  double price;
  ProductDetailsDiscount discount;
  String productImage;
  List<String> galleryImages;
  String thumbImage;
  List<ProductAttribute> attribute;
  ProductDetailsAttributes attributes;
  List<ProductDetailsSpecification> specifications;
  String specificationDescription;
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
  bool popular;
  ProductDetailsDeliveryInfo deliveryInfo;
  List<dynamic> variants;
  DateTime createdAt;
  DateTime updatedAt;
  List<ProductDetailsAuction> auction;
  List<String> couponsCodes;
  ProductAddDetailsLocation productLocation;
  String relayPointID;

  ProductDetails({
    this.id = '',
    required this.store,
    this.name = '',
    this.model = '',
    this.productCondition = '',
    required this.brand,
    this.categories = const [],
    this.subcategories = const [],
    this.childCategory = const [],
    this.unit = '',
    required this.quantity,
    this.quantityBasedPrices = const [],
    this.tags = const [],
    required this.description,
    this.price = 0,
    required this.discount,
    this.productImage = '',
    this.galleryImages = const [],
    this.thumbImage = '',
    this.attribute = const [],
    required this.attributes,
    this.specifications = const [],
    this.specificationDescription = '',
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
    this.popular = false,
    required this.deliveryInfo,
    this.variants = const [],
    required this.createdAt,
    required this.updatedAt,
    this.auction = const [],
    this.couponsCodes = const [],
    required this.productLocation,
    this.relayPointID = '',
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: APIHelper.getSafeStringValue(json['_id']),
        store: ProductDetailsStore.getAPIResponseObjectSafeValue(json['store']),
        name: APIHelper.getSafeStringValue(json['name']),
        model: APIHelper.getSafeStringValue(json['model']),
        brand: ProductDetailsBrand.getAPIResponseObjectSafeValue(json['brand']),
        productCondition:
            APIHelper.getSafeStringValue(json['product_condition']),
        quantityBasedPrices:
            APIHelper.getSafeListValue(json['quantity_based_price'])
                .map((e) => QuantityBasedPrice.getAPIResponseObjectSafeValue(e))
                .toList(),
        categories: APIHelper.getSafeListValue(json['categories'])
            .map((e) => ProductDetailsCategory.getAPIResponseObjectSafeValue(e))
            .toList(),
        subcategories: APIHelper.getSafeListValue(json['subcategories'])
            .map((e) =>
                ProductDetailsSubcategory.getAPIResponseObjectSafeValue(e))
            .toList(),
        childCategory: APIHelper.getSafeListValue(json['child_category'])
            .map((e) => APIHelper.getSafeStringValue(e))
            .toList(),
        unit: APIHelper.getSafeStringValue(json['unit']),
        quantity: ProductDetailsQuantity.getAPIResponseObjectSafeValue(
            json['quantity']),
        tags: APIHelper.getSafeListValue(json['tags'])
            .map((e) => APIHelper.getSafeStringValue(e))
            .toList(),
        description: ProductDetailsDescription.getAPIResponseObjectSafeValue(
            json['description']),
        price: APIHelper.getSafeDoubleValue(json['price']),
        discount: ProductDetailsDiscount.getAPIResponseObjectSafeValue(
            json['discount']),
        productImage: APIHelper.getSafeStringValue(json['product_image']),
        galleryImages: APIHelper.getSafeListValue(json['gallery_images'])
            .map((e) => APIHelper.getSafeStringValue(e))
            .toList(),
        thumbImage: APIHelper.getSafeStringValue(json['thumb_image']),
        attribute: APIHelper.getSafeListValue(json['attribute'])
            .map((e) => ProductAttribute.getAPIResponseObjectSafeValue(e))
            .toList(),
        attributes: ProductDetailsAttributes.getAPIResponseObjectSafeValue(
            json['attributes']),
        specifications: APIHelper.getSafeListValue(json['specifications'])
            .map((e) =>
                ProductDetailsSpecification.getAPIResponseObjectSafeValue(e))
            .toList(),
        specificationDescription:
            APIHelper.getSafeStringValue(json['specification_description']),
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
        popular: APIHelper.getSafeBoolValue(json['popular']),
        deliveryInfo: ProductDetailsDeliveryInfo.getAPIResponseObjectSafeValue(
            json['delivery_info']),
        variants:
            APIHelper.getSafeListValue(json['variants']).map((e) => e).toList(),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
        auction: APIHelper.getSafeListValue(json['auction'])
            .map((e) => ProductDetailsAuction.getAPIResponseObjectSafeValue(e))
            .toList(),
        couponsCodes: APIHelper.getSafeListValue(json['coupon_codes'])
            .map((e) => APIHelper.getSafeStringValue(e))
            .toList(),
        productLocation:
            ProductAddDetailsLocation.getAPIResponseObjectSafeValue(
                json['product_location']),
        relayPointID: APIHelper.getSafeStringValue(json['relay_point_id']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'store': store.toJson(),
        'name': name,
        'model': model,
        'brand': brand.toJson(),
        'product_condition': productCondition,
        'categories': categories.map((e) => e.toJson()).toList(),
        'subcategories': subcategories.map((e) => e.toJson()).toList(),
        'child_category': childCategory,
        'unit': unit,
        'quantity': quantity.toJson(),
        'quantity_based_price':
            quantityBasedPrices.map((e) => e.toJson()).toList(),
        'tags': tags,
        'description': description.toJson(),
        'price': price,
        'discount': discount.toJson(),
        'product_image': productImage,
        'gallery_images': galleryImages,
        'thumb_image': thumbImage,
        'attributes': attributes.toJson(),
        'attribute': attribute.map((e) => e.toJson()).toList(),
        'specifications': specifications.map((e) => e.toJson()).toList(),
        'specification_description': specificationDescription,
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
        'popular': popular,
        'delivery_info': deliveryInfo.toJson(),
        'variants': variants.map((e) => e).toList(),
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
        'auction': auction.map((e) => e.toJson()).toList(),
        'coupon_codes': couponsCodes.map((e) => e).toList(),
        'product_location': productLocation.toJson(),
      };

  factory ProductDetails.empty() => ProductDetails(
      store: ProductDetailsStore(),
      brand: ProductDetailsBrand(),
      quantity: ProductDetailsQuantity(),
      description: ProductDetailsDescription(),
      discount: ProductDetailsDiscount.empty(),
      attributes: ProductDetailsAttributes(),
      deliveryInfo: ProductDetailsDeliveryInfo.empty(),
      createdAt: AppComponents.defaultUnsetDateTime,
      updatedAt: AppComponents.defaultUnsetDateTime,
      productLocation: ProductAddDetailsLocation.empty());

  static ProductDetails getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetails.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : ProductDetails.empty();
}

class ProductAttribute {
  String key;
  List<ProductAttributeOption> options;
  String id;

  ProductAttribute({this.key = '', this.options = const [], this.id = ''});

  factory ProductAttribute.fromJson(Map<String, dynamic> json) {
    return ProductAttribute(
      key: APIHelper.getSafeStringValue(json['key']),
      options: APIHelper.getSafeListValue(json['options'])
          .map((e) => ProductAttributeOption.getAPIResponseObjectSafeValue(e))
          .toList(),
      id: APIHelper.getSafeStringValue(json['_id']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = {
      'key': key,
      'options': options.map((e) => e.toJson()).toList(),
      // '_id': id,
    };
    if (id.isNotEmpty) {
      jsonMap['_id'] = id;
    }
    return jsonMap;
  }

  static ProductAttribute getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAttribute.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAttribute();

  bool get isProductColorAttribute =>
      options.any((element) => element.isValueHexColorCode);
}

class ProductAttributeOption {
  String label;
  String value;
  double price;
  String id;

  ProductAttributeOption(
      {this.label = '', this.value = '', this.price = 0, this.id = ''});

  factory ProductAttributeOption.fromJson(Map<String, dynamic> json) =>
      ProductAttributeOption(
        label: APIHelper.getSafeStringValue(json['label']),
        value: APIHelper.getSafeStringValue(json['value']),
        price: APIHelper.getSafeDoubleValue(json['price']),
        id: APIHelper.getSafeStringValue(json['_id']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = {
      'label': label,
      'value': value,
      'price': price,
      // '_id': id,
    };
    if (id.isNotEmpty) {
      jsonMap['_id'] = id;
    }
    return jsonMap;
  }

  static ProductAttributeOption getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAttributeOption.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAttributeOption();

  bool get isValueHexColorCode => Helper.isColorCode(value);
}

class ProductDetailsAttributes {
  String name;
  List<String> values;

  ProductDetailsAttributes({this.name = '', this.values = const []});

  factory ProductDetailsAttributes.fromJson(Map<String, dynamic> json) =>
      ProductDetailsAttributes(
        name: APIHelper.getSafeStringValue(json['name']),
        values: APIHelper.getSafeListValue(json['values'])
            .map((e) => APIHelper.getSafeStringValue(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'values': values,
      };

  static ProductDetailsAttributes getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsAttributes.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsAttributes();
}

class ProductDetailsAuction {
  String id;
  String store;
  String product;
  DateTime startDate;
  DateTime endDate;
  double currentPrice;
  bool status;
  List<ProductDetailsAuctionBidUser> bidUsers;
  DateTime createdAt;
  DateTime updatedAt;

  ProductDetailsAuction({
    this.id = '',
    this.store = '',
    this.product = '',
    required this.startDate,
    required this.endDate,
    this.currentPrice = 0,
    this.status = false,
    this.bidUsers = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductDetailsAuction.fromJson(Map<String, dynamic> json) =>
      ProductDetailsAuction(
        id: APIHelper.getSafeStringValue(json['_id']),
        store: APIHelper.getSafeStringValue(json['store']),
        product: APIHelper.getSafeStringValue(json['product']),
        startDate: APIHelper.getSafeDateTimeValue(json['start_date']),
        endDate: APIHelper.getSafeDateTimeValue(json['end_date']),
        currentPrice: APIHelper.getSafeDoubleValue(json['current_price'], 0),
        status: APIHelper.getSafeBoolValue(json['status']),
        bidUsers: APIHelper.getSafeListValue(json['bid_users'])
            .map((e) =>
                ProductDetailsAuctionBidUser.getAPIResponseObjectSafeValue(e))
            .toList(),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'store': store,
        'product': product,
        'start_date':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(startDate),
        'end_date':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(endDate),
        'current_price': currentPrice,
        'status': status,
        'bid_users': bidUsers.map((e) => e.toJson()).toList(),
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
      };

  factory ProductDetailsAuction.empty() => ProductDetailsAuction(
      startDate: AppComponents.defaultUnsetDateTime,
      endDate: AppComponents.defaultUnsetDateTime,
      createdAt: AppComponents.defaultUnsetDateTime,
      updatedAt: AppComponents.defaultUnsetDateTime);

  static ProductDetailsAuction getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsAuction.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsAuction.empty();
}

class ProductDetailsAuctionBidUser {
  String user;
  String firstName;
  String lastName;
  double bidAmount;
  DateTime date;
  String id;

  ProductDetailsAuctionBidUser({
    this.user = '',
    this.firstName = '',
    this.lastName = '',
    this.bidAmount = 0,
    required this.date,
    this.id = '',
  });

  factory ProductDetailsAuctionBidUser.fromJson(Map<String, dynamic> json) =>
      ProductDetailsAuctionBidUser(
        user: APIHelper.getSafeStringValue(json['user']),
        firstName: APIHelper.getSafeStringValue(json['first_name']),
        lastName: APIHelper.getSafeStringValue(json['last_name']),
        bidAmount: APIHelper.getSafeDoubleValue(json['bid_amount'], 0),
        date: APIHelper.getSafeDateTimeValue(json['date']),
        id: APIHelper.getSafeStringValue(json['_id']),
      );

  Map<String, dynamic> toJson() => {
        'user': user,
        'first_name': firstName,
        'last_name': lastName,
        'bid_amount': bidAmount,
        'date': APIHelper.toServerDateTimeFormattedStringFromDateTime(date),
        '_id': id,
      };

  factory ProductDetailsAuctionBidUser.empty() =>
      ProductDetailsAuctionBidUser(date: AppComponents.defaultUnsetDateTime);

  static ProductDetailsAuctionBidUser getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsAuctionBidUser.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsAuctionBidUser.empty();
}

class ProductDetailsBrand {
  String id;
  String name;

  ProductDetailsBrand({this.id = '', this.name = ''});

  factory ProductDetailsBrand.fromJson(Map<String, dynamic> json) =>
      ProductDetailsBrand(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };

  static ProductDetailsBrand getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsBrand.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsBrand();
}

class ProductDetailsCategory {
  String id;
  String name;

  ProductDetailsCategory({this.id = '', this.name = ''});

  factory ProductDetailsCategory.fromJson(Map<String, dynamic> json) =>
      ProductDetailsCategory(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };

  static ProductDetailsCategory getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsCategory.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsCategory();
}

class ProductDetailsDeliveryInfo {
  int delivery;
  double shipping;
  ProductDetailsDeliveryInfoProductReturn productReturn;

  ProductDetailsDeliveryInfo(
      {this.delivery = 0, this.shipping = 0, required this.productReturn});

  factory ProductDetailsDeliveryInfo.fromJson(Map<String, dynamic> json) =>
      ProductDetailsDeliveryInfo(
        delivery: APIHelper.getSafeIntValue(json['delivery'], 0),
        shipping: APIHelper.getSafeDoubleValue(json['shipping'], 0),
        productReturn: ProductDetailsDeliveryInfoProductReturn
            .getAPIResponseObjectSafeValue(json['product_return']),
      );

  Map<String, dynamic> toJson() => {
        'delivery': delivery,
        'shipping': shipping,
        'product_return': productReturn.toJson(),
      };

  factory ProductDetailsDeliveryInfo.empty() => ProductDetailsDeliveryInfo(
      productReturn: ProductDetailsDeliveryInfoProductReturn());

  static ProductDetailsDeliveryInfo getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsDeliveryInfo.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsDeliveryInfo.empty();
}

class ProductDetailsDeliveryInfoProductReturn {
  int days;
  String msg;

  ProductDetailsDeliveryInfoProductReturn({this.days = 0, this.msg = ''});

  factory ProductDetailsDeliveryInfoProductReturn.fromJson(
          Map<String, dynamic> json) =>
      ProductDetailsDeliveryInfoProductReturn(
        days: APIHelper.getSafeIntValue(json['days'], 0),
        msg: APIHelper.getSafeStringValue(json['msg']),
      );

  Map<String, dynamic> toJson() => {
        'days': days,
        'msg': msg,
      };

  static ProductDetailsDeliveryInfoProductReturn getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsDeliveryInfoProductReturn.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsDeliveryInfoProductReturn();
}

class ProductDetailsDescription {
  String short;
  String long;

  ProductDetailsDescription({this.short = '', this.long = ''});

  factory ProductDetailsDescription.fromJson(Map<String, dynamic> json) =>
      ProductDetailsDescription(
        short: APIHelper.getSafeStringValue(json['short']),
        long: APIHelper.getSafeStringValue(json['long']),
      );

  Map<String, dynamic> toJson() => {
        'short': short,
        'long': long,
      };
  static ProductDetailsDescription getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsDescription.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsDescription();
}

class ProductDetailsDiscount {
  String type;
  double amount;
  DateTime startDate;
  DateTime endDate;

  ProductDetailsDiscount(
      {this.type = '',
      this.amount = 0,
      required this.startDate,
      required this.endDate});

  factory ProductDetailsDiscount.fromJson(Map<String, dynamic> json) =>
      ProductDetailsDiscount(
        type: APIHelper.getSafeStringValue(json['type']),
        amount: APIHelper.getSafeDoubleValue(json['amount'], 0),
        startDate: APIHelper.getSafeDateTimeValue(json['start_date']),
        endDate: APIHelper.getSafeDateTimeValue(json['end_date']),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'amount': amount,
        'start_date': startDate,
        'end_date': endDate,
      };

  factory ProductDetailsDiscount.empty() => ProductDetailsDiscount(
      startDate: AppComponents.defaultUnsetDateTime,
      endDate: AppComponents.defaultUnsetDateTime);

  static ProductDetailsDiscount getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsDiscount.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsDiscount.empty();
}

class ProductDetailsQuantity {
  int unitQuantity;
  int stockQuantity;
  int minPurchaseQuantity;
  int stockAlertQuantity;

  ProductDetailsQuantity({
    this.unitQuantity = 0,
    this.stockQuantity = 0,
    this.minPurchaseQuantity = 0,
    this.stockAlertQuantity = 0,
  });

  factory ProductDetailsQuantity.fromJson(Map<String, dynamic> json) =>
      ProductDetailsQuantity(
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

  static ProductDetailsQuantity getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsQuantity.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsQuantity();
}

class QuantityBasedPrice {
  int minimum;
  int maximum;
  double price;
  String id;

  QuantityBasedPrice(
      {this.minimum = 0, this.maximum = 0, this.price = 0, this.id = ''});

  factory QuantityBasedPrice.fromJson(Map<String, dynamic> json) {
    return QuantityBasedPrice(
      minimum: APIHelper.getSafeIntValue(json['minimum']),
      maximum: APIHelper.getSafeIntValue(json['maximum']),
      price: APIHelper.getSafeDoubleValue(json['price']),
      id: APIHelper.getSafeStringValue(json['_id']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = {
      'minimum': minimum,
      'maximum': maximum,
      'price': price,
      // '_id': id,
    };
    if (id.isNotEmpty) {
      jsonMap['_id'] = id;
    }
    return jsonMap;
  }

  static QuantityBasedPrice getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? QuantityBasedPrice.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : QuantityBasedPrice();
}

class ProductDetailsSpecification {
  String key;
  String value;
  String id;

  ProductDetailsSpecification({this.key = '', this.value = '', this.id = ''});

  factory ProductDetailsSpecification.fromJson(Map<String, dynamic> json) =>
      ProductDetailsSpecification(
        key: APIHelper.getSafeStringValue(json['key']),
        value: APIHelper.getSafeStringValue(json['value']),
        id: APIHelper.getSafeStringValue(json['_id']),
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'value': value,
        '_id': id,
      };

  static ProductDetailsSpecification getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsSpecification.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsSpecification();
}

class ProductDetailsStore {
  String id;
  String name;

  ProductDetailsStore({this.id = '', this.name = ''});

  factory ProductDetailsStore.fromJson(Map<String, dynamic> json) =>
      ProductDetailsStore(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };

  static ProductDetailsStore getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsStore.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsStore();
}

class ProductDetailsSubcategory {
  String id;
  String name;

  ProductDetailsSubcategory({this.id = '', this.name = ''});

  factory ProductDetailsSubcategory.fromJson(Map<String, dynamic> json) =>
      ProductDetailsSubcategory(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };

  static ProductDetailsSubcategory getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductDetailsSubcategory.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductDetailsSubcategory();
}
