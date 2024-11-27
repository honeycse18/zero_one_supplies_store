import 'dart:async';

import 'package:ecomikstoreapp/utils/app_singleton.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryInfoMapScreenController extends GetxController {
  final Set<Marker> googleMapMarkers = {};
  GoogleMapController? googleMapController;

  bool isLocationSelected = false;
  final Completer<GoogleMapController> googleMapControllerCompleter =
      Completer<GoogleMapController>();

  void onGoogleMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    googleMapControllerCompleter.complete(controller);
  }

  void onGoogleMapTap(LatLng latLng) async {
    if (googleMapController == null) {
      return;
    }
    _addMarker(latLng);
    final double zoomLevel = await googleMapController!.getZoomLevel();
    googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: zoomLevel)));
    AppSingleton.instance.defaultCameraPosition =
        CameraPosition(target: latLng, zoom: zoomLevel);
    _setAddress(latLng);
    update();
    // panelController.open();
  }

  void _addMarker(LatLng latLng) {
    googleMapMarkers.clear();
    googleMapMarkers
        .add(Marker(markerId: MarkerId(latLng.toString()), position: latLng));
  }

  void _setAddress(LatLng latLng) async {
    final selectedAddress =
        await Helper.getAddressDetails(latLng.latitude, latLng.longitude);
    if (selectedAddress == null) {
      return;
    }
    isLocationSelected = true;
    // final locationAddressText = Helper.getAddressDetailsText(selectedAddress);
    update();
  }
}
