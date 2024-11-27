import 'package:ecomikstoreapp/models/api_responses/core_api_responses/paginated_data_response.dart';
import 'package:ecomikstoreapp/utils/constants/app_components.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class VendorRecietOfferListResponse {
  bool error;
  String msg;
  PaginatedDataResponse<VendorRecietOfferList> data;

  VendorRecietOfferListResponse(
      {this.error = false, this.msg = '', required this.data});

  factory VendorRecietOfferListResponse.fromJson(Map<String, dynamic> json) {
    return VendorRecietOfferListResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: PaginatedDataResponse.getAPIResponseObjectSafeValue(
        json['data'],
        docFromJson: (data) =>
            VendorRecietOfferList.getAPIResponseObjectSafeValue(data),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson((item) => item.toJson()),
      };

  factory VendorRecietOfferListResponse.empty() =>
      VendorRecietOfferListResponse(data: PaginatedDataResponse.empty());
  static VendorRecietOfferListResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? VendorRecietOfferListResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : VendorRecietOfferListResponse.empty();
}

class VendorRecietOfferList {
  String id;
  User user;
  Product product;
  String status;
  int quantity;
  int price;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  VendorRecietOfferList({
    this.id = '',
    required this.user,
    required this.product,
    this.status = '',
    this.quantity = 0,
    this.price = 0,
    required this.createdAt,
    required this.updatedAt,
    this.v = 0,
  });

  factory VendorRecietOfferList.fromJson(Map<String, dynamic> json) => VendorRecietOfferList(
        id: APIHelper.getSafeStringValue(json['_id']),
        user: User.getAPIResponseObjectSafeValue(json['user']),
        product: Product.getAPIResponseObjectSafeValue(json['product']),
        status: APIHelper.getSafeStringValue(json['status']),
        quantity: APIHelper.getSafeIntValue(json['quantity']),
        price: APIHelper.getSafeIntValue(json['price']),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
        v: APIHelper.getSafeIntValue(json['__v']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user.toJson(),
        'product': product.toJson(),
        'status': status,
        'quantity': quantity,
        'price': price,
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
        '__v': v,
      };

  factory VendorRecietOfferList.empty() => VendorRecietOfferList(
      createdAt: AppComponents.defaultUnsetDateTime,
      product: Product(),
      updatedAt: AppComponents.defaultUnsetDateTime,
      user: User());
  static VendorRecietOfferList getAPIResponseObjectSafeValue(dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? VendorRecietOfferList.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : VendorRecietOfferList.empty();
}

class Product {
  String id;
  String name;
  String model;
  double price;
  String productImage;

  Product(
      {this.id = '',
      this.name = '',
      this.model = '',
      this.price = 0,
      this.productImage = ''});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
        model: APIHelper.getSafeStringValue(json['model']),
        price: APIHelper.getSafeDoubleValue(json['price']),
        productImage: APIHelper.getSafeStringValue(json['product_image']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'model': model,
        'price': price,
        'product_image': productImage,
      };

  static Product getAPIResponseObjectSafeValue(dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? Product.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : Product();
}

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;

  User(
      {this.id = '',
      this.firstName = '',
      this.lastName = '',
      this.email = '',
      this.phone = ''});

  factory User.fromJson(Map<String, dynamic> json) => User(
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

  static User getAPIResponseObjectSafeValue(dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? User.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : User();
}
