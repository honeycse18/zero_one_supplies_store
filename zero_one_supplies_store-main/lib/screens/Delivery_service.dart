import 'package:ecomikstoreapp/controller/delivery_service_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DeliveryService extends StatelessWidget {
  const DeliveryService({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryServiceScreenController>(
        init: DeliveryServiceScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context,
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.deliveryInfoTransKey)),
                    actions: [
                      Center(
                        child: CustomIconButtonWidget(
                          onTap: () {
                            Get.toNamed(AppPageNames.trackOrderScreen);
                          },
                          hasShadow: true,
                          child: SvgPicture.asset(
                            AppAssetImages.trackSvgLogo,
                            color: AppColors.primaryColor,
                            height: 18,
                            width: 18,
                          ),
                        ),
                      ),
                      AppGaps.wGap20,
                    ]),
                /* <-------- Content --------> */
                body: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),
                      height: 62,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.white.withOpacity(0.6),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18))),
                      child: ListTile(
                        title: Text(LanguageHelper.currentLanguageText(
                            LanguageHelper.createAPickupRequestTransKey)),
                        trailing: SvgPicture.asset(
                            AppAssetImages.arrowrightSVGLogoLine),
                        onTap: () {
                          Get.toNamed(AppPageNames.pickupScreen);
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),
                      height: 62,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.white.withOpacity(0.6),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18))),
                      child: ListTile(
                        title: Text(LanguageHelper.currentLanguageText(
                            LanguageHelper.deliveriesTransKey)),
                        trailing: SvgPicture.asset(
                            AppAssetImages.arrowrightSVGLogoLine),
                        onTap: () {
                          Get.toNamed(AppPageNames.deliveries);
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),
                      height: 62,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.white.withOpacity(0.6),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18))),
                      child: ListTile(
                        // leading: Icon(Icons.train),
                        title: Text(LanguageHelper.currentLanguageText(
                            LanguageHelper.invoiceTransKey)),
                        onTap: () {
                          Get.toNamed(AppPageNames.paymentSumScreen);
                        },
                        trailing: SvgPicture.asset(
                            AppAssetImages.arrowrightSVGLogoLine),
                      ),
                    )
                  ],
                ),
                /* <-------- Bottom bar --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                  child: CustomStretchedTextButtonWidget(
                      buttonText: LanguageHelper.currentLanguageText(
                          LanguageHelper.viewTransKey),
                      onTap: () {
                        Get.toNamed(
                          AppPageNames.trackOrderScreen,
                        );
                      }),
                ),
              ),
            ));
  }
}
