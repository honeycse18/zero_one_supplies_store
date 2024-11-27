import 'package:ecomikstoreapp/utils/constants/app_components.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class AddProductInitialResponse {
  bool error;
  String msg;
  AddProductInitialPostData data;

  AddProductInitialResponse(
      {this.error = false, this.msg = '', required this.data});

  factory AddProductInitialResponse.fromJson(Map<String, dynamic> json) {
    return AddProductInitialResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data:
          AddProductInitialPostData.getAPIResponseObjectSafeValue(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson(),
      };

  factory AddProductInitialResponse.empty() => AddProductInitialResponse(
        data: AddProductInitialPostData.empty(),
      );
  static AddProductInitialResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AddProductInitialResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AddProductInitialResponse.empty();
}

class AddProductInitialPostData {
  AddProductInitialPostStore? store;
  String name;
  String model;
  String productCondition;
  String brand;
  List<String> categories;
  List<String> subcategories;
  List<String> childCategory;
  String unit;
  AddProductInitialPostQuantity quantity;
  List<String> tags;
  List<String> metaTags;
  AddProductInitialPostDescription description;
  int price;
  List<AddProductInitialPostQuantityBasedPrice> quantityBasedPrice;
  AddProductInitialPostDiscount discount;
  String productImage;
  List<String> galleryImages;
  String thumbImage;
  List<AddProductInitialPostAttribute> attribute;
  List<AddProductInitialPostAttributesChecked> attributesChecked;
  List<dynamic> specifications;
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
  AddProductInitialPostDeliveryInfo deliveryInfo;
  bool isDraft;
  String id;
  List<dynamic> variants;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  AddProductInitialPostData({
    required this.store,
    this.name = '',
    this.model = '',
    this.productCondition = '',
    this.brand = '',
    this.categories = const [],
    this.subcategories = const [],
    this.childCategory = const [],
    this.unit = '',
    required this.quantity,
    this.tags = const [],
    this.metaTags = const [],
    required this.description,
    this.price = 0,
    this.quantityBasedPrice = const [],
    required this.discount,
    this.productImage = '',
    this.galleryImages = const [],
    this.thumbImage = '',
    this.attribute = const [],
    this.attributesChecked = const [],
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
    this.isDraft = false,
    this.id = '',
    this.variants = const [],
    required this.createdAt,
    required this.updatedAt,
    this.v = 0,
  });

  factory AddProductInitialPostData.fromJson(Map<String, dynamic> json) =>
      AddProductInitialPostData(
        store: AddProductInitialPostStore.getAPIResponseObjectSafeValue(
            json['store']),
        name: APIHelper.getSafeStringValue(json['name']),
        model: APIHelper.getSafeStringValue(json['model']),
        productCondition:
            APIHelper.getSafeStringValue(json['product_condition']),
        brand: APIHelper.getSafeStringValue(json['brand']),
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
        quantity: AddProductInitialPostQuantity.getAPIResponseObjectSafeValue(
            json['quantity']),
        tags: APIHelper.getSafeListValue(json['tags']),
        metaTags: APIHelper.getSafeListValue(json['meta_tags'])
            .map((e) => APIHelper.getSafeStringValue(e))
            .toList(),
        description:
            AddProductInitialPostDescription.getAPIResponseObjectSafeValue(
                json['description']),
        price: APIHelper.getSafeIntValue(json['price']),
        quantityBasedPrice:
            APIHelper.getSafeListValue(json['quantity_based_price'])
                .map((e) => AddProductInitialPostQuantityBasedPrice
                    .getAPIResponseObjectSafeValue(e))
                .toList(),
        discount: AddProductInitialPostDiscount.getAPIResponseObjectSafeValue(
            json['discount']),
        productImage: APIHelper.getSafeStringValue(json['product_image']),
        galleryImages: APIHelper.getSafeListValue(json['gallery_images'])
            .map((e) => APIHelper.getSafeStringValue(e))
            .toList(),
        thumbImage: APIHelper.getSafeStringValue(json['thumb_image']),
        attribute: APIHelper.getSafeListValue(json['attribute'])
            .map((e) =>
                AddProductInitialPostAttribute.getAPIResponseObjectSafeValue(e))
            .toList(),
        attributesChecked:
            APIHelper.getSafeListValue(json['attributes_checked'])
                .map((e) => AddProductInitialPostAttributesChecked
                    .getAPIResponseObjectSafeValue(e))
                .toList(),
        specifications: APIHelper.getSafeListValue(json['specifications']),
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
        deliveryInfo:
            AddProductInitialPostDeliveryInfo.getAPIResponseObjectSafeValue(
                json['delivery_info']),
        isDraft: APIHelper.getSafeBoolValue(json['is_draft']),
        id: APIHelper.getSafeStringValue(json['_id']),
        variants: APIHelper.getSafeListValue(json['variants']),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
        v: APIHelper.getSafeIntValue(json['__v']),
      );

  Map<String, dynamic> toJson() => {
        'store': store?.toJson(),
        'name': name,
        'model': model,
        'product_condition': productCondition,
        'brand': brand,
        'categories': categories,
        'subcategories': subcategories,
        'child_category': childCategory,
        'unit': unit,
        'quantity': quantity.toJson(),
        'tags': tags,
        'meta_tags': metaTags,
        'description': description.toJson(),
        'price': price,
        'quantity_based_price':
            quantityBasedPrice.map((e) => e.toJson()).toList(),
        'discount': discount.toJson(),
        'product_image': productImage,
        'gallery_images': galleryImages,
        'thumb_image': thumbImage,
        'attribute': attribute.map((e) => e.toJson()).toList(),
        'attributes_checked': attributesChecked.map((e) => e.toJson()).toList(),
        'specifications': specifications,
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
        'is_draft': isDraft,
        '_id': id,
        'variants': variants,
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
        '__v': v,
      };

  factory AddProductInitialPostData.empty() => AddProductInitialPostData(
      store: AddProductInitialPostStore(),
      quantity: AddProductInitialPostQuantity(),
      description: AddProductInitialPostDescription(),
      discount: AddProductInitialPostDiscount.empty(),
      deliveryInfo: AddProductInitialPostDeliveryInfo.empty(),
      createdAt: AppComponents.defaultUnsetDateTime,
      updatedAt: AppComponents.defaultUnsetDateTime);
  static AddProductInitialPostData getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AddProductInitialPostData.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AddProductInitialPostData.empty();
}

class AddProductInitialPostAttribute {
  String key;
  List<AddProductInitialOption> options;
  String id;

  AddProductInitialPostAttribute(
      {this.key = '', this.options = const [], this.id = ''});

  factory AddProductInitialPostAttribute.fromJson(Map<String, dynamic> json) =>
      AddProductInitialPostAttribute(
        key: APIHelper.getSafeStringValue(json['key']),
        options: APIHelper.getSafeListValue(json['options'])
            .map(
                (e) => AddProductInitialOption.getAPIResponseObjectSafeValue(e))
            .toList(),
        id: APIHelper.getSafeStringValue(json['_id']),
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'options': options.map((e) => e.toJson()).toList(),
        '_id': id,
      };

  static AddProductInitialPostAttribute getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AddProductInitialPostAttribute.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AddProductInitialPostAttribute();
}

class AddProductInitialOption {
  String label;
  String value;
  int price;
  String id;

  AddProductInitialOption(
      {this.label = '', this.value = '', this.price = 0, this.id = ''});

  factory AddProductInitialOption.fromJson(Map<String, dynamic> json) =>
      AddProductInitialOption(
        label: APIHelper.getSafeStringValue(json['label']),
        value: APIHelper.getSafeStringValue(json['value']),
        price: APIHelper.getSafeIntValue(json['price']),
        id: APIHelper.getSafeStringValue(json['_id']),
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
        'price': price,
        '_id': id,
      };

  static AddProductInitialOption getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AddProductInitialOption.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AddProductInitialOption();
}

class AddProductInitialPostAttributesChecked {
  bool attribute;
  int index;

  AddProductInitialPostAttributesChecked(
      {this.attribute = false, this.index = 0});

  factory AddProductInitialPostAttributesChecked.fromJson(
      Map<String, dynamic> json) {
    return AddProductInitialPostAttributesChecked(
      attribute: APIHelper.getSafeBoolValue(json['attribute']),
      index: APIHelper.getSafeIntValue(json['index']),
    );
  }

  Map<String, dynamic> toJson() => {
        'attribute': attribute,
        'index': index,
      };

  static AddProductInitialPostAttributesChecked getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AddProductInitialPostAttributesChecked.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AddProductInitialPostAttributesChecked();
}

class AddProductInitialPostDeliveryInfo {
  int delivery;
  int shipping;
  AddProductInitialPostProductReturn productReturn;

  AddProductInitialPostDeliveryInfo(
      {this.delivery = 0, this.shipping = 0, required this.productReturn});

  factory AddProductInitialPostDeliveryInfo.fromJson(
          Map<String, dynamic> json) =>
      AddProductInitialPostDeliveryInfo(
        delivery: APIHelper.getSafeIntValue(json['delivery']),
        shipping: APIHelper.getSafeIntValue(json['shipping']),
        productReturn:
            AddProductInitialPostProductReturn.getAPIResponseObjectSafeValue(
                json['product_return']),
      );

  Map<String, dynamic> toJson() => {
        'delivery': delivery,
        'shipping': shipping,
        'product_return': productReturn.toJson(),
      };

  factory AddProductInitialPostDeliveryInfo.empty() =>
      AddProductInitialPostDeliveryInfo(
        productReturn: AddProductInitialPostProductReturn(),
      );
  static AddProductInitialPostDeliveryInfo getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AddProductInitialPostDeliveryInfo.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AddProductInitialPostDeliveryInfo.empty();
}

class AddProductInitialPostProductReturn {
  int days;
  String msg;

  AddProductInitialPostProductReturn({this.days = 0, this.msg = ''});

  factory AddProductInitialPostProductReturn.fromJson(
          Map<String, dynamic> json) =>
      AddProductInitialPostProductReturn(
        days: APIHelper.getSafeIntValue(json['days']),
        msg: APIHelper.getSafeStringValue(json['msg']),
      );

  Map<String, dynamic> toJson() => {
        'days': days,
        'msg': msg,
      };

  static AddProductInitialPostProductReturn getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AddProductInitialPostProductReturn.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AddProductInitialPostProductReturn();
}

class AddProductInitialPostDescription {
  String short;
  String long;

  AddProductInitialPostDescription({this.short = '', this.long = ''});

  factory AddProductInitialPostDescription.fromJson(
          Map<String, dynamic> json) =>
      AddProductInitialPostDescription(
        short: APIHelper.getSafeStringValue(json['short']),
        long: APIHelper.getSafeStringValue(json['long']),
      );

  Map<String, dynamic> toJson() => {
        'short': short,
        'long': long,
      };

  static AddProductInitialPostDescription getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AddProductInitialPostDescription.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AddProductInitialPostDescription();
}

class AddProductInitialPostDiscount {
  String type;
  int amount;
  DateTime startDate;
  DateTime endDate;

  AddProductInitialPostDiscount(
      {this.type = '',
      this.amount = 0,
      required this.startDate,
      required this.endDate});

  factory AddProductInitialPostDiscount.fromJson(Map<String, dynamic> json) =>
      AddProductInitialPostDiscount(
        type: APIHelper.getSafeStringValue(json['type']),
        amount: APIHelper.getSafeIntValue(json['amount']),
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

  factory AddProductInitialPostDiscount.empty() =>
      AddProductInitialPostDiscount(
          startDate: AppComponents.defaultUnsetDateTime,
          endDate: AppComponents.defaultUnsetDateTime);
  static AddProductInitialPostDiscount getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AddProductInitialPostDiscount.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AddProductInitialPostDiscount.empty();
}

class AddProductInitialPostQuantity {
  int unitQuantity;
  int stockQuantity;
  int minPurchaseQuantity;
  int stockAlertQuantity;

  AddProductInitialPostQuantity({
    this.unitQuantity = 0,
    this.stockQuantity = 0,
    this.minPurchaseQuantity = 0,
    this.stockAlertQuantity = 0,
  });

  factory AddProductInitialPostQuantity.fromJson(Map<String, dynamic> json) =>
      AddProductInitialPostQuantity(
        unitQuantity: APIHelper.getSafeIntValue(json['unit_quantity']),
        stockQuantity: APIHelper.getSafeIntValue(json['stock_quantity']),
        minPurchaseQuantity:
            APIHelper.getSafeIntValue(json['min_purchase_quantity']),
        stockAlertQuantity:
            APIHelper.getSafeIntValue(json['stock_alert_quantity']),
      );

  Map<String, dynamic> toJson() => {
        'unit_quantity': unitQuantity,
        'stock_quantity': stockQuantity,
        'min_purchase_quantity': minPurchaseQuantity,
        'stock_alert_quantity': stockAlertQuantity,
      };

  static AddProductInitialPostQuantity getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AddProductInitialPostQuantity.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AddProductInitialPostQuantity();
}

class AddProductInitialPostQuantityBasedPrice {
  int minimum;
  int maximum;
  int price;
  String id;

  AddProductInitialPostQuantityBasedPrice(
      {this.minimum = 0, this.maximum = 0, this.price = 0, this.id = ''});

  factory AddProductInitialPostQuantityBasedPrice.fromJson(
      Map<String, dynamic> json) {
    return AddProductInitialPostQuantityBasedPrice(
      minimum: APIHelper.getSafeIntValue(json['minimum']),
      maximum: APIHelper.getSafeIntValue(json['maximum']),
      price: APIHelper.getSafeIntValue(json['price']),
      id: APIHelper.getSafeStringValue(json['_id']),
    );
  }

  Map<String, dynamic> toJson() => {
        'minimum': minimum,
        'maximum': maximum,
        'price': price,
        '_id': id,
      };

  static AddProductInitialPostQuantityBasedPrice getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AddProductInitialPostQuantityBasedPrice.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AddProductInitialPostQuantityBasedPrice();
}

class AddProductInitialPostStore {
  String id;
  String name;

  AddProductInitialPostStore({this.id = '', this.name = ''});

  factory AddProductInitialPostStore.fromJson(Map<String, dynamic> json) =>
      AddProductInitialPostStore(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
      };

  static AddProductInitialPostStore getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AddProductInitialPostStore.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AddProductInitialPostStore();
}
