import 'package:ecomikstoreapp/utils/constants/app_components.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class InsightDetailsResponse {
  bool error;
  String msg;
  InsightDetails data;

  InsightDetailsResponse(
      {this.error = false, this.msg = '', required this.data});

  factory InsightDetailsResponse.fromJson(Map<String, dynamic> json) {
    return InsightDetailsResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: InsightDetails.getAPIResponseObjectSafeValue(json['data']),
    );
  }
  factory InsightDetailsResponse.empty() => InsightDetailsResponse(
        data: InsightDetails(),
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson(),
      };

  static InsightDetailsResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? InsightDetailsResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : InsightDetailsResponse.empty();
}

class InsightDetails {
  int products;
  int auctionProduct;
  int totalOrder;
  int pendingOrders;
  double totalEarning;
  double totalWithdraw;
  double currentBalance;
  List<InsightShortItemStoreBalanceHistoryGraph> storeBalanceHistoryGraph;
  List<InsightDetailsOrder> orders;

  InsightDetails({
    this.products = 0,
    this.auctionProduct = 0,
    this.totalOrder = 0,
    this.pendingOrders = 0,
    this.totalEarning = 0,
    this.totalWithdraw = 0,
    this.currentBalance = 0,
    this.storeBalanceHistoryGraph = const [],
    this.orders = const [],
  });

  factory InsightDetails.fromJson(Map<String, dynamic> json) => InsightDetails(
        products: APIHelper.getSafeIntValue(json['products']),
        auctionProduct: APIHelper.getSafeIntValue(json['auction_product']),
        totalOrder: APIHelper.getSafeIntValue(json['total_order']),
        pendingOrders: APIHelper.getSafeIntValue(json['pending_orders']),
        totalEarning: APIHelper.getSafeDoubleValue(json['total_earning']),
        totalWithdraw: APIHelper.getSafeDoubleValue(json['total_withdraw']),
        currentBalance: APIHelper.getSafeDoubleValue(json['current_balance']),
        storeBalanceHistoryGraph:
            APIHelper.getSafeListValue(json['store_balance_history_graph'])
                .map((e) => InsightShortItemStoreBalanceHistoryGraph
                    .getAPIResponseObjectSafeValue(e))
                .toList(),
        orders: APIHelper.getSafeListValue(json['orders'])
            .map((e) => InsightDetailsOrder.getAPIResponseObjectSafeValue(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'products': products,
        'auction_product': auctionProduct,
        'total_order': totalOrder,
        'pending_orders': pendingOrders,
        'total_earning': totalEarning,
        'total_withdraw': totalWithdraw,
        'current_balance': currentBalance,
        'store_balance_history_graph':
            storeBalanceHistoryGraph.map((e) => e.toJson()).toList(),
        'orders': orders.map((e) => e.toJson()).toList(),
      };

  static InsightDetails getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? InsightDetails.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : InsightDetails();
}

class Location {
  String type;
  String address;

  Location({this.type = '', this.address = ''});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: APIHelper.getSafeStringValue(json['type']),
        address: APIHelper.getSafeStringValue(json['address']),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'address': address,
      };

  static Location getAPIResponseObjectSafeValue(dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? Location.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : Location();
}

class InsightDetailsOrderAddress {
  Location location;
  DateTime estimatedDeliveryDay;
  String receivedTime;

  InsightDetailsOrderAddress(
      {required this.location,
      required this.estimatedDeliveryDay,
      this.receivedTime = ''});

  factory InsightDetailsOrderAddress.fromJson(Map<String, dynamic> json) =>
      InsightDetailsOrderAddress(
        location: Location.getAPIResponseObjectSafeValue(json['location']),
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

  factory InsightDetailsOrderAddress.empty() => InsightDetailsOrderAddress(
        estimatedDeliveryDay: AppComponents.defaultUnsetDateTime,
        location: Location(),
      );

  static InsightDetailsOrderAddress getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? InsightDetailsOrderAddress.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : InsightDetailsOrderAddress.empty();
}

class InsightDetailsOrder {
  String id;
  InsightDetailsOrderUser user;
  double total;
  String paymentStatus;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  InsightDetailsOrderProduct product;
  String orderNumber;
  String date;
  InsightDetailsOrderAddress address;

  InsightDetailsOrder({
    this.id = '',
    required this.user,
    this.total = 0,
    this.paymentStatus = '',
    this.status = '',
    required this.createdAt,
    required this.updatedAt,
    required this.product,
    this.orderNumber = '',
    this.date = '',
    required this.address,
  });

  factory InsightDetailsOrder.fromJson(Map<String, dynamic> json) =>
      InsightDetailsOrder(
        id: APIHelper.getSafeStringValue(json['_id']),
        user:
            InsightDetailsOrderUser.getAPIResponseObjectSafeValue(json['user']),
        total: APIHelper.getSafeDoubleValue(json['total'], 0),
        paymentStatus: APIHelper.getSafeStringValue(json['payment_status']),
        status: APIHelper.getSafeStringValue(json['status']),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
        product: InsightDetailsOrderProduct.getAPIResponseObjectSafeValue(
            json['product']),
        orderNumber: APIHelper.getSafeStringValue(json['order_number']),
        date: APIHelper.getSafeStringValue(json['data']),
        address: InsightDetailsOrderAddress.getAPIResponseObjectSafeValue(
            json['address']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user.toJson(),
        'total': total,
        'payment_status': paymentStatus,
        'status': status,
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
        'product': product.toJson(),
        'order_number': orderNumber,
        'date': date,
        'address': address.toJson(),
      };

  factory InsightDetailsOrder.empty() => InsightDetailsOrder(
        address: InsightDetailsOrderAddress.empty(),
        product: InsightDetailsOrderProduct(),
        updatedAt: AppComponents.defaultUnsetDateTime,
        createdAt: AppComponents.defaultUnsetDateTime,
        user: InsightDetailsOrderUser(),
      );

  static InsightDetailsOrder getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? InsightDetailsOrder.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : InsightDetailsOrder.empty();
}

class InsightDetailsOrderProduct {
  String product;
  String name;
  String image;
  String unit;
  String attribute;
  double price;
  int quantity;
  double subtotal;
  String id;

  InsightDetailsOrderProduct({
    this.product = '',
    this.name = '',
    this.image = '',
    this.unit = '',
    this.attribute = '',
    this.price = 0,
    this.quantity = 0,
    this.subtotal = 0,
    this.id = '',
  });

  factory InsightDetailsOrderProduct.fromJson(Map<String, dynamic> json) =>
      InsightDetailsOrderProduct(
        product: APIHelper.getSafeStringValue(json['product']),
        name: APIHelper.getSafeStringValue(json['name']),
        image: APIHelper.getSafeStringValue(json['image']),
        unit: APIHelper.getSafeStringValue(json['unit']),
        attribute: APIHelper.getSafeStringValue(json['attribute']),
        price: APIHelper.getSafeDoubleValue(json['price']),
        quantity: APIHelper.getSafeIntValue(json['quantity']),
        subtotal: APIHelper.getSafeDoubleValue(json['subtotal']),
        id: APIHelper.getSafeStringValue(json['_id']),
      );

  Map<String, dynamic> toJson() => {
        'product': product,
        'name': name,
        'image': image,
        'unit': unit,
        'attribute': attribute,
        'price': price,
        'quantity': quantity,
        'subtotal': subtotal,
        '_id': id,
      };
  static InsightDetailsOrderProduct getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? InsightDetailsOrderProduct.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : InsightDetailsOrderProduct();
}

class InsightShortItemStoreBalanceHistoryGraph {
  String id;
  double total;
  int order;
  DateTime createdAt;

  InsightShortItemStoreBalanceHistoryGraph({
    this.id = '',
    this.total = 0,
    this.order = 0,
    required this.createdAt,
  });

  factory InsightShortItemStoreBalanceHistoryGraph.fromJson(
      Map<String, dynamic> json) {
    return InsightShortItemStoreBalanceHistoryGraph(
      id: APIHelper.getSafeStringValue(json['_id']),
      total: APIHelper.getSafeDoubleValue(json['total']),
      order: APIHelper.getSafeIntValue(json['order']),
      createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'total': total,
        'order': order,
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
      };

  factory InsightShortItemStoreBalanceHistoryGraph.empty() =>
      InsightShortItemStoreBalanceHistoryGraph(
        createdAt: AppComponents.defaultUnsetDateTime,
      );

  static InsightShortItemStoreBalanceHistoryGraph getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? InsightShortItemStoreBalanceHistoryGraph.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : InsightShortItemStoreBalanceHistoryGraph.empty();
}

class InsightDetailsOrderUser {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String image;

  InsightDetailsOrderUser({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.image = '',
  });

  factory InsightDetailsOrderUser.fromJson(Map<String, dynamic> json) =>
      InsightDetailsOrderUser(
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
  static InsightDetailsOrderUser getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? InsightDetailsOrderUser.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : InsightDetailsOrderUser();
}
