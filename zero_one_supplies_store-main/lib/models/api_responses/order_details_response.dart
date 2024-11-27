import 'package:ecomikstoreapp/utils/constants/app_components.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class OrderDetailsResponse {
  bool error;
  String msg;
  OrderDetails data;

  OrderDetailsResponse({this.error = false, this.msg = '', required this.data});

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    return OrderDetailsResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: OrderDetails.getAPIResponseObjectSafeValue(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson(),
      };

  factory OrderDetailsResponse.empty() =>
      OrderDetailsResponse(data: OrderDetails.empty());

  static OrderDetailsResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetailsResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : OrderDetailsResponse.empty();
}

class OrderDetails {
  String id;
  String orderNumber;
  String date;
  OrderDetailsUser user;
  List<OrderDetailsProduct> products;
  double netPrice;
  double subtotal;
  double discount;
  OrderDetailsDiscountCoupon discountCoupon;
  double vat;
  OrderDetailsVatApplied vatApplied;
  OrderDetailsDelivery delivery;
  double total;
  OrderDetailsAddress address;
  String paymentStatus;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  OrderDetailsPickupStation pickupStation;
  dynamic cusAddress;
  dynamic estimatedDeliveryDay;
  dynamic receivedTime;

  OrderDetails({
    this.id = '',
    this.orderNumber = '',
    this.date = '',
    required this.user,
    this.products = const [],
    this.netPrice = 0,
    this.subtotal = 0,
    this.discount = 0,
    required this.discountCoupon,
    this.vat = 0,
    required this.vatApplied,
    required this.delivery,
    this.total = 0,
    required this.address,
    this.paymentStatus = '',
    this.status = '',
    required this.createdAt,
    required this.updatedAt,
    required this.pickupStation,
    this.cusAddress,
    this.estimatedDeliveryDay,
    this.receivedTime,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        id: APIHelper.getSafeStringValue(json['_id']),
        orderNumber: APIHelper.getSafeStringValue(json['order_number']),
        date: APIHelper.getSafeStringValue(json['date']),
        user: OrderDetailsUser.getAPIResponseObjectSafeValue(json['user']),
        products: APIHelper.getSafeListValue(json['products'])
            .map((e) => OrderDetailsProduct.getAPIResponseObjectSafeValue(e))
            .toList(),
        netPrice: APIHelper.getSafeDoubleValue(json['net_price'], 0),
        subtotal: APIHelper.getSafeDoubleValue(json['subtotal'], 0),
        discount: APIHelper.getSafeDoubleValue(json['discount'], 0),
        discountCoupon:
            OrderDetailsDiscountCoupon.getAPIResponseObjectSafeValue(
                json['discount_coupon']),
        vat: APIHelper.getSafeDoubleValue(json['vat'], 0),
        vatApplied: OrderDetailsVatApplied.getAPIResponseObjectSafeValue(
            json['vat_applied']),
        delivery: OrderDetailsDelivery.getAPIResponseObjectSafeValue(
            json['delivery']),
        total: APIHelper.getSafeDoubleValue(json['total'], 0),
        address:
            OrderDetailsAddress.getAPIResponseObjectSafeValue(json['address']),
        paymentStatus: APIHelper.getSafeStringValue(json['payment_status']),
        status: APIHelper.getSafeStringValue(json['status']),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
        pickupStation: OrderDetailsPickupStation.getAPIResponseObjectSafeValue(
            json['pickup_station']),
        cusAddress: json['cus_address'],
        estimatedDeliveryDay: json['estimated_delivery_day'],
        receivedTime: json['received_time'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'order_number': orderNumber,
        'date': date,
        'user': user.toJson(),
        'products': products.map((e) => e.toJson()).toList(),
        'net_price': netPrice,
        'subtotal': subtotal,
        'discount': discount,
        'discount_coupon': discountCoupon.toJson(),
        'vat': vat,
        'vat_applied': vatApplied.toJson(),
        'delivery': delivery.toJson(),
        'total': total,
        'address': address.toJson(),
        'payment_status': paymentStatus,
        'status': status,
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
        'pickup_station': pickupStation.toJson(),
        'cus_address': cusAddress,
        'estimated_delivery_day': estimatedDeliveryDay,
        'received_time': receivedTime,
      };

  factory OrderDetails.empty() => OrderDetails(
      user: OrderDetailsUser(),
      discountCoupon: OrderDetailsDiscountCoupon(),
      vatApplied: OrderDetailsVatApplied(),
      delivery: OrderDetailsDelivery(),
      address: OrderDetailsAddress.empty(),
      pickupStation: OrderDetailsPickupStation.empty(),
      createdAt: AppComponents.defaultUnsetDateTime,
      updatedAt: AppComponents.defaultUnsetDateTime);

  static OrderDetails getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetails.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : OrderDetails.empty();
}

class OrderDetailsAddress {
  OrderDetailsAddressLocation location;
  DateTime estimatedDeliveryDay;
  String receivedTime;

  OrderDetailsAddress(
      {required this.location,
      required this.estimatedDeliveryDay,
      this.receivedTime = ''});

  factory OrderDetailsAddress.fromJson(Map<String, dynamic> json) =>
      OrderDetailsAddress(
        location: OrderDetailsAddressLocation.getAPIResponseObjectSafeValue(
            json['location']),
        estimatedDeliveryDay:
            APIHelper.getSafeDateTimeValue(json['estimated_delivery_day']),
        receivedTime: APIHelper.getSafeStringValue(json['received_time']),
      );

  Map<String, dynamic> toJson() => {
        'location': location.toJson(),
        'estimated_delivery_day':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(
                estimatedDeliveryDay),
        'received_time': receivedTime,
      };

  factory OrderDetailsAddress.empty() => OrderDetailsAddress(
      location: OrderDetailsAddressLocation(),
      estimatedDeliveryDay: AppComponents.defaultUnsetDateTime);

  static OrderDetailsAddress getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetailsAddress.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : OrderDetailsAddress.empty();
}

class OrderDetailsAddressLocation {
  String type;
  String address;

  OrderDetailsAddressLocation({this.type = '', this.address = ''});

  factory OrderDetailsAddressLocation.fromJson(Map<String, dynamic> json) =>
      OrderDetailsAddressLocation(
        type: APIHelper.getSafeStringValue(json['type']),
        address: APIHelper.getSafeStringValue(json['address']),
      );

  static OrderDetailsAddressLocation getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetailsAddressLocation.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : OrderDetailsAddressLocation();

  Map<String, dynamic> toJson() => {
        'type': type,
        'address': address,
      };
}

class OrderDetailsDelivery {
  String location;
  double amount;

  OrderDetailsDelivery({this.location = '', this.amount = 0});

  factory OrderDetailsDelivery.fromJson(Map<String, dynamic> json) =>
      OrderDetailsDelivery(
        location: APIHelper.getSafeStringValue(json['location']),
        amount: APIHelper.getSafeDoubleValue(json['amount'], 0),
      );

  Map<String, dynamic> toJson() => {
        'location': location,
        'amount': amount,
      };

  static OrderDetailsDelivery getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetailsDelivery.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : OrderDetailsDelivery();
}

class OrderDetailsDiscountCoupon {
  String code;
  double value;
  String discountType;

  OrderDetailsDiscountCoupon(
      {this.code = '', this.value = 0, this.discountType = ''});

  factory OrderDetailsDiscountCoupon.fromJson(Map<String, dynamic> json) {
    return OrderDetailsDiscountCoupon(
      code: APIHelper.getSafeStringValue(json['code']),
      value: APIHelper.getSafeDoubleValue(json['value'], 0),
      discountType: APIHelper.getSafeStringValue(json['discount_type']),
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'value': value,
        'discount_type': discountType,
      };

  static OrderDetailsDiscountCoupon getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetailsDiscountCoupon.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : OrderDetailsDiscountCoupon();
}

class OrderDetailsProduct {
  String product;
  OrderDetailsProductStore store;
  String name;
  String image;
  String unit;
  double price;
  int quantity;
  double subtotal;
  String id;

  OrderDetailsProduct({
    this.product = '',
    required this.store,
    this.name = '',
    this.image = '',
    this.price = 0,
    this.unit = '',
    this.quantity = 0,
    this.subtotal = 0,
    this.id = '',
  });

  factory OrderDetailsProduct.fromJson(Map<String, dynamic> json) =>
      OrderDetailsProduct(
        product: APIHelper.getSafeStringValue(json['product']),
        store: OrderDetailsProductStore.getAPIResponseObjectSafeValue(
            json['store']),
        name: APIHelper.getSafeStringValue(json['name']),
        image: APIHelper.getSafeStringValue(json['image']),
        price: APIHelper.getSafeDoubleValue(json['price'], 0),
        unit: APIHelper.getSafeStringValue(json['unit']),
        quantity: APIHelper.getSafeIntValue(json['quantity'], 0),
        subtotal: APIHelper.getSafeDoubleValue(json['subtotal'], 0),
        id: APIHelper.getSafeStringValue(json['_id']),
      );

  Map<String, dynamic> toJson() => {
        'product': product,
        'store': store.toJson(),
        'name': name,
        'image': image,
        'price': price,
        'unit': unit,
        'quantity': quantity,
        'subtotal': subtotal,
        '_id': id,
      };

  factory OrderDetailsProduct.empty() =>
      OrderDetailsProduct(store: OrderDetailsProductStore.empty());

  static OrderDetailsProduct getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetailsProduct.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : OrderDetailsProduct.empty();
}

class OrderDetailsProductStore {
  String id;
  String name;
  String location;
  String description;
  OrderDetailsProductStoreVendor vendor;
  String logo;

  OrderDetailsProductStore({
    this.id = '',
    this.name = '',
    this.location = '',
    this.description = '',
    required this.vendor,
    this.logo = '',
  });

  factory OrderDetailsProductStore.fromJson(Map<String, dynamic> json) =>
      OrderDetailsProductStore(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
        location: APIHelper.getSafeStringValue(json['location']),
        description: APIHelper.getSafeStringValue(json['description']),
        vendor: OrderDetailsProductStoreVendor.getAPIResponseObjectSafeValue(
            json['vendor']),
        logo: APIHelper.getSafeStringValue(json['logo']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'location': location,
        'description': description,
        'vendor': vendor.toJson(),
        'logo': logo,
      };

  factory OrderDetailsProductStore.empty() =>
      OrderDetailsProductStore(vendor: OrderDetailsProductStoreVendor());

  static OrderDetailsProductStore getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetailsProductStore.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : OrderDetailsProductStore.empty();
}

class OrderDetailsProductStoreVendor {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;

  OrderDetailsProductStoreVendor(
      {this.id = '',
      this.firstName = '',
      this.lastName = '',
      this.email = '',
      this.phone = ''});

  factory OrderDetailsProductStoreVendor.fromJson(Map<String, dynamic> json) =>
      OrderDetailsProductStoreVendor(
        id: APIHelper.getSafeStringValue(json['_id']),
        firstName: APIHelper.getSafeStringValue(json['first_name']),
        lastName: APIHelper.getSafeStringValue(json['last_name']),
        email: APIHelper.getSafeStringValue(json['email']),
        phone: APIHelper.getSafeStringValue(json['phone']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
      };
  static OrderDetailsProductStoreVendor getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetailsProductStoreVendor.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : OrderDetailsProductStoreVendor();
}

class OrderDetailsUser {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String image;

  OrderDetailsUser({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.image = '',
  });

  factory OrderDetailsUser.fromJson(Map<String, dynamic> json) =>
      OrderDetailsUser(
        id: APIHelper.getSafeStringValue(json['_id']),
        firstName: APIHelper.getSafeStringValue(json['first_name']),
        lastName: APIHelper.getSafeStringValue(json['last_name']),
        email: APIHelper.getSafeStringValue(json['email']),
        phone: APIHelper.getSafeStringValue(json['phone']),
        image: APIHelper.getSafeStringValue(json['image']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'image': image,
      };
  static OrderDetailsUser getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetailsUser.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : OrderDetailsUser();
}

class OrderDetailsVatApplied {
  String type;
  double value;

  OrderDetailsVatApplied({this.type = '', this.value = 0});

  factory OrderDetailsVatApplied.fromJson(Map<String, dynamic> json) =>
      OrderDetailsVatApplied(
        type: APIHelper.getSafeStringValue(json['type']),
        value: APIHelper.getSafeDoubleValue(json['value'], 0),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
      };

  static OrderDetailsVatApplied getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetailsVatApplied.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : OrderDetailsVatApplied();
}

class OrderDetailsPickupStation {
  String id;
  String name;
  String address;
  double charged;
  OrderDetailsPickupStationPickupLocation pickupLocation;

  OrderDetailsPickupStation({
    this.id = '',
    this.name = '',
    this.address = '',
    this.charged = 0,
    required this.pickupLocation,
  });

  factory OrderDetailsPickupStation.fromJson(Map<String, dynamic> json) {
    return OrderDetailsPickupStation(
      id: APIHelper.getSafeStringValue(json['_id']),
      name: APIHelper.getSafeStringValue(json['name']),
      address: APIHelper.getSafeStringValue(json['address']),
      charged: APIHelper.getSafeDoubleValue(json['charged'], 0),
      pickupLocation:
          OrderDetailsPickupStationPickupLocation.getAPIResponseObjectSafeValue(
              json['pickup_location']),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'address': address,
        'charged': charged,
        'pickup_location': pickupLocation.toJson(),
      };

  factory OrderDetailsPickupStation.empty() => OrderDetailsPickupStation(
      pickupLocation: OrderDetailsPickupStationPickupLocation());

  static OrderDetailsPickupStation getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetailsPickupStation.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : OrderDetailsPickupStation.empty();
}

class OrderDetailsPickupStationPickupLocation {
  double latitude;
  double longitude;

  OrderDetailsPickupStationPickupLocation(
      {this.latitude = Constants.unsetMapLatLng,
      this.longitude = Constants.unsetMapLatLng});

  factory OrderDetailsPickupStationPickupLocation.fromJson(
      Map<String, dynamic> json) {
    return OrderDetailsPickupStationPickupLocation(
      latitude: APIHelper.getSafeDoubleValue(
          json['latitude'], Constants.unsetMapLatLng),
      longitude: APIHelper.getSafeDoubleValue(
          json['longitude'], Constants.unsetMapLatLng),
    );
  }

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
  static OrderDetailsPickupStationPickupLocation getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? OrderDetailsPickupStationPickupLocation.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : OrderDetailsPickupStationPickupLocation();
}
