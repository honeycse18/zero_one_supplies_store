import 'dart:ui';

import 'package:ecomikstoreapp/controller/bid_widget_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_components.dart';
import 'package:ecomikstoreapp/utils/constants/app_gaps.dart';
import 'package:ecomikstoreapp/utils/constants/app_text_styles.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BidWidget extends StatelessWidget {
  final bool isWishListed;
  final void Function()? onWishListTap;
  final String name;
  final String bidNumber;
  // final String shortFrame;
  final double money;
  final String categoryImageUrl;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final void Function()? onTap;
  const BidWidget({
    super.key,
    required this.name,
    this.bidNumber = '',
    // required this.shortFrame,
    this.onWishListTap,
    this.onTap,
    this.isWishListed = false,
    this.money = 0,
    this.categoryImageUrl = '',
    required this.startDateTime,
    required this.endDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BidWidgetController>(
        init: BidWidgetController(),
        global: false,
        builder: (controller) {
          controller.bidEndDateTime = endDateTime;
          return CustomListTileWidget(
              borderRadius: AppComponents.productGridItemBorderRadius,
              paddingValue:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              onTap: onTap,
              child: Row(
                children: [
                  SizedBox(
                    height: 95,
                    width: 95,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CachedNetworkImageWidget(
                          imageURL: categoryImageUrl,
                          imageBuilder: (context, imageProvider) => Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: AppComponents.imageBorderRadius,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.contain)),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10.0,
                                    sigmaY: 10.0,
                                  ),
                                  child: Container(
                                    height: 25,
                                    // width: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1),
                                        //borderRadius: BorderRadius.circular(16.0),
                                        border: Border.all(
                                          width: 1.5,
                                          color: Colors.black.withOpacity(0.1),
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          '${controller.remainingDays()}D',
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        /* Column(
                                          mainAxisSize: MainAxisSize.min,
                                          // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${controller.remainingDays()}D',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              'Days',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ), */
                                        Text(
                                          '${controller.remainingHours()}H',
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        /* Column(
                                          mainAxisSize: MainAxisSize.min,
                                          // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${controller.remainingHours()}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              'Hours',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ), */
                                        Text(
                                          '${controller.remainingMinutes()}M',
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        /* Column(
                                          mainAxisSize: MainAxisSize.min,
                                          // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${controller.remainingMinutes()}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              'Minutes',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ), */
                                        Text(
                                          '${controller.remainingSeconds()}S',
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        /* Column(
                                          mainAxisSize: MainAxisSize.min,
                                          // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${controller.remainingSeconds()}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              'Seconds',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ), */
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppGaps.wGap16,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.bodyMediumTextStyle,
                      ),
                      Text(
                        bidNumber,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.bodyMediumTextStyle,
                      ),
                      AppGaps.hGap8,
                      Text(
                        'Highest Bid ${Helper.getCurrencyFormattedAmountText(money)}',
                        textAlign: TextAlign.left,
                        style: AppTextStyles.bodyLargeMediumTextStyle,
                      ),
                    ],
                  ))
                ],
              ));
        });
  }
}
/* class BidWidget extends StatelessWidget {
  final void Function()? onWishlistTap;
  final void Function()? onTap;
  final String name;
  final String shortFrame;
  final String money;
final DateTime endDateTime;
  final String categoryImageURL;
  const BidWidget({
    Key? key,
    required this.name,
    required this.shortFrame,
    this.onWishlistTap,
    required this.money,
    required this.categoryImageURL,
    required this.endDateTime,
    this.onTap,
  }) : super(key: key);

  @override
  /* Widget build(BuildContext context) {
    return GetBuilder<BidWidgetController>(
        init: BidWidgetController(),
        global: false,
        builder: (controller) {
          controller.bidEndDateTime = endDateTime;
          CustomListTileWidget(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: CachedNetworkImageWidget(
                            imageURL: categoryImageURL,
                            imageBuilder: (context, imageProvider) => Container(
                              height: 150,
                              // width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    /* Container(
                      // height: 150,
                      // width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: categoryImageProvider, fit: BoxFit.cover)),
                    ), */
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Container(
                                height: 40,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.transparent.withOpacity(0.1),
                                    //borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      width: 1.5,
                                      color:
                                          Colors.transparent.withOpacity(0.1),
                                    )),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text(
                                          '10',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Days',
                                          style: TextStyle(
                                              fontSize: 8, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text(
                                          '7',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Days',
                                          style: TextStyle(
                                              fontSize: 8, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text(
                                          '25',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Days',
                                          style: TextStyle(
                                              fontSize: 8, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text(
                                          '48',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Days',
                                          style: TextStyle(
                                              fontSize: 8, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                              ),
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
          AppGaps.wGap20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.bodySemiboldTextStyle
                      .copyWith(color: AppColors.auctionFontColor),
                ),
                AppGaps.hGap16,
                Text(
                  'Highest Bid \$$money',
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),

          /*  Row(
            children: [
             
              // const Spacer(),
              const Text(
                '',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              // const Spacer(),
            ],
          ),
          AppGaps.hGap8, */
        ],
      ),
    );
  });
  } */
  Widget build(BuildContext context) {
    return GetBuilder<BidWidgetController>(
        init: BidWidgetController(),
        global: false,
        builder: (controller) {
          controller.bidEndDateTime = endDateTime;
          return CustomGridSingleItemWidget(
            borderRadius: AppComponents.productGridItemBorderRadius,
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    // height: 159,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          height: 159,
                          child: CachedNetworkImageWidget(
                            imageURL: categoryImageUrl,
                            imageBuilder: (context, imageProvider) => Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: AppComponents.imageBorderRadius,
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.contain)),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10.0,
                                    sigmaY: 10.0,
                                  ),
                                  child: Container(
                                    height: 40,
                                    // width: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1),
                                        //borderRadius: BorderRadius.circular(16.0),
                                        border: Border.all(
                                          width: 1.5,
                                          color: Colors.black.withOpacity(0.1),
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${controller.remainingDays()}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'Days',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${controller.remainingHours()}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'Hours',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${controller.remainingMinutes()}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'Minutes',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${controller.remainingSeconds()}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'Seconds',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                            top: 10,
                            right: 10,
                            child: SizedBox(
                              height: 15,
                              width: 15,
                              // color: Colors.white.withOpacity(0.9),
                              child: WishlistItemButtonWidget(
                                  isWishListed: isWishListed,
                                  onTap: onWishListTap),
                            ))
                      ],
                    ),
                  ),
                  AppGaps.hGap30,
                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppTextStyles.bodyMediumTextStyle
                        .copyWith(color: AppColors.darkColor),
                  ),
                  AppGaps.hGap8,
                  /*  Text(
              shortFrame,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                  color: AppColors.bodyTextColor),
                      ), */
                  // AppGaps.hGap8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        money,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      const Text(
                        '(Current Bid)',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                      Spacer(),
                    ],
                  ),
                  AppGaps.hGap8,
                ],
              ),
            ),
          );
        });
  }
} */
