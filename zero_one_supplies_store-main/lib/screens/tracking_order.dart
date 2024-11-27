import 'package:ecomikstoreapp/controller/track_order_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_data.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/constants/app_page_names.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String currentOrderStatus = AppData.orderStatusDelivered;
    return GetBuilder<TrackOrderScreenController>(
        init: TrackOrderScreenController(),
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
                    titleWidget: const Text('#5655565665')),

                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: CustomScrollView(
                    slivers: [
                      /* <---- Top extra spaces ----> */
                      const SliverToBoxAdapter(child: AppGaps.hGap10),
                      /* <---- Search and filter button row ----> */
                      SliverToBoxAdapter(
                        child: Container(
                          height: 82,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22))),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /* <---- Product Active Auctions tab button ----> */
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Obx(() => CustomTabToggleButtonWidget(
                                      text: LanguageHelper.currentLanguageText(
                                          LanguageHelper.detailsTransKey),
                                      isSelected:
                                          controller.isActiveSelected.value,
                                      onTap: () {
                                        // setState(() {
                                        controller.isActiveSelected.value =
                                            true;
                                        controller.update();
                                        // });
                                      })),
                                ),
                              ),
                              AppGaps.wGap5,
                              /* <---- Product Won Auctions tab button ----> */
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Obx(() => CustomTabToggleButtonWidget(
                                      text: LanguageHelper.currentLanguageText(
                                          LanguageHelper.trackingTransKey),
                                      isSelected:
                                          !controller.isActiveSelected.value,
                                      onTap: () {
                                        // setState(() {
                                        controller.isActiveSelected.value =
                                            false;
                                        controller.update();
                                        // });
                                      })),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(child: AppGaps.hGap24),
                      Obx(
                        () => controller.isActiveSelected.value
                            /* <---- If product review tab is selected ----> */
                            /* <---- Review list ----> */
                            ? SliverToBoxAdapter(
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          margin: const EdgeInsets.all(2),
                                          child: Text(
                                            LanguageHelper.currentLanguageText(
                                                LanguageHelper
                                                    .orderStatusTransKey),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          margin: const EdgeInsets.all(2),
                                          child: Text(
                                            '${LanguageHelper.currentLanguageText(LanguageHelper.trackingIdTransKey)} #56044f5505',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AppGaps.hGap24,
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 140,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(18))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                  LanguageHelper
                                                      .currentLanguageText(
                                                          LanguageHelper
                                                              .senderInfoTransKey),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${LanguageHelper.currentLanguageText(LanguageHelper.senderNameTransKey)} :',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Text(
                                                '   Liton Nandi  ',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          AppGaps.hGap5,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '  ${LanguageHelper.currentLanguageText(LanguageHelper.addressTransKey)} :  ',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Text(
                                                  '   rastar more,Khulna Sader,Khulna  ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          AppGaps.hGap5,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '  ${LanguageHelper.currentLanguageText(LanguageHelper.phoneTransKey)} :  ',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Text(
                                                  '   01403224458  ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    AppGaps.hGap24,
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 140,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(18))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                  LanguageHelper
                                                      .currentLanguageText(
                                                          LanguageHelper
                                                              .deliveryInfoTransKey),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${LanguageHelper.currentLanguageText(LanguageHelper.senderNameTransKey)}: ',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Text(
                                                '   Liton Nandi  ',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          AppGaps.hGap5,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ' ${LanguageHelper.currentLanguageText(LanguageHelper.addressTransKey)} :  ',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Text(
                                                  '   rastar more,Khulna Sader,Khulna  ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          AppGaps.hGap5,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '  ${LanguageHelper.currentLanguageText(LanguageHelper.phoneTransKey)}  :  ',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Text(
                                                  '   01403224458  ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    AppGaps.hGap24,
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 142,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(18))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                  LanguageHelper
                                                      .currentLanguageText(
                                                          LanguageHelper
                                                              .productInfoTransKey),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${LanguageHelper.currentLanguageText(LanguageHelper.productTypeTransKey)}  : ',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Text(
                                                '   Liquid  ',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          AppGaps.hGap5,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${LanguageHelper.currentLanguageText(LanguageHelper.productWeightTransKey)}   : ',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Text(
                                                  '   10KG  ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          AppGaps.hGap5,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ' ${LanguageHelper.currentLanguageText(LanguageHelper.productQuantityTransKey)}   ',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Text(
                                                  '   10  ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          AppGaps.hGap5,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ' ${LanguageHelper.currentLanguageText(LanguageHelper.amountToCollectTransKey)}   :    ',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Text(
                                                  '   5000  ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    AppGaps.hGap24,
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 145,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(18))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                  LanguageHelper
                                                      .currentLanguageText(
                                                          LanguageHelper
                                                              .costInfoTransKey),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '  ${LanguageHelper.currentLanguageText(LanguageHelper.cashCollectionTransKey)}   : ',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Text(
                                                r'   $5000  ',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          AppGaps.hGap5,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '  ${LanguageHelper.currentLanguageText(LanguageHelper.deliveryChargeTransKey)}    :  ',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Text(
                                                  r'  $10  ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          AppGaps.hGap5,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${LanguageHelper.currentLanguageText(LanguageHelper.deliveryChargeTransKey)}   :    ',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Text(
                                                  r' $10  ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          AppGaps.hGap5,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                LanguageHelper
                                                    .currentLanguageText(
                                                        LanguageHelper
                                                            .totalTransKey),
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                ' ${LanguageHelper.currentLanguageText(LanguageHelper.youReceivedTransKey)}:',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Expanded(
                                                child: Text(
                                                  r'     $65.00  ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            /* <---- If product description tab is selected ----> */
                            /* <---- Description widget ----> */
                            : SliverToBoxAdapter(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.8),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(18)),
                                          border: Border.all(
                                              color: Colors.white
                                                  .withOpacity(0.9))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // ignore: use_colored_box
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 24,
                                                width: 24,
                                                child: SvgPicture.asset(
                                                    AppAssetImages.truckSVGLogo,
                                                    color: Colors.black),
                                              )
                                            ],
                                          ),
                                          AppGaps.wGap15,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    LanguageHelper
                                                        .currentLanguageText(
                                                            LanguageHelper
                                                                .estimatedDeliveryDaysTransKey),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )
                                                ],
                                              ),
                                              AppGaps.hGap10,
                                              const Row(
                                                children: [
                                                  Text('Tus, Mar 10  '),
                                                  AppGaps.wGap10,
                                                  Text('10:00 AM-01:00pm')
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    AppGaps.hGap24,
                                    //Start here
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(18)),
                                          color: Colors.white.withOpacity(0.5)),
                                      child: Column(children: [
                                        AppGaps.hGap24,
                                        /* <---- Order placed status ----> */
                                        controller.orderPlacedWidget(
                                            currentOrderStatus),
                                        AppGaps.hGap15,
                                        /* <---- Order pending status ----> */
                                        controller.orderPendingWidget(
                                            currentOrderStatus),
                                        AppGaps.hGap15,
                                        /* <---- Order confirmed status ----> */
                                        controller
                                            .orderConfirmed(currentOrderStatus),
                                        AppGaps.hGap15,
                                        /* <---- Order processing status ----> */
                                        controller.orderProcessing(
                                            currentOrderStatus),
                                        AppGaps.hGap15,
                                        /* <---- Order delivered status ----> */
                                        controller
                                            .orderDelivered(currentOrderStatus),
                                        // Bottom extra spaces
                                        AppGaps.hGap30,
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                      ),
                      const SliverToBoxAdapter(child: AppGaps.hGap10),
                    ],
                  ),
                ),
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                    backgroundColor: Colors.white,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppGaps.hGap16,
                        /* <---- Delivery man profile picture, name, designation row ----> */
                        Row(
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
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  AppGaps.hGap8,
                                  const Text(
                                    'Delivery partner assigned',
                                    style: TextStyle(
                                        color: AppColors.bodyTextColor),
                                  )
                                ],
                              ),
                            ),
                            /* <---- Delivery man call icon button ----> */
                            CustomIconButtonWidget(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    AppAssetImages.gpsUpArrowSVGLogoLine,
                                    color: AppColors.primaryColor,
                                    height: 24,
                                    width: 24)),
                          ],
                        ),
                        AppGaps.hGap24,
                        CustomStretchedTextButtonWidget(
                            buttonText: LanguageHelper.currentLanguageText(
                                LanguageHelper.readyToDeliveredTransKey),
                            onTap: () {
                              // Go to delivery info map screen
                              Get.toNamed(AppPageNames.deliveryInfoMapScreen);
                            })
                      ],
                    )),
              ),
            ));
  }
}
