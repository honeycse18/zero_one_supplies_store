import 'package:ecomikstoreapp/controller/add_auction_third_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants/app_page_names.dart';

class AddActionThirdScreen extends StatelessWidget {
  const AddActionThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddActionThirdScreenController>(
        init: AddActionThirdScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Appbar --------> */
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context,
                    hasBackButton: true,
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.addAuctionTransKey))),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // CircleAvatar(
                        //   backgroundImage: Image.asset(
                        //     AppAssetImages.myAccountProfilePicture,
                        //   ).image,
                        //   radius: 64,
                        // ),
                        // Top extra spaces
                        AppGaps.hGap15,
                        /* <---- Product picture ----> */
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                      LanguageHelper.currentLanguageText(
                                          LanguageHelper.deliveryInfoTransKey),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(color: Colors.black)),
                                ],
                              ),

                              AppGaps.hGap24,
                              /* <---- Edit Date ----> */
                              TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper
                                        .estimatedDeliveryDaysTransKey),
                                hintText: '  eg  5  ',
                                // prefixIcon: SvgPicture.asset(
                                //     AppAssetImages.calenderSVGLogoLine)
                              ),
                              AppGaps.hGap24,
                              TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.freeShippingTransKey),
                                hintText: r'  eg: 5000 $  ',
                                // prefixIcon: SvgPicture.asset(
                                //     AppAssetImages.calenderSVGLogoLine)
                              ),
                              AppGaps.hGap24,
                              TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.returnDaysTransKey),
                                hintText: '  eg:  7',
                                // prefixIcon: SvgPicture.asset(
                                //     AppAssetImages.calenderSVGLogoLine)
                              ),

                              // ottom extra spaces
                              AppGaps.hGap30,
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                /* <-------- Bottom bar --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                    child: CustomStretchedTextButtonWidget(
                  buttonText: LanguageHelper.currentLanguageText(
                      LanguageHelper.uploadTransKey),
                  onTap: () {
                    Get.toNamed(AppPageNames.addProduct1stScreen);
                  },
                )),
              ),
            ));
  }
}
