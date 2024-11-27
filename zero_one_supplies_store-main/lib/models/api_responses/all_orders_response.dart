import 'package:ecomikstoreapp/models/api_responses/core_api_responses/paginated_data_response.dart';
import 'package:ecomikstoreapp/utils/constants/app_components.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class StoreOrdersResponse {
  bool error;
  String msg;
  PaginatedDataResponse<StoreOrder> data;

  StoreOrdersResponse({this.error = false, this.msg = '', required this.data});

  factory StoreOrdersResponse.fromJson(Map<String, dynamic> json) {
    return StoreOrdersResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: PaginatedDataResponse.getAPIResponseObjectSafeValue(json['data'],
          docFromJson: (data) => StoreOrder.getAPIResponseObjectSafeValue(
              data)) /* StoreOrdersData.getAPIResponseObjectSafeValue(json['data']) */,
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson((data) => data.toJson()),
      };

  factory StoreOrdersResponse.empty() =>
      StoreOrdersResponse(data: PaginatedDataResponse.empty());

  static StoreOrdersResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? StoreOrdersResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : StoreOrdersResponse.empty();
}

class StoreOrdersData {
  List<StoreOrder> docs;
  int totalDocs;
  int limit;
  int page;
  int totalPages;
  int pagingCounter;
  bool hasPrevPage;
  bool hasNextPage;
  int prevPage;
  int nextPage;

  StoreOrdersData({
    this.docs = const [],
    this.totalDocs = 0,
    this.limit = 0,
    this.page = 0,
    this.totalPages = 0,
    this.pagingCounter = 0,
    this.hasPrevPage = false,
    this.hasNextPage = false,
    this.prevPage = 0,
    this.nextPage = 0,
  });

  factory StoreOrdersData.fromJson(Map<String, dynamic> json) =>
      StoreOrdersData(
        docs: APIHelper.getSafeListValue(json['docs'])
            .map((e) => StoreOrder.fromJson(e))
            .toList(),
        totalDocs: APIHelper.getSafeIntValue(json['totalDocs']),
        limit: APIHelper.getSafeIntValue(json['limit']),
        page: APIHelper.getSafeIntValue(json['page']),
        totalPages: APIHelper.getSafeIntValue(json['totalPages']),
        pagingCounter: APIHelper.getSafeIntValue(json['pagingCounter']),
        hasPrevPage: APIHelper.getSafeBoolValue(json['hasPrevPage']),
        hasNextPage: APIHelper.getSafeBoolValue(json['hasNextPage']),
        prevPage: APIHelper.getSafeIntValue(json['prevPage']),
        nextPage: APIHelper.getSafeIntValue(json['nextPage']),
      );

  Map<String, dynamic> toJson() => {
        'docs': docs.map((e) => e.toJson()).toList(),
        'totalDocs': totalDocs,
        'limit': limit,
        'page': page,
        'totalPages': totalPages,
        'pagingCounter': pagingCounter,
        'hasPrevPage': hasPrevPage,
        'hasNextPage': hasNextPage,
        'prevPage': prevPage,
        'nextPage': nextPage,
      };

  static StoreOrdersData getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? StoreOrdersData.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : StoreOrdersData();
}

class StoreOrder {
  String id;
  AllOrdersUserResponse user;
  double total;
  AllOrdersAddressResponse address;
  String paymentStatus;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  AllOrdersProductResponse product;
  String orderNumber;
  String date;

  StoreOrder({
    this.id = '',
    required this.user,
    this.total = 0,
    required this.address,
    this.paymentStatus = '',
    this.status = '',
    required this.createdAt,
    required this.updatedAt,
    required this.product,
    this.orderNumber = '',
    this.date = '',
  });

  factory StoreOrder.fromJson(Map<String, dynamic> json) => StoreOrder(
        id: APIHelper.getSafeStringValue(json['_id']),
        user: AllOrdersUserResponse.getAPIResponseObjectSafeValue(json['user']),
        total: APIHelper.getSafeDoubleValue(json['total']),
        address: AllOrdersAddressResponse.getAPIResponseObjectSafeValue(
            json['address']),
        paymentStatus: APIHelper.getSafeStringValue(json['payment_status']),
        status: APIHelper.getSafeStringValue(json['status']),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
        product: AllOrdersProductResponse.getAPIResponseObjectSafeValue(
            json['product']),
        orderNumber: APIHelper.getSafeStringValue(json['order_number']),
        date: APIHelper.getSafeStringValue(json['date']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user.toJson(),
        'total': total,
        'address': address.toJson(),
        'payment_status': paymentStatus,
        'status': status,
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
        'product': product.toJson(),
        'order_number': orderNumber,
        'date': date,
      };

  factory StoreOrder.empty() => StoreOrder(
      user: AllOrdersUserResponse(),
      address: AllOrdersAddressResponse.empty(),
      createdAt: AppComponents.defaultUnsetDateTime,
      updatedAt: AppComponents.defaultUnsetDateTime,
      product: AllOrdersProductResponse());

  static StoreOrder getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? StoreOrder.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : StoreOrder.empty();
}

class AllOrdersAddressResponse {
  AllOrdersLocationResponse location;
  DateTime estimatedDeliveryDay;
  DateTime receivedTime;

  AllOrdersAddressResponse(
      {required this.location,
      required this.estimatedDeliveryDay,
      required this.receivedTime});

  factory AllOrdersAddressResponse.fromJson(Map<String, dynamic> json) =>
      AllOrdersAddressResponse(
        location: AllOrdersLocationResponse.getAPIResponseObjectSafeValue(
            json['location']),
        estimatedDeliveryDay:
            APIHelper.getSafeDateTimeValue(json['estimated_delivery_day']),
        receivedTime: APIHelper.getSafeDateTimeValue(json['received_time']),
      );

  Map<String, dynamic> toJson() => {
        'location': location.toJson(),
        'estimated_delivery_day':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(
                estimatedDeliveryDay),
        'received_time':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(receivedTime),
      };

  factory AllOrdersAddressResponse.empty() => AllOrdersAddressResponse(
      location: AllOrdersLocationResponse(),
      estimatedDeliveryDay: AppComponents.defaultUnsetDateTime,
      receivedTime: AppComponents.defaultUnsetDateTime);

  static AllOrdersAddressResponse getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AllOrdersAddressResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AllOrdersAddressResponse.empty();
}

class AllOrdersLocationResponse {
  String type;
  String address;

  AllOrdersLocationResponse({this.type = '', this.address = ''});

  factory AllOrdersLocationResponse.fromJson(Map<String, dynamic> json) =>
      AllOrdersLocationResponse(
        type: APIHelper.getSafeStringValue(json['type']),
        address: APIHelper.getSafeStringValue(json['address']),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'address': address,
      };

  static AllOrdersLocationResponse getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AllOrdersLocationResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AllOrdersLocationResponse();
}

class AllOrdersProductResponse {
  String product;
  String name;
  String image;
  String unit;
  int price;
  int quantity;
  int subtotal;
  String id;

  AllOrdersProductResponse({
    this.product = '',
    this.name = '',
    this.image = '',
    this.unit = '',
    this.price = 0,
    this.quantity = 0,
    this.subtotal = 0,
    this.id = '',
  });

  factory AllOrdersProductResponse.fromJson(Map<String, dynamic> json) =>
      AllOrdersProductResponse(
        product: APIHelper.getSafeStringValue(json['product']),
        name: APIHelper.getSafeStringValue(json['name']),
        image: APIHelper.getSafeStringValue(json['image']),
        unit: APIHelper.getSafeStringValue(json['unit']),
        price: APIHelper.getSafeIntValue(json['price']),
        quantity: APIHelper.getSafeIntValue(json['quantity']),
        subtotal: APIHelper.getSafeIntValue(json['subtotal']),
        id: APIHelper.getSafeStringValue(json['_id']),
      );

  Map<String, dynamic> toJson() => {
        'product': product,
        'name': name,
        'image': image,
        'unit': unit,
        'price': price,
        'quantity': quantity,
        'subtotal': subtotal,
        '_id': id,
      };

  static AllOrdersProductResponse getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AllOrdersProductResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AllOrdersProductResponse();
}

class AllOrdersUserResponse {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String image;

  AllOrdersUserResponse({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.image = '',
  });

  factory AllOrdersUserResponse.fromJson(Map<String, dynamic> json) =>
      AllOrdersUserResponse(
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

  static AllOrdersUserResponse getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? AllOrdersUserResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : AllOrdersUserResponse();
}
