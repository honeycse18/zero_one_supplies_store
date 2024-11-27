import 'package:ecomikstoreapp/controller/pckup_confirmed.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickupConfirm extends StatelessWidget {
  const PickupConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickUpConfirmedScreenController>(
        init: PickUpConfirmedScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context,
                    hasBackButton: false,
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.pickupRequestTransKey))),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: Center(
                      child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppGaps.hGap10,
                        /* <---- Congratulation illustration ----> */
                        Image.asset(AppAssetImages.pickupconfirmed,
                            height: 250),
                        AppGaps.hGap56,
                        HighlightAndDetailTextWidget(
                            slogan: LanguageHelper.currentLanguageText(
                                LanguageHelper.pickupRequestConfirmTransKey),
                            subtitle:
                                '${LanguageHelper.currentLanguageText(LanguageHelper.yourPickupRequestIsPlacedTransKey)} 56044f5505'),
                        // Bottom extra spaces
                        AppGaps.hGap20,
                      ],
                    ),
                  )),
                ),
                /* <-------- Bottom bar --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                  child: CustomStretchedTextButtonWidget(
                      buttonText: LanguageHelper.currentLanguageText(
                          LanguageHelper.viewTransKey),
                      onTap: () {
                        // Get.toNamed(context, AppPageNames.deliveryservice,
                        //     arguments: 0);
                      }),
                ),
              ),
            ));
  }
}
