import 'package:ecomikstoreapp/controller/pickup_third_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/constants/app_page_names.dart';

class PickupThirdScreen extends StatelessWidget {
  const PickupThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickupThirdScreenController>(
        init: PickupThirdScreenController(),
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
                                          LanguageHelper
                                              .productDetailsTransKey),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(color: Colors.black)),
                                ],
                              ),
                              AppGaps.hGap24,
                              /* <---- Edit Date ----> */
                              Row(
                                children: [
                                  Text(
                                    LanguageHelper.currentLanguageText(
                                        LanguageHelper.productDetailsTransKey),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              AppGaps.hGap24,

                              Column(
                                children: [
                                  Row(children: [
                                    Expanded(
                                      flex: 1,
                                      child: RadioListTile(
                                          title: Text(LanguageHelper
                                              .currentLanguageText(
                                                  LanguageHelper
                                                      .fragileTransKey)),
                                          value: '0',
                                          groupValue: controller.selectedOption,
                                          onChanged: (value) {
                                            // setState(() {
                                            controller.selectedOption = value!;
                                            // });
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: AppColors.primaryColor
                                          // direction: Axis.horizontal,
                                          ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: RadioListTile(
                                          title: Text(LanguageHelper
                                              .currentLanguageText(
                                                  LanguageHelper
                                                      .liquidTransKey)),
                                          value: '1',
                                          groupValue: controller.selectedOption,
                                          onChanged: (value) {
                                            // setState(() {
                                            controller.selectedOption = value!;
                                            // });
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor: AppColors.primaryColor
                                          // direction: Axis.horizontal,
                                          ),
                                    ),
                                  ]),
                                ],
                              ),

                              AppGaps.hGap24,
                              /* <---- Edit your email address ----> */

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: TextFormFieldWidget(
                                      isReadOnly: true,
                                      labelText:
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .totalWeightTransKey),
                                      hintText: '0-0.5',
                                      // prefixIcon: SvgPicture.asset(
                                      //     AppAssetImages.menuSVGLogoLine,
                                      //     color: AppColors.bodyTextColor),
                                      suffixIcon: PopupMenuButton<int>(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          position: PopupMenuPosition.under,
                                          child: CustomIconButtonWidget(
                                            fixedSize: const Size(20, 20),
                                            child: SvgPicture.asset(
                                                AppAssetImages
                                                    .arrowDownSVGLogoLine,
                                                height: 12,
                                                color: AppColors.bodyTextColor),
                                          ),
                                          itemBuilder: (context) => [
                                                const PopupMenuItem<int>(
                                                  value: 0,
                                                  child: Text(
                                                    '0-0.05',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                const PopupMenuItem<int>(
                                                  value: 1,
                                                  child: Text(
                                                    '1-2.5',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                const PopupMenuItem<int>(
                                                  value: 2,
                                                  child: Text(
                                                    '2-2.5',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ]),
                                    ),
                                  ),
                                  AppGaps.wGap10,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .totalQuantityTransKey),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                        AppGaps.hGap8,
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          height: 62,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.08)),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(18)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                height: 36,
                                                width: 36,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(6)),
                                                    color: Colors.white),
                                                child: TextButton(
                                                  // backgroundColor: Colors.transparent,
                                                  onPressed: controller
                                                      .decrementCounter,
                                                  // tooltip: 'Decrement',
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Image.asset(
                                                          'assets/images/minus.png',
                                                          width: 12,
                                                          height:
                                                              12), // adjust the size and color of the icon
                                                      // adjust the size and color of the text
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                '$controller.counter',
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                              const Spacer(),
                                              Container(
                                                height: 36,
                                                width: 36,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(6)),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      AppColors.primaryColor,
                                                      AppColors.primaryColor
                                                          .withOpacity(0.5),
                                                    ],
                                                  ),
                                                ),
                                                child: TextButton(
                                                  // backgroundColor: Colors.transparent,
                                                  onPressed: controller
                                                      .incrementCounter,
                                                  // tooltip: 'Decrement',
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Image.asset(
                                                          'assets/images/plus.png',
                                                          width: 12,
                                                          height:
                                                              12), // adjust the size and color of the icon
                                                      // adjust the size and color of the text
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // onPressed: _incrementCounter,
                                    // CustomTextFormField(
                                    //     labelText: 'Total Quantity',
                                    //     hintText: '  jhon Doe',
                                    //     // textInputType: TextInputType.phone,
                                    //     prefixIcon: SvgPicture.asset(
                                    //         AppAssetImages.profileSVGLogoLine,
                                    //         color: AppColors.bodyTextColor)),
                                  ),
                                ],
                              ),

                              AppGaps.hGap24,
                              TextFormFieldWidget(
                                  labelText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.amountToCollectTransKey),
                                  hintText: '  500',
                                  // textInputType: TextInputType.phone,
                                  prefixIcon: SvgPicture.asset(
                                      AppAssetImages.ioi,
                                      color: AppColors.bodyTextColor)),

                              AppGaps.hGap24,
                              TextFormFieldWidget(
                                  labelText: LanguageHelper.currentLanguageText(
                                      LanguageHelper
                                          .productDescriptionTransKey),
                                  hintText: '  Sansa acacaa ',
                                  // textInputType: TextInputType.phone,
                                  prefixIcon: SvgPicture.asset(
                                      AppAssetImages.document,
                                      color: AppColors.bodyTextColor)),
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
                bottomNavigationBar: Container(
                  margin: const EdgeInsets.all(24),
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(18))),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  LanguageHelper.currentLanguageText(
                                      LanguageHelper.amountToCollectTransKey),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                const Text(
                                  r'$ 150 ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            AppGaps.hGap8,
                            Row(
                              children: [
                                Text(
                                  LanguageHelper.currentLanguageText(
                                      LanguageHelper.codChargeTransKey),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                const Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red),
                                ),
                                const Text(
                                  r' $ 5 ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            AppGaps.hGap8,
                            Row(
                              children: [
                                Text(
                                  LanguageHelper.currentLanguageText(
                                      LanguageHelper.deliveryChargeTransKey),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                const Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red),
                                ),
                                const Text(
                                  r' $ 10 ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            AppGaps.hGap16,
                            Row(
                              children: [
                                Text(
                                  LanguageHelper.currentLanguageText(
                                      LanguageHelper.totalTransKey),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  LanguageHelper.currentLanguageText(
                                      LanguageHelper.youReceivedTransKey),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                const Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red),
                                ),
                                const Text(
                                  r' $ 135 ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomScaffoldBottomBarWidget(
                          child: CustomStretchedTextButtonWidget(
                        buttonText: LanguageHelper.currentLanguageText(
                            LanguageHelper.submitTransKey),
                        onTap: () {
                          Get.toNamed(AppPageNames.pickupConfirm);
                        },
                      )),
                    ],
                  ),
                ),
              ),
            ));
  }
}
