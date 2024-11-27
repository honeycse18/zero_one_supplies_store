import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class PickupStationsResponse {
  bool error;
  String msg;
  List<PickupStation> data;

  PickupStationsResponse(
      {this.error = false, this.msg = '', this.data = const []});

  factory PickupStationsResponse.fromJson(Map<String, dynamic> json) {
    return PickupStationsResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: (APIHelper.getSafeListValue(json['data']))
          .map((e) => PickupStation.getAPIResponseObjectSafeValue(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.map((e) => e.toJson()).toList(),
      };
  static PickupStationsResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? PickupStationsResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : PickupStationsResponse();
}

class PickupStation {
  PickupStationLocation location;
  String id;
  String name;
  String address;

  PickupStation(
      {required this.location,
      this.id = '',
      this.name = '',
      this.address = ''});

  factory PickupStation.fromJson(Map<String, dynamic> json) => PickupStation(
        location: PickupStationLocation.getAPIResponseObjectSafeValue(
            json['location']),
        id: APIHelper.getSafeStringValue(json['_id']),
        name: APIHelper.getSafeStringValue(json['name']),
        address: APIHelper.getSafeStringValue(json['address']),
      );

  Map<String, dynamic> toJson() => {
        'location': location.toJson(),
        '_id': id,
        'name': name,
        'address': address,
      };

  factory PickupStation.empty() =>
      PickupStation(location: PickupStationLocation());

  static PickupStation getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? PickupStation.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : PickupStation.empty();
}

class PickupStationLocation {
  double latitude;
  double longitude;

  PickupStationLocation(
      {this.latitude = Constants.unsetMapLatLng,
      this.longitude = Constants.unsetMapLatLng});

  factory PickupStationLocation.fromJson(Map<String, dynamic> json) =>
      PickupStationLocation(
        latitude: APIHelper.getSafeDoubleValue(json['latitude']),
        longitude: APIHelper.getSafeDoubleValue(json['longitude']),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
  static PickupStationLocation getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? PickupStationLocation.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : PickupStationLocation();
}
