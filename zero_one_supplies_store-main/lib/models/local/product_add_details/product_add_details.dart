import 'package:ecomikstoreapp/models/api_responses/pickup_stations_response.dart';
import 'package:ecomikstoreapp/models/api_responses/product_details_response.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/utils/constants/app_components.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class ProductAddDetails {
  String id;
  String name;
  String model;
  String brand;
  String productCondition;
  List<String?> categories;
  List<String?> subcategories;
  List<String?> childCategory;
  String unit;
  List<String> tags;
  List<QuantityBasedPrice> quantityBasedPrices;
  int unitQuantity;
  int stockQuantity;
  int minPurchaseQuantity;
  int stockAlertQuantity;
  double price;
  double discountValue;
  String discountType;
  DateTime discountStartDate;
  DateTime discountEndDate;
  String short;
  String long;
  String attributeName;
  List<String> attributeValues;
  String specificationDescription;
  List<ProductAddDetailsSpecification> specifications;
  bool stockAvailable;
  bool stockVisibility;
  // bool flashDeal;
  // bool newArrival;
  // bool onSell;
  // bool bestSell;
  // bool hotSell;
  // bool trend;
  // bool featured;
  // bool popular;
  bool isStatus;
  String productImage;
  String thumbImage;
  List<String> galleryImages;
  int delivery;
  double shipping;
  ProductAddDetailsProductReturn productReturn;
  ProductAddDetailsDescription description;
  ProductAddDetailsQuantity quantity;
  ProductAddDetailsDiscount discount;
  List<ProductAttribute> attribute;
  ProductAddDetailsAttributes attributes;
  ProductAddDetailsDeliveryInfo deliveryInfo;
  ProductAddDetailsStore store;
  List<String> couponCodes;
  ProductAddDetailsLocation productLocation;
  ProductLocation selectedProductLocation;
  String relayPointID;

  ProductAddDetails({
    this.id = '',
    this.name = '',
    this.model = '',
    this.brand = '',
    this.productCondition = '',
    this.categories = const [],
    this.subcategories = const [],
    this.childCategory = const [],
    this.unit = '',
    this.tags = const [],
    this.quantityBasedPrices = const [],
    this.unitQuantity = 0,
    this.stockQuantity = 0,
    this.minPurchaseQuantity = 0,
    this.stockAlertQuantity = 0,
    this.price = 0,
    this.discountValue = 0,
    this.discountType = '',
    required this.discountStartDate,
    required this.discountEndDate,
    required this.store,
    this.short = '',
    this.long = '',
    this.attributeName = '',
    this.attributeValues = const [],
    this.specificationDescription = '',
    this.specifications = const [],
    this.stockAvailable = false,
    this.stockVisibility = false,
    // this.flashDeal = false,
    // this.newArrival = false,
    // this.onSell = false,
    // this.bestSell = false,
    // this.hotSell = false,
    // this.trend = false,
    // this.featured = false,
    // this.popular = false,
    this.isStatus = true,
    this.productImage = '',
    this.thumbImage = '',
    this.galleryImages = const [],
    this.delivery = 0,
    this.shipping = 0,
    required this.productReturn,
    required this.description,
    required this.quantity,
    required this.discount,
    this.attribute = const [],
    required this.attributes,
    required this.deliveryInfo,
    this.couponCodes = const [],
    required this.productLocation,
    required this.selectedProductLocation,
    this.relayPointID = '',
  });

  factory ProductAddDetails.fromJson(Map<String, dynamic> json) {
    return ProductAddDetails(
      id: APIHelper.getSafeStringValue(json['_id']),
      name: APIHelper.getSafeStringValue(json['name']),
      model: APIHelper.getSafeStringValue(json['model']),
      brand: APIHelper.getSafeStringValue(json['brand']),
      productCondition: APIHelper.getSafeStringValue(json['product_condition']),
      categories: APIHelper.getSafeListValue(json['categories'])
          .map((e) => APIHelper.getSafeStringValue(e))
          .toList(),
      subcategories: APIHelper.getSafeListValue(json['subcategories'])
          .map((e) => APIHelper.getSafeStringValue(e))
          .toList(),
      childCategory: APIHelper.getSafeListValue(json['child_category'])
          .map((e) => APIHelper.getSafeStringValue(e))
          .toList(),
      unit: APIHelper.getSafeStringValue(json['unit']),
      tags: APIHelper.getSafeListValue(json['tags'])
          .map((e) => APIHelper.getSafeStringValue(e))
          .toList(),
      quantityBasedPrices:
          APIHelper.getSafeListValue(json['quantity_based_price'])
              .map((e) => QuantityBasedPrice.getAPIResponseObjectSafeValue(e))
              .toList(),
      unitQuantity: APIHelper.getSafeIntValue(json['unit_quantity'], 0),
      stockQuantity: APIHelper.getSafeIntValue(json['stock_quantity'], 0),
      minPurchaseQuantity:
          APIHelper.getSafeIntValue(json['min_purchase_quantity'], 0),
      stockAlertQuantity:
          APIHelper.getSafeIntValue(json['stock_alert_quantity'], 0),
      price: APIHelper.getSafeDoubleValue(json['price'], 0),
      discountValue: APIHelper.getSafeDoubleValue(json['discount_value'], 0),
      discountType: APIHelper.getSafeStringValue(json['discount_type']),
      discountStartDate:
          APIHelper.getSafeDateTimeValue(json['discount_start_date']),
      discountEndDate:
          APIHelper.getSafeDateTimeValue(json['discount_end_date']),
      short: APIHelper.getSafeStringValue(json['short']),
      long: APIHelper.getSafeStringValue(json['long']),
      attributeName: APIHelper.getSafeStringValue(json['attribute_name']),
      attributeValues: APIHelper.getSafeListValue(json['attribute_values'])
          .map((e) => APIHelper.getSafeStringValue(e))
          .toList(),
      specificationDescription:
          APIHelper.getSafeStringValue(json['specification_description']),
      specifications: APIHelper.getSafeListValue(json['specifications'])
          .map((e) =>
              ProductAddDetailsSpecification.getAPIResponseObjectSafeValue(e))
          .toList(),
      stockAvailable: APIHelper.getSafeBoolValue(json['stock_available']),
      stockVisibility: APIHelper.getSafeBoolValue(json['stock_visibility']),
      // flashDeal: APIHelper.getSafeBoolValue(json['flash_deal']),
      // newArrival: APIHelper.getSafeBoolValue(json['new_arrival']),
      // onSell: APIHelper.getSafeBoolValue(json['on_sell']),
      // bestSell: APIHelper.getSafeBoolValue(json['best_sell']),
      // hotSell: APIHelper.getSafeBoolValue(json['hot_sell']),
      // trend: APIHelper.getSafeBoolValue(json['trend']),
      // // featured: APIHelper.getSafeBoolValue(json['featured']),
      // popular: APIHelper.getSafeBoolValue(json['popular']),
      isStatus: APIHelper.getSafeBoolValue(json['is_status'], true),
      productImage: APIHelper.getSafeStringValue(json['product_image']),
      thumbImage: APIHelper.getSafeStringValue(json['thumb_image']),
      galleryImages: APIHelper.getSafeListValue(json['gallery_images'])
          .map((e) => APIHelper.getSafeStringValue(e))
          .toList(),
      delivery: APIHelper.getSafeIntValue(json['delivery'], 0),
      shipping: APIHelper.getSafeDoubleValue(json['shipping'], 0),
      productReturn:
          ProductAddDetailsProductReturn.getAPIResponseObjectSafeValue(
              json['product_return']),
      description: ProductAddDetailsDescription.getAPIResponseObjectSafeValue(
          json['description']),
      quantity: ProductAddDetailsQuantity.getAPIResponseObjectSafeValue(
          json['quantity']),
      discount: ProductAddDetailsDiscount.getAPIResponseObjectSafeValue(
          json['discount']),
      attributes: ProductAddDetailsAttributes.getAPIResponseObjectSafeValue(
          json['attributes']),
      attribute: APIHelper.getSafeListValue(json['attribute'])
          .map((e) => ProductAttribute.getAPIResponseObjectSafeValue(e))
          .toList(),
      deliveryInfo: ProductAddDetailsDeliveryInfo.getAPIResponseObjectSafeValue(
          json['delivery_info']),
      store:
          ProductAddDetailsStore.getAPIResponseObjectSafeValue(json['store']),
      couponCodes: APIHelper.getSafeListValue(json['coupon_codes'])
          .map((e) => APIHelper.getSafeStringValue(e))
          .toList(),
      productLocation: ProductAddDetailsLocation.getAPIResponseObjectSafeValue(
          json['product_location']),
      selectedProductLocation: ProductLocation.toEnumValue(
        APIHelper.getSafeIntValue(json['product_location_selection']),
      ),
      relayPointID: APIHelper.getSafeStringValue(json['replay_point']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = {
      'is_status': isStatus,
      'stock_available': stockAvailable,
      'stock_visibility': stockVisibility,
      // 'flash_deal': flashDeal,
      // 'new_arrival': newArrival,
      // 'on_sell': onSell,
      // 'best_sell': bestSell,
      // 'hot_sell': hotSell,
      // 'trend': trend,
      // // 'featured': featured,
      // 'popular': popular,
      'store': store.id.isNotEmpty ? store.toJson() : null,
      'coupon_codes': couponCodes,
      'product_location_selection': selectedProductLocation.selectionIndex,
    };
    if (id.isNotEmpty) {
      jsonMap['_id'] = id;
    } else {
      jsonMap['is_status'] = true;
    }
    if (name.isNotEmpty) {
      jsonMap['name'] = name;
    }
    if (model.isNotEmpty) {
      jsonMap['model'] = model;
    }
    if (brand.isNotEmpty) {
      jsonMap['brand'] = brand;
    }
    if (productCondition.isNotEmpty) {
      jsonMap['product_condition'] = productCondition;
    }
    if (unit.isNotEmpty) {
      jsonMap['unit'] = unit;
    }
    if (tags.firstOrNull != null) {
      jsonMap['tags'] = tags;
    }

    if (categories.firstOrNull != null) {
      jsonMap['categories'] = categories;
    }
    if (subcategories.firstOrNull != null) {
      jsonMap['subcategories'] = subcategories;
    }
    if (childCategory.firstOrNull != null) {
      jsonMap['child_category'] = childCategory;
    }
    if (quantityBasedPrices.firstOrNull != null) {
      jsonMap['quantity_based_price'] =
          quantityBasedPrices.map((e) => e.toJson()).toList();
    }
    if (unitQuantity != 0) {
      jsonMap['unit_quantity'] = unitQuantity;
    }
    if (stockQuantity != 0) {
      jsonMap['stock_quantity'] = stockQuantity;
    }
    if (minPurchaseQuantity != 0) {
      jsonMap['min_purchase_quantity'] = minPurchaseQuantity;
    }
    if (stockAlertQuantity != 0) {
      jsonMap['stock_alert_quantity'] = stockAlertQuantity;
    }
    if (price != 0) {
      jsonMap['price'] = price;
    }
    if (discountStartDate.year != Constants.defaultUnsetDateTimeYear) {
      jsonMap['discount_start_date'] =
          APIHelper.toServerDateTimeFormattedStringFromDateTime(
              discountStartDate);
    }
    if (discountEndDate.year != Constants.defaultUnsetDateTimeYear) {
      jsonMap['discount_end_date'] =
          APIHelper.toServerDateTimeFormattedStringFromDateTime(
              discountEndDate);
    }
    if (short.isNotEmpty) {
      jsonMap['short'] = short;
    }
    if (long.isNotEmpty) {
      jsonMap['long'] = long;
    }
    if (attributeName.isNotEmpty) {
      jsonMap['attribute_name'] = attributeName;
    }
    if (attributeValues.isNotEmpty) {
      jsonMap['attribute_values'] = attributeValues;
    }
    if (specificationDescription.isNotEmpty) {
      jsonMap['specification_description'] = specificationDescription;
    }
    if (specifications.isNotEmpty) {
      jsonMap['specifications'] =
          specifications.map((e) => e.toJson()).toList();
    }
    if (productImage.isNotEmpty) {
      jsonMap['product_image'] = productImage;
    }
    if (thumbImage.isNotEmpty) {
      jsonMap['thumb_image'] = thumbImage;
    }
    if (galleryImages.isNotEmpty) {
      jsonMap['gallery_images'] = galleryImages;
    }
    if (delivery != 0) {
      jsonMap['delivery'] = delivery;
    }
    if (shipping != 0) {
      jsonMap['shipping'] = shipping;
    }
    if (productReturn.days != 0) {
      jsonMap['return'] = productReturn.toJson();
    }
    if (description.short.isNotEmpty || description.long.isNotEmpty) {
      jsonMap['description'] = description.toJson();
    }
    if (quantity.minPurchaseQuantity != 0 ||
        quantity.stockAlertQuantity != 0 ||
        quantity.stockQuantity != 0 ||
        quantity.unitQuantity != 0) {
      jsonMap['quantity'] = quantity.toJson();
    }
    if (attributes.name.isNotEmpty || attributes.values.isNotEmpty) {
      jsonMap['attributes'] = attributes.toJson();
    }
    if (attribute.isNotEmpty) {
      jsonMap['attribute'] = attribute.map((e) => e.toJson()).toList();
    }
    if (deliveryInfo.shipping != 0 ||
        deliveryInfo.productReturn.msg.isNotEmpty) {
      jsonMap['delivery_info'] = deliveryInfo.toJson();
    }

    /*{
    }; */
    if (discount.type.isNotEmpty) {
      jsonMap['discount'] = discount;
      jsonMap['discount_type'] = discountType;
      jsonMap['discount_value'] = discountValue;
    }
    if (productLocation.isNotEmpty) {
      jsonMap['product_location'] = productLocation.toJson();
    }
    if (relayPointID.isNotEmpty) {
      jsonMap['replay_point'] = relayPointID;
    }

    return jsonMap;
  }

  factory ProductAddDetails.empty() => ProductAddDetails(
        discountStartDate: AppComponents.defaultUnsetDateTime,
        discountEndDate: AppComponents.defaultUnsetDateTime,
        productReturn: ProductAddDetailsProductReturn(),
        description: ProductAddDetailsDescription(),
        quantity: ProductAddDetailsQuantity(),
        discount: ProductAddDetailsDiscount.empty(),
        attributes: ProductAddDetailsAttributes(),
        store: ProductAddDetailsStore(),
        deliveryInfo: ProductAddDetailsDeliveryInfo.empty(),
        productLocation: ProductAddDetailsLocation.empty(),
        selectedProductLocation: ProductLocation.defaultValue,
      );

  static ProductAddDetails getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAddDetails.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAddDetails.empty();

  bool get isProductEditing => id.isNotEmpty;

  ProductAddDetails copyWith({
    String? id,
    String? name,
    String? model,
    String? brand,
    String? productCondition,
    List<String>? categories,
    List<String>? subcategories,
    List<String>? childCategory,
    String? unit,
    List<String>? tags,
    int? unitQuantity,
    int? stockQuantity,
    int? minPurchaseQuantity,
    int? stockAlertQuantity,
    double? price,
    List<QuantityBasedPrice>? quantityBasedPrices,
    double? discountValue,
    String? discountType,
    DateTime? discountStartDate,
    DateTime? discountEndDate,
    String? short,
    String? long,
    String? attributeName,
    List<String>? attributeValues,
    List<ProductAttribute>? attribute,
    String? specificationDescription,
    List<ProductAddDetailsSpecification>? specifications,
    bool? stockAvailable,
    bool? stockVisibility,
    bool? flashDeal,
    bool? newArrival,
    bool? onSell,
    bool? bestSell,
    bool? hotSell,
    bool? trend,
    bool? featured,
    bool? popular,
    bool? isStatus,
    String? productImage,
    String? thumbImage,
    List<String>? galleryImages,
    int? delivery,
    double? shipping,
    ProductAddDetailsAttributes? attributes,
    ProductAddDetailsDeliveryInfo? deliveryInfo,
    ProductAddDetailsDescription? description,
    ProductAddDetailsDiscount? discount,
    ProductAddDetailsProductReturn? productReturn,
    ProductAddDetailsQuantity? quantity,
    ProductAddDetailsStore? store,
    List<String>? couponCodes,
    ProductAddDetailsLocation? productLocation,
    ProductLocation? selectedProductLocation,
    String? relayPointID,
  }) {
    return ProductAddDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      productCondition: productCondition ?? this.productCondition,
      categories: categories ?? this.categories,
      subcategories: subcategories ?? this.subcategories,
      childCategory: childCategory ?? this.childCategory,
      unit: unit ?? this.unit,
      tags: tags ?? this.tags,
      unitQuantity: unitQuantity ?? this.unitQuantity,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      minPurchaseQuantity: minPurchaseQuantity ?? this.minPurchaseQuantity,
      stockAlertQuantity: stockAlertQuantity ?? this.stockAlertQuantity,
      price: price ?? this.price,
      quantityBasedPrices: quantityBasedPrices ?? this.quantityBasedPrices,
      discountValue: discountValue ?? this.discountValue,
      discountType: discountType ?? this.discountType,
      discountStartDate: discountStartDate ?? this.discountStartDate,
      discountEndDate: discountEndDate ?? this.discountEndDate,
      short: short ?? this.short,
      long: long ?? this.long,
      attribute: attribute ?? this.attribute,
      attributeName: attributeName ?? this.attributeName,
      attributeValues: attributeValues ?? this.attributeValues,
      specificationDescription:
          specificationDescription ?? this.specificationDescription,
      specifications: specifications ?? this.specifications,
      stockAvailable: stockAvailable ?? this.stockAvailable,
      stockVisibility: stockVisibility ?? this.stockVisibility,
      // flashDeal: flashDeal ?? this.flashDeal,
      // newArrival: newArrival ?? this.newArrival,
      // onSell: onSell ?? this.onSell,
      // bestSell: bestSell ?? this.bestSell,
      // hotSell: hotSell ?? this.hotSell,
      // trend: trend ?? this.trend,
      // // featured: featured ?? this.featured,
      // popular: popular ?? this.popular,
      isStatus: isStatus ?? this.isStatus,
      productImage: productImage ?? this.productImage,
      thumbImage: thumbImage ?? this.thumbImage,
      galleryImages: galleryImages ?? this.galleryImages,
      delivery: delivery ?? this.delivery,
      shipping: shipping ?? this.shipping,
      attributes: attributes ?? this.attributes,
      deliveryInfo: deliveryInfo ?? this.deliveryInfo,
      description: description ?? this.description,
      discount: discount ?? this.discount,
      productReturn: productReturn ?? this.productReturn,
      quantity: quantity ?? this.quantity,
      store: store ?? this.store,
      couponCodes: couponCodes ?? this.couponCodes,
      productLocation: productLocation ?? this.productLocation,
      selectedProductLocation:
          selectedProductLocation ?? this.selectedProductLocation,
      relayPointID: relayPointID ?? this.relayPointID,
    );
  }
}

class ProductAddDetailsLocation {
  String type;
  ProductAddDetailsLocationStore store;
  PickupStation relayPoint;

  ProductAddDetailsLocation(
      {this.type = '', required this.store, required this.relayPoint});

  factory ProductAddDetailsLocation.fromJson(Map<String, dynamic> json) {
    return ProductAddDetailsLocation(
      type: APIHelper.getSafeStringValue(json['type']),
      store: ProductAddDetailsLocationStore.getAPIResponseObjectSafeValue(
          json['store']),
      relayPoint:
          PickupStation.getAPIResponseObjectSafeValue(json['replay_point']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {
      'type': type,
    };
    switch (locationType) {
      case ProductLocation.pickupStations:
        map['replay_point'] = relayPoint.toJson();
        break;
      case ProductLocation.store:
        map['store'] = store.toJson();
        break;
      default:
    }
    return map;
  }

  factory ProductAddDetailsLocation.empty() => ProductAddDetailsLocation(
      store: ProductAddDetailsLocationStore.empty(),
      relayPoint: PickupStation.empty());

  static ProductAddDetailsLocation getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAddDetailsLocation.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAddDetailsLocation.empty();

  bool get isEmpty => store.id.isEmpty;
  bool get isNotEmpty => !isEmpty;

  ProductLocation get locationType {
    return ProductLocation.typeToEnumValue(type);
    // if (type == 'replay_point') {
    //   return ProductLocation.pickupStations;
    // } else if (type == 'store') {
    //   return ProductLocation.store;
    // }
    // return ProductLocation.none;
  }
}

class ProductAddDetailsLocationStore {
  String id;
  String name;
  String address;
  ProductAddDetailsLocationStoreLocation location;

  ProductAddDetailsLocationStore(
      {this.id = '',
      this.name = '',
      this.address = '',
      required this.location});

  factory ProductAddDetailsLocationStore.fromJson(Map<String, dynamic> json) =>
      ProductAddDetailsLocationStore(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
        address: APIHelper.getSafeStringValue(json['address']),
        location: ProductAddDetailsLocationStoreLocation
            .getAPIResponseObjectSafeValue(json['location']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'address': address,
        'location': location.toJson(),
      };

  factory ProductAddDetailsLocationStore.empty() =>
      ProductAddDetailsLocationStore(
          location: ProductAddDetailsLocationStoreLocation());

  static ProductAddDetailsLocationStore getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAddDetailsLocationStore.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAddDetailsLocationStore.empty();
}

class ProductAddDetailsLocationStoreLocation {
  double latitude;
  double longitude;

  ProductAddDetailsLocationStoreLocation(
      {this.latitude = Constants.unsetMapLatLng,
      this.longitude = Constants.unsetMapLatLng});

  factory ProductAddDetailsLocationStoreLocation.fromJson(
          Map<String, dynamic> json) =>
      ProductAddDetailsLocationStoreLocation(
        latitude: APIHelper.getSafeDoubleValue(
            json['latitude'], Constants.unsetMapLatLng),
        longitude: APIHelper.getSafeDoubleValue(
            json['longitude'], Constants.unsetMapLatLng),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
  static ProductAddDetailsLocationStoreLocation getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAddDetailsLocationStoreLocation.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAddDetailsLocationStoreLocation();
}

class ProductAddDetailsStore {
  String id;
  String name;

  ProductAddDetailsStore({this.name = '', this.id = ''});

  factory ProductAddDetailsStore.fromJson(Map<String, dynamic> json) =>
      ProductAddDetailsStore(
        name: APIHelper.getSafeStringValue(json['name']),
        id: APIHelper.getSafeStringValue(json['_id']),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        '_id': id,
      };

  static ProductAddDetailsStore getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAddDetailsStore.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAddDetailsStore();
}

class ProductAddDetailsSpecification {
  String key;
  String value;
  String id;

  ProductAddDetailsSpecification(
      {this.key = '', this.value = '', this.id = ''});

  factory ProductAddDetailsSpecification.fromJson(Map<String, dynamic> json) =>
      ProductAddDetailsSpecification(
        key: APIHelper.getSafeStringValue(json['key']),
        value: APIHelper.getSafeStringValue(json['value']),
        id: APIHelper.getSafeStringValue(json['_id']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = {
      'key': key,
      'value': value,
      // '_id': id,
    };
    if (id.isNotEmpty) {
      jsonMap['_id'] = id;
    }
    return jsonMap;
  }

  static ProductAddDetailsSpecification getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAddDetailsSpecification.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAddDetailsSpecification();

  bool get isAdding {
    return id.isEmpty;
  }
}

class ProductAddDetailsProductReturn {
  int days;
  String msg;

  ProductAddDetailsProductReturn({this.days = 0, this.msg = ''});

  factory ProductAddDetailsProductReturn.fromJson(Map<String, dynamic> json) =>
      ProductAddDetailsProductReturn(
        days: APIHelper.getSafeIntValue(json['days'], 0),
        msg: APIHelper.getSafeStringValue(json['msg']),
      );

  Map<String, dynamic> toJson() => {
        'days': days,
        'msg': msg,
      };

  static ProductAddDetailsProductReturn getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAddDetailsProductReturn.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAddDetailsProductReturn();
}

class ProductAddDetailsDescription {
  String short;
  String long;

  ProductAddDetailsDescription({this.short = '', this.long = ''});

  factory ProductAddDetailsDescription.fromJson(Map<String, dynamic> json) =>
      ProductAddDetailsDescription(
        short: APIHelper.getSafeStringValue(json['short']),
        long: APIHelper.getSafeStringValue(json['long']),
      );

  Map<String, dynamic> toJson() => {
        'short': short,
        'long': long,
      };

  static ProductAddDetailsDescription getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAddDetailsDescription.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAddDetailsDescription();
}

class ProductAddDetailsQuantity {
  int unitQuantity;
  int stockQuantity;
  int minPurchaseQuantity;
  int stockAlertQuantity;

  ProductAddDetailsQuantity({
    this.unitQuantity = 0,
    this.stockQuantity = 0,
    this.minPurchaseQuantity = 0,
    this.stockAlertQuantity = 0,
  });

  factory ProductAddDetailsQuantity.fromJson(Map<String, dynamic> json) =>
      ProductAddDetailsQuantity(
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

  static ProductAddDetailsQuantity getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAddDetailsQuantity.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAddDetailsQuantity();
}

class ProductAddDetailsDiscount {
  String type;
  double amount;
  DateTime startDate;
  DateTime endDate;

  ProductAddDetailsDiscount(
      {this.type = '',
      this.amount = 0,
      required this.startDate,
      required this.endDate});

  factory ProductAddDetailsDiscount.fromJson(Map<String, dynamic> json) =>
      ProductAddDetailsDiscount(
        type: APIHelper.getSafeStringValue(json['type']),
        amount: APIHelper.getSafeDoubleValue(json['amount'], 0),
        startDate: APIHelper.getSafeDateTimeValue(json['start_date']),
        endDate: APIHelper.getSafeDateTimeValue(json['end_date']),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'amount': amount,
        'start_date':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(startDate),
        'end_date':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(endDate),
      };

  factory ProductAddDetailsDiscount.empty() => ProductAddDetailsDiscount(
      startDate: AppComponents.defaultUnsetDateTime,
      endDate: AppComponents.defaultUnsetDateTime);

  static ProductAddDetailsDiscount getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAddDetailsDiscount.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAddDetailsDiscount.empty();

  bool get isEmpty {
    return (type.isEmpty ||
        amount <= 0 ||
        startDate.isAtSameMomentAs(AppComponents.defaultUnsetDateTime) ||
        endDate.isAtSameMomentAs(AppComponents.defaultUnsetDateTime));
  }
}

class ProductAddDetailsAttributes {
  String name;
  List<String> values;

  ProductAddDetailsAttributes({this.name = '', this.values = const []});

  factory ProductAddDetailsAttributes.fromJson(Map<String, dynamic> json) =>
      ProductAddDetailsAttributes(
        name: APIHelper.getSafeStringValue(json['name']),
        values: APIHelper.getSafeListValue(json['values'])
            .map((e) => APIHelper.getSafeStringValue(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'values': values,
      };

  static ProductAddDetailsAttributes getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAddDetailsAttributes.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAddDetailsAttributes();

  bool get isEmpty {
    return (name.isEmpty || values.isEmpty);
  }
}

class ProductAddDetailsDeliveryInfo {
  int delivery;
  double shipping;
  ProductAddDetailsProductReturn productReturn;

  ProductAddDetailsDeliveryInfo(
      {this.delivery = 0, this.shipping = 0, required this.productReturn});

  factory ProductAddDetailsDeliveryInfo.fromJson(Map<String, dynamic> json) =>
      ProductAddDetailsDeliveryInfo(
        delivery: APIHelper.getSafeIntValue(json['delivery'], 0),
        shipping: APIHelper.getSafeDoubleValue(json['shipping'], 0),
        productReturn:
            ProductAddDetailsProductReturn.getAPIResponseObjectSafeValue(
                json['product_return']),
      );

  Map<String, dynamic> toJson() => {
        'delivery': delivery,
        'shipping': shipping,
        'product_return': productReturn.toJson(),
      };

  factory ProductAddDetailsDeliveryInfo.empty() =>
      ProductAddDetailsDeliveryInfo(
          productReturn: ProductAddDetailsProductReturn());

  static ProductAddDetailsDeliveryInfo getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProductAddDetailsDeliveryInfo.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProductAddDetailsDeliveryInfo.empty();
}
