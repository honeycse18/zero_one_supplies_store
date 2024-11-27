import 'package:ecomikstoreapp/models/api_responses/core_api_responses/raw_api_response.dart';
import 'package:ecomikstoreapp/models/api_responses/vendor_with_store_details_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/app_singleton.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SetStoreLocationScreenController extends GetxController {
  // Variables
  final TextEditingController addressController = TextEditingController();
  final Set<Marker> googleMapMarkers = {};
  VendorDetailsStoreLocationDetails vendorStoreLocation =
      VendorDetailsStoreLocationDetails.empty();
  GoogleMapController? googleMapController;
  double selectedLocationLatitude = 0;
  double selectedLocationLongitude = 0;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  // Getters

  // Functions
  void onSetButtonTap() {
    _setStoreLocation();
  }

  Future<void> _setStoreLocation() async {
    final VendorDetails vendorDetails = Helper.getVendor();
    Map<String, dynamic> requestBody = <String, dynamic>{
      '_id': vendorDetails.store.id,
      'store_location': <String, dynamic>{
        'address': addressController.text,
        'location': <String, dynamic>{
          'latitude': selectedLocationLatitude,
          'longitude': selectedLocationLongitude,
        },
      }
    };
    isLoading = true;
    final RawAPIResponse? response =
        await APIRepo.setStoreLocation(requestBody);
    isLoading = false;
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    _onSuccessSetStoreLocation(response);
  }

  void _onSuccessSetStoreLocation(RawAPIResponse response) async {
    isLoading = true;
    await APIHelper.updateLocalSavedVendorDetails();
    isLoading = false;
    Helper.showSnackBar(response.msg);
    Get.back(result: true);
  }

  void onGPSButtonTap() async {
    final Position? currentLocation = await Helper.getGPSLocationData();
    if (currentLocation == null) {
      return;
    }
    onGoogleMapTap(LatLng(currentLocation.latitude, currentLocation.longitude));
  }

  void onGoogleMapTap(LatLng latLng, {bool isInitialization = false}) async {
    if (googleMapController == null) {
      return;
    }
    selectedLocationLatitude = latLng.latitude;
    selectedLocationLongitude = latLng.longitude;
    _addMarker(latLng);
    final double zoomLevel = await googleMapController!.getZoomLevel();
    googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: zoomLevel)));
    AppSingleton.instance.defaultCameraPosition =
        CameraPosition(target: latLng, zoom: zoomLevel);
    if (!isInitialization) {
      _setSelectedLocationAddress(latLng);
    }
    update();
  }

  void onGoogleMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    if (!vendorStoreLocation.isEmpty) {
      onGoogleMapTap(
          LatLng(vendorStoreLocation.location.latitude,
              vendorStoreLocation.location.longitude),
          isInitialization: true);
      addressController.text = vendorStoreLocation.address;
    }
    update();
  }

  void _addMarker(LatLng latLng) {
    googleMapMarkers.clear();
    googleMapMarkers
        .add(Marker(markerId: MarkerId(latLng.toString()), position: latLng));
  }

  void _setSelectedLocationAddress(LatLng latLng) async {
    isLoading = true;
    final selectedAddress =
        await Helper.getAddressDetails(latLng.latitude, latLng.longitude);
    isLoading = false;
    if (selectedAddress == null) {
      return;
    }
    addressController.text = Helper.getAddressDetailsText(selectedAddress);
    update();
  }

  @override
  void onInit() {
    final vendorDetails = Helper.getVendor();
    vendorStoreLocation = vendorDetails.store.storeLocation;
    super.onInit();
  }

  @override
  void onClose() {
    addressController.dispose();
    super.onClose();
  }
}
