import 'package:ecomikstoreapp/controller/pickup_request_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/constants/app_page_names.dart';

class PickupScreen extends StatelessWidget {
  const PickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickupScreenController>(
        init: PickupScreenController(),
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
                        LanguageHelper.pickupRequestTransKey))),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                          LanguageHelper.yourAddressTransKey),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(color: Colors.black)),
                                ],
                              ),
                              AppGaps.hGap24,
                              /* <---- Edit Date ----> */

                              /* <---- Edit your phone number ----> */
                              TextFormFieldWidget(
                                  labelText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.senderNameTransKey),
                                  hintText: '  jhon Doe',
                                  // textInputType: TextInputType.phone,
                                  prefixIcon: SvgPicture.asset(
                                      AppAssetImages.profileSVGLogoLine,
                                      color: AppColors.bodyTextColor)),
                              AppGaps.hGap24,
                              /* <---- Edit your email address ----> */
                              TextFormFieldWidget(
                                isReadOnly: true,
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.pickupAddressTransKey),
                                hintText: 'Jhon Doe',
                                prefixIcon: SvgPicture.asset(
                                    AppAssetImages.menuSVGLogoLine,
                                    color: AppColors.bodyTextColor),
                                suffixIcon: PopupMenuButton<int>(
                                    padding: const EdgeInsets.only(right: 5),
                                    position: PopupMenuPosition.under,
                                    child: CustomIconButtonWidget(
                                      fixedSize: const Size(20, 20),
                                      child: SvgPicture.asset(
                                          AppAssetImages.arrowDownSVGLogoLine,
                                          height: 12,
                                          color: AppColors.bodyTextColor),
                                    ),
                                    itemBuilder: (context) => [
                                          const PopupMenuItem<int>(
                                            value: 0,
                                            child: Text(
                                              'zero one Supplies',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const PopupMenuItem<int>(
                                            value: 1,
                                            child: Text(
                                              'AppStick',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const PopupMenuItem<int>(
                                            value: 2,
                                            child: Text(
                                              'ShopStick',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ]),
                              ),

                              AppGaps.hGap24,
                              TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.pickupPhoneTransKey),
                                hintText: ' +88017123345678',
                                textInputType: TextInputType.phone,
                                // prefixIcon: SvgPicture.asset(
                                //     AppAssetImages.callingSVGLogoLine,
                                //     color: AppColors.bodyTextColor)
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
                      LanguageHelper.nextTransKey),
                  onTap: () {
                    Get.toNamed(AppPageNames.pickupSecondScreen);
                  },
                )),
              ),
            ));
  }
}
