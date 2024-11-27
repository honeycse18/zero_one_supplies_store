import 'dart:ui';

import 'package:ecomikstoreapp/controller/my_wallet_screen_controller.dart';
import 'package:ecomikstoreapp/models/fake_data.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/payment_option_list_tile_widgetscreen.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/my_wallet_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  //  int _selectedPaymentOptionIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyWalletScreenController>(
        init: MyWalletScreenController(),
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
                      LanguageHelper.walletTransKey)),
                ),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: CustomScrollView(slivers: [
                    // Top extra spaces
                    const SliverToBoxAdapter(child: AppGaps.hGap15),
                    /* <---- Payment credit card illustration widget ----> */
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 131,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /* <---- Orders total data widget ----> */
                                Container(
                                  height: 131,
                                  width: 130,
                                  padding: const EdgeInsets.all(16),
                                  alignment: Alignment.topLeft,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          AppComponents.defaultBorderRadius)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomIconButtonWidget(
                                          borderRadiusRadiusValue:
                                              const Radius.circular(8),
                                          backgroundColor:
                                              AppColors.pendingColor,
                                          child: SvgPicture.asset(
                                            AppAssetImages.cartSVGLogoLine,
                                            color: Colors.white,
                                          )),
                                      AppGaps.hGap16,
                                      Text(
                                        '45',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      AppGaps.hGap4,
                                      Text(
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.ordersTransKey),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: AppColors.bodyTextColor),
                                      )
                                    ],
                                  ),
                                ),
                                AppGaps.wGap16,
                                /* <---- Ride total data widget ----> */
                                Container(
                                  height: 131,
                                  width: 130,
                                  padding: const EdgeInsets.all(16),
                                  alignment: Alignment.topLeft,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          AppComponents.defaultBorderRadius)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomIconButtonWidget(
                                          borderRadiusRadiusValue:
                                              const Radius.circular(8),
                                          backgroundColor:
                                              const Color(0xFFF57C1E),
                                          child: SvgPicture.asset(
                                            AppAssetImages.bagsvg,
                                            color: Colors.white,
                                          )),
                                      AppGaps.hGap16,
                                      Text(
                                        '68km',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      AppGaps.hGap4,
                                      Text(
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.rideTransKey),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: AppColors.bodyTextColor),
                                      )
                                    ],
                                  ),
                                ),
                                AppGaps.wGap16,
                                /* <---- Earning total data widget ----> */
                                Container(
                                  height: 131,
                                  width: 130,
                                  padding: const EdgeInsets.all(16),
                                  alignment: Alignment.topLeft,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          AppComponents.defaultBorderRadius)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomIconButtonWidget(
                                          borderRadiusRadiusValue:
                                              const Radius.circular(8),
                                          backgroundColor:
                                              AppColors.tertiaryColor,
                                          child: SvgPicture.asset(
                                            AppAssetImages
                                                .walletSVGLogoDualTone,
                                            color: Colors.white,
                                          )),
                                      AppGaps.hGap16,
                                      Text(
                                        r'$238.00',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      AppGaps.hGap4,
                                      Text(
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.earningsTransKey),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: AppColors.bodyTextColor),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    // SliverToBoxAdapter(
                    //     child: PaymentCardWidget(
                    //         child: Column(
                    //   mainAxisSize: MainAxisSize.max,
                    //   crossAxisAlignment: CrossAxisAlignment.stretch,
                    //   children: [
                    //     Text('Name',
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .caption
                    //             ?.copyWith(color: Colors.white.withOpacity(0.7))),
                    //     AppGaps.hGap2,
                    //     Text('Michel John Doe',
                    //         style: Theme.of(context).textTheme.button?.copyWith(
                    //             color: Colors.white, fontWeight: FontWeight.w600)),
                    //     AppGaps.hGap16,
                    //     Text(
                    //       '****    ****    ****    2382',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .caption
                    //           ?.copyWith(color: Colors.white),
                    //     ),
                    //     AppGaps.hGap16,
                    //     Text('Balance',
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .caption
                    //             ?.copyWith(color: Colors.white.withOpacity(0.7))),
                    //     AppGaps.hGap2,
                    //     Text(r'$2373.00',
                    //         style: Theme.of(context).textTheme.button?.copyWith(
                    //             color: Colors.white, fontWeight: FontWeight.w500)),
                    //   ],
                    // ))),

                    const SliverToBoxAdapter(child: AppGaps.hGap32),
                    SliverToBoxAdapter(
                        child: Row(
                      children: [
                        Text(
                          LanguageHelper.currentLanguageText(
                              LanguageHelper.saveWithdrawMethodTransKey),
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        Text(
                          LanguageHelper.currentLanguageText(
                              LanguageHelper.addNewTransKey),
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    )),
                    const SliverToBoxAdapter(child: AppGaps.hGap32),

                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        /// Single payment Option
                        final paymentOption = FakeData.paymentOptions[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: PaymentOptionListTileWidget(
                            hasShadow:
                                controller.selectedPaymentOptionIndex == index,
                            onTap: () {
                              controller.selectedPaymentOptionIndex = index;
                            },
                            paymentIconWidget: paymentOption.paymentImage,
                            paymentName: paymentOption.name,
                            radioOnChange: (value) {
                              controller.selectedPaymentOptionIndex = index;
                            },
                            index: index,
                            selectedPaymentOptionIndex:
                                controller.selectedPaymentOptionIndex,
                          ),
                        );
                      },
                      childCount: FakeData.paymentOptions.length,
                    )),

                    const SliverToBoxAdapter(child: AppGaps.hGap32),
                    SliverToBoxAdapter(
                        child: Text(
                      LanguageHelper.currentLanguageText(
                          LanguageHelper.recentTransactionsTransKey),
                      style: Theme.of(context).textTheme.headlineMedium,
                    )),
                    const SliverToBoxAdapter(child: AppGaps.hGap16),
                    /* <---- Recent transaction list ----> */
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        /// Get recent transaction
                        final recentTransaction =
                            FakeData.recentTransactions[index];
                        return RecentTransactionWidget(
                            recentTransaction: recentTransaction);
                      },
                      childCount: FakeData.recentTransactions.length,
                    )),
                    // Bottom extra spaces
                    const SliverToBoxAdapter(child: AppGaps.hGap30),
                  ]),
                ),
                /* <-------- Bottom bar --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                  child: CustomStretchedTextButtonWidget(
                      buttonText: LanguageHelper.currentLanguageText(
                          LanguageHelper.withdrawTransKey),
                      onTap: () {
                        Get.put(controller.selectedPaymentOptionIndex);
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent.withOpacity(0.0),
                          builder: (BuildContext context) {
                            return deliveryFilter(context);
                          },
                        );
                      }),
                ),
              ),
            ));
  }

  ClipRRect deliveryFilter(BuildContext context) {
    return ClipRRect(
      // borderRadius: BorderRadius.circular(16),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.all(18),
                  // height: 290,
                  // width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.9),
                      )),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          width: 1.5,
                          color: Colors.white.withOpacity(0.8),
                        )),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    18.0, 0.0, 12, 0.0),
                                child: Text(
                                  LanguageHelper.currentLanguageText(
                                      LanguageHelper.withdrawTransKey),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                margin: const EdgeInsets.all(18),
                                height: 13,
                                width: 13,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        Image.asset(AppAssetImages.cross).image,
                                    //          xFit.fill
                                  ),
                                ),
                              )
                            ],
                          ),
                          AppGaps.hGap12,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 18),
                                child: Text(
                                  LanguageHelper.currentLanguageText(
                                      LanguageHelper
                                          .enterAmountToTransferTransKey),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),

                          AppGaps.hGap10,
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: TextFormFieldWidget(
                              labelText: ' ',
                              hintText: '  500',
                              prefixIcon: SvgPicture.asset(AppAssetImages.coin),
                            ),
                            // const TextField(
                            //   decoration: InputDecoration(
                            //     contentPadding: EdgeInsets.all(30),
                            //     //labelText: 'Enter your name',
                            //     hintText: r'Eg: $65',
                            //     // prefixIcon: Image.asset(AppAssetImages.coin).image,
                            //     border: OutlineInputBorder(),
                            //   ),
                            // ),
                          ),
                          AppGaps.hGap5,
                          // const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: const EdgeInsets.all(10),
                                  width: 290,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: CustomStretchedTextButtonWidget(
                                      buttonText:
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .sendToCardTransKey),
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          backgroundColor: Colors.transparent
                                              .withOpacity(0.0),
                                          builder: (BuildContext context) {
                                            return addAccountDelivery();
                                          },
                                        );
                                      }))
                            ],
                          ),
                          // const Spacer(),
                        ]),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  ClipRRect addAccountDelivery() {
    var selectedIndex = Get.find<int>();
    return ClipRRect(
      // borderRadius: BorderRadius.circular(16),
      child: DecoratedBox(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 24,
              spreadRadius: 20,
              color: Colors.black.withOpacity(0.2),
            )
          ]),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.all(18),
                height: 450,
                // width: 300,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white.withOpacity(0.9),
                    )),
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.2),
                      )),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.fromLTRB(18.0, 0.0, 12, 0.0),
                              child: Text(
                                LanguageHelper.currentLanguageText(
                                    LanguageHelper.addAccountTransKey),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              margin: const EdgeInsets.all(18),
                              height: 13,
                              width: 13,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      Image.asset(AppAssetImages.cross).image,
                                  //          xFit.fill
                                ),
                              ),
                            )
                          ],
                        ),

                        AppGaps.hGap5,
                        // const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 167,
                                // width: 300,
                                child: CustomScrollView(slivers: [
                                  SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      /// Single payment Option
                                      final paymentOption =
                                          FakeData.paymentOptions[index];
                                      // var _selectedPaymentOptionIndex=-1;
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16),
                                        child: PaymentOptionListTileWidget(
                                          hasShadow: selectedIndex == index,
                                          onTap: () {
                                            selectedIndex = index;
                                          },
                                          paymentIconWidget:
                                              paymentOption.paymentImage,
                                          paymentName: paymentOption.name,
                                          radioOnChange: (value) {
                                            selectedIndex = index;
                                          },
                                          index: index,
                                          selectedPaymentOptionIndex:
                                              selectedIndex,
                                        ),
                                      );
                                    },
                                    childCount: FakeData.paymentOptions.length,
                                  )),
                                ]),
                              ),
                            ),
                          ],
                        ),
                        // const Spacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(10),
                                width: 290,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: CustomStretchedTextButtonWidget(
                                    buttonText:
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.addCardTransKey),
                                    onTap: () {
                                      Get.toNamed(AppPageNames.addBankScreen);
                                    }))
                          ],
                        )
                      ]),
                ),
              ),
            ],
          )),
    );
  }
}
