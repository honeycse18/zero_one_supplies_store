import 'package:ecomikstoreapp/controller/payment_summary_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentSumScreen extends StatelessWidget {
  const PaymentSumScreen({super.key});

  /// Toggle value of notification
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentSumScreenController>(
        init: PaymentSumScreenController(),
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
                      titleWidget: Text(LanguageHelper.currentLanguageText(
                          LanguageHelper.paymentSummeryTransKey))),
                  /* <-------- Content --------> */
                  body: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(16),
                            height: 176,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(18))),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Row(
                                      children: [
                                        Text(
                                          'Invoice Id: 998716',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            AppAssetImages.documentSvg)
                                      ],
                                    ),
                                  ],
                                ),
                                AppGaps.hGap5,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .trackingIDTransKey),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    AppGaps.wGap18,
                                    const Row(
                                      children: [
                                        Text(
                                          '#5417878979898',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                AppGaps.hGap5,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .cashCollectionTransKey),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    AppGaps.wGap18,
                                    const Row(
                                      children: [
                                        Text(
                                          r'$50',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                AppGaps.hGap5,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper.codChargeTransKey),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    AppGaps.wGap18,
                                    const Row(
                                      children: [
                                        Text(
                                          r'- $10',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                AppGaps.hGap5,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .deliveryChargeTransKey),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    AppGaps.wGap18,
                                    const Row(
                                      children: [
                                        Text(
                                          r'-$10',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                AppGaps.hGap10,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper.totalTransKey),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    AppGaps.wGap18,
                                    const Row(
                                      children: [
                                        Text(
                                          r'$30.00',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(16),
                            height: 176,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(18))),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${LanguageHelper.currentLanguageText(LanguageHelper.invoiceIDTransKey)} 998716',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            AppAssetImages.documentSvg)
                                      ],
                                    ),
                                  ],
                                ),
                                AppGaps.hGap5,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .trackingIDTransKey),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    AppGaps.wGap18,
                                    const Row(
                                      children: [
                                        Text(
                                          '#5417878979898',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                AppGaps.hGap5,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .cashCollectionTransKey),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    AppGaps.wGap18,
                                    const Row(
                                      children: [
                                        Text(
                                          r'$50',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                AppGaps.hGap5,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper.codChargeTransKey),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    AppGaps.wGap18,
                                    const Row(
                                      children: [
                                        Text(
                                          r'- $10',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                AppGaps.hGap5,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .deliveryChargeTransKey),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    AppGaps.wGap18,
                                    const Row(
                                      children: [
                                        Text(
                                          r'-$10',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                AppGaps.hGap10,
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper.totalTransKey),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    AppGaps.wGap18,
                                    const Row(
                                      children: [
                                        Text(
                                          r'$30.00',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ));
  }
}
