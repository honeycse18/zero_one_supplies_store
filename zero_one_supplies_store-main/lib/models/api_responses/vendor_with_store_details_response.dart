import 'package:ecomikstoreapp/utils/constants/app_components.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class VendorDetailsResponse {
  bool error;
  String msg;
  VendorDetails data;

  VendorDetailsResponse(
      {this.error = false, this.msg = '', required this.data});

  factory VendorDetailsResponse.fromJson(Map<String, dynamic> json) {
    return VendorDetailsResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: VendorDetails.getAPIResponseObjectSafeValue(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.toJson(),
      };

  factory VendorDetailsResponse.empty() =>
      VendorDetailsResponse(data: VendorDetails.empty());

  static VendorDetailsResponse getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? VendorDetailsResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : VendorDetailsResponse.empty();
}

class VendorDetails {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String gender;
  String image;
  String role;
  VendorDetailsStore store;

  VendorDetails({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.gender = '',
    this.image = '',
    this.role = '',
    required this.store,
  });

  factory VendorDetails.fromJson(Map<String, dynamic> json) => VendorDetails(
        id: APIHelper.getSafeStringValue(json['_id']),
        firstName: APIHelper.getSafeStringValue(json['first_name']),
        lastName: APIHelper.getSafeStringValue(json['last_name']),
        email: APIHelper.getSafeStringValue(json['email']),
        phone: APIHelper.getSafeStringValue(json['phone']),
        image: APIHelper.getSafeStringValue(json['image']),
        gender: APIHelper.getSafeStringValue(json['gender']),
        role: APIHelper.getSafeStringValue(json['role']),
        store: VendorDetailsStore.getAPIResponseObjectSafeValue(json['store']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'gender': gender,
        'image': image,
        'role': role,
        'store': store.toJson(),
      };

  factory VendorDetails.empty() =>
      VendorDetails(store: VendorDetailsStore.empty());

  static VendorDetails getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? VendorDetails.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : VendorDetails.empty();

  bool isEmpty() => id.isEmpty;
}

class VendorDetailsStoreLocationDetailsLocation {
  double latitude;
  double longitude;

  VendorDetailsStoreLocationDetailsLocation(
      {this.latitude = Constants.unsetMapLatLng,
      this.longitude = Constants.unsetMapLatLng});

  factory VendorDetailsStoreLocationDetailsLocation.fromJson(
          Map<String, dynamic> json) =>
      VendorDetailsStoreLocationDetailsLocation(
        latitude: APIHelper.getSafeDoubleValue(
            json['latitude'], Constants.unsetMapLatLng),
        longitude: APIHelper.getSafeDoubleValue(
            json['longitude'], Constants.unsetMapLatLng),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
  static VendorDetailsStoreLocationDetailsLocation
      getAPIResponseObjectSafeValue(dynamic unsafeResponseValue) =>
          APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
              ? VendorDetailsStoreLocationDetailsLocation.fromJson(
                  unsafeResponseValue as Map<String, dynamic>)
              : VendorDetailsStoreLocationDetailsLocation();
}

class VendorDetailsStoreLocationDetails {
  VendorDetailsStoreLocationDetailsLocation location;
  String address;

  VendorDetailsStoreLocationDetails(
      {required this.location, this.address = ''});

  factory VendorDetailsStoreLocationDetails.fromJson(
      Map<String, dynamic> json) {
    return VendorDetailsStoreLocationDetails(
      location: VendorDetailsStoreLocationDetailsLocation
          .getAPIResponseObjectSafeValue(json['location']),
      address: APIHelper.getSafeStringValue(json['address']),
    );
  }

  Map<String, dynamic> toJson() => {
        'location': location.toJson(),
        'address': address,
      };
  factory VendorDetailsStoreLocationDetails.empty() =>
      VendorDetailsStoreLocationDetails(
          location: VendorDetailsStoreLocationDetailsLocation());

  static VendorDetailsStoreLocationDetails getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? VendorDetailsStoreLocationDetails.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : VendorDetailsStoreLocationDetails.empty();

  bool get isEmpty => (address.isEmpty ||
      (location.latitude == Constants.unsetMapLatLng ||
          location.longitude == Constants.unsetMapLatLng));
}

class VendorDetailsStore {
  String id;
  String name;
  String category;
  String location;
  String description;
  String logo;
  String nidNumber;
  String nidImage;
  String addressProof;
  String taxName;
  String taxNumber;
  String status;
  String vendor;
  VendorDetailsStoreLocationDetails storeLocation;
  DateTime createdAt;
  DateTime updatedAt;

  VendorDetailsStore({
    this.id = '',
    this.name = '',
    this.category = '',
    this.location = '',
    this.description = '',
    this.logo = '',
    this.nidNumber = '',
    this.nidImage = '',
    this.addressProof = '',
    this.taxName = '',
    this.taxNumber = '',
    this.status = '',
    this.vendor = '',
    required this.storeLocation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VendorDetailsStore.fromJson(Map<String, dynamic> json) =>
      VendorDetailsStore(
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
        category: APIHelper.getSafeStringValue(json['category']),
        location: APIHelper.getSafeStringValue(json['location']),
        description: APIHelper.getSafeStringValue(json['description']),
        logo: APIHelper.getSafeStringValue(json['logo']),
        nidNumber: APIHelper.getSafeStringValue(json['nid_number']),
        nidImage: APIHelper.getSafeStringValue(json['nid_image']),
        addressProof: APIHelper.getSafeStringValue(json['address_proof']),
        taxName: APIHelper.getSafeStringValue(json['tax_name']),
        taxNumber: APIHelper.getSafeStringValue(json['tax_number']),
        status: APIHelper.getSafeStringValue(json['status']),
        vendor: APIHelper.getSafeStringValue(json['vendor']),
        storeLocation:
            VendorDetailsStoreLocationDetails.getAPIResponseObjectSafeValue(
                json['store_location']),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'category': category,
        'location': location,
        'description': description,
        'logo': logo,
        'nid_number': nidNumber,
        'nid_image': nidImage,
        'address_proof': addressProof,
        'tax_name': taxName,
        'tax_number': taxNumber,
        'status': status,
        'vendor': vendor,
        'store_location': storeLocation.toJson(),
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
      };
  factory VendorDetailsStore.empty() => VendorDetailsStore(
      storeLocation: VendorDetailsStoreLocationDetails.empty(),
      createdAt: AppComponents.defaultUnsetDateTime,
      updatedAt: AppComponents.defaultUnsetDateTime);

  static VendorDetailsStore getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? VendorDetailsStore.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : VendorDetailsStore.empty();
}
