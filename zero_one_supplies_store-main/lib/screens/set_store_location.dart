import 'package:ecomikstoreapp/controller/set_store_location_controller.dart';
import 'package:ecomikstoreapp/utils/app_singleton.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SetStoreLocationScreen extends StatelessWidget {
  const SetStoreLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetStoreLocationScreenController>(
      global: false,
      init: SetStoreLocationScreenController(),
      builder: (controller) => DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: Image.asset(AppAssetImages.backgroundScreen).image,
                fit: BoxFit.fill)),
        child: Scaffold(
          extendBody: true,
          /* <-------- Appbar --------> */
          appBar: CoreWidgets.appBarWidget(
              screenContext: context,
              titleWidget: const Text('Set store location')),
          /* <-------- Content --------> */
          body: Stack(
            children: [
              GoogleMap(
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                initialCameraPosition:
                    AppSingleton.instance.defaultCameraPosition,
                markers: controller.googleMapMarkers,
                onMapCreated: controller.onGoogleMapCreated,
                onTap: controller.onGoogleMapTap,
              ),
              Positioned(
                  bottom: 220,
                  right: 24,
                  child: CustomIconButtonWidget(
                      onTap: controller.onGPSButtonTap,
                      child: SvgPicture.asset(AppAssetImages.gpsSVG))),
            ],
          ),
          /* <-------- Bottom bar --------> */
          bottomNavigationBar: CustomScaffoldBottomBarWidget(
              child: Container(
            padding: EdgeInsets.fromLTRB(
                24, 24, 24, 24 + context.mediaQueryViewInsets.bottom),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormFieldWidget(controller: controller.addressController),
                AppGaps.hGap12,
                CustomStretchedTextButtonWidget(
                    isLoading: controller.isLoading,
                    onTap: controller.onSetButtonTap,
                    buttonText: 'Set')
              ],
            ),
          )),
        ),
      ),
    );
  }
}
