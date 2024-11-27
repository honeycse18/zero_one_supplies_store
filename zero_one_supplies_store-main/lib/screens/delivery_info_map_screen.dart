import 'package:ecomikstoreapp/controller/delivery_info_map_controller.dart';
import 'package:ecomikstoreapp/utils/app_singleton.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryInfoMapScreen extends StatelessWidget {
  const DeliveryInfoMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryInfoMapScreenController>(
        init: DeliveryInfoMapScreenController(),
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
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.deliveryInfoTransKey)),
                    actions: [
                      Center(
                        child: CustomIconButtonWidget(
                            onTap: () {},
                            hasShadow: true,
                            child: SvgPicture.asset(
                              AppAssetImages.searchSVGLogoLine,
                              color: AppColors.darkColor,
                              height: 18,
                              width: 18,
                            )),
                      ),
                      AppGaps.wGap15,
                    ]),
                /* <-------- Content --------> */
                body: DecoratedBox(
                  decoration: const BoxDecoration(
                      /* image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center,
                          /* <---- Demo map location background image ----> */
                          image: Image.asset(AppAssetImages
                                  .deliveryInfoBackgroundDemoImage)
                              .image) */
                      ),
                  child: GoogleMap(
                    // mapType: MapType.,
                    initialCameraPosition:
                        AppSingleton.instance.defaultCameraPosition,
                    markers: controller.googleMapMarkers,
                    onMapCreated: controller.onGoogleMapCreated,
                    onTap: controller.onGoogleMapTap,
                  ),
                ),
                /* <-------- Bottom bar --------> */
                bottomNavigationBar: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    CustomScaffoldBottomBarWidget(
                        child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              radius: 24,
                              backgroundImage:
                                  Image.asset(AppAssetImages.reviewer1Image)
                                      .image),
                          AppGaps.wGap16,
                          /* <---- Delivery man name and designation column ----> */
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'George Anderson',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                AppGaps.hGap8,
                                Text(
                                  LanguageHelper.currentLanguageText(
                                      LanguageHelper
                                          .deliveryPartnerAssignedTransKey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: AppColors.bodyTextColor),
                                )
                              ],
                            ),
                          ),
                          /* <---- Delivery man call icon button ----> */
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppGaps.wGap5,
                              CustomIconButtonWidget(
                                  fixedSize: const Size(20, 20),
                                  onTap: () {
                                    Get.toNamed(
                                        AppPageNames.chatWithDeliverymanScreen);
                                  },
                                  child: SvgPicture.asset(
                                      AppAssetImages.messageSVGLogoLine,
                                      color: AppColors.primaryColor)),
                              AppGaps.wGap24,
                              CustomIconButtonWidget(
                                  fixedSize: const Size(20, 20),
                                  onTap: () {
                                    Get.toNamed(AppPageNames.callScreen);
                                  },
                                  child: SvgPicture.asset(
                                      AppAssetImages.callingSVGLogoLine,
                                      color: AppColors.primaryColor)),
                            ],
                          ),
                        ],
                      ),
                    )),
                    /* <---- Slide up notch widget ----> */
                    Positioned(
                      top: -7,
                      child: SvgPicture.asset(
                          AppAssetImages.slideUpPanelNotchSVG,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ));
  }
}
