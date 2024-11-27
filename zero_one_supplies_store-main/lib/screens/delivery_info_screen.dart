import 'package:ecomikstoreapp/controller/deliveryinfo_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryInfoScreen extends StatelessWidget {
  const DeliveryInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryInfoScreenController>(
        init: DeliveryInfoScreenController(),
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
                        LanguageHelper.deliveryInfoTransKey))),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                    child: CustomScrollView(
                  slivers: [
                    // Top extra spaces
                    const SliverToBoxAdapter(child: AppGaps.hGap15),
                    SliverToBoxAdapter(
                        child: Text(
                            LanguageHelper.currentLanguageText(
                                LanguageHelper.itemsTransKey),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: AppColors.primaryColor))),
                    const SliverToBoxAdapter(child: AppGaps.hGap16),
                    /* <---- Delivery product list ----> */
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        /// Single my order
                        final product = controller.orderDetails.products[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: CustomListTileWidget(
                              hasShadow: true,
                              paddingValue: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  /* <---- Product image ----> */
                                  SizedBox(
                                    height: 48,
                                    width: 48,
                                    child: CachedNetworkImageWidget(
                                      imageURL: product.image,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ),
                                  AppGaps.wGap16,
                                  /* <---- Order name and items number----> */
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        AppGaps.hGap5,
                                        Text(
                                          '${product.quantity} items',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color:
                                                      AppColors.bodyTextColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppGaps.wGap5,
                                  /* <---- Price text ----> */
                                  Text(
                                    Helper.getCurrencyFormattedAmountText(
                                        product.price),
                                    // '\$${product.price}',
                                    style: const TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )),
                        );
                      },
                      childCount: controller.orderDetails.products.length,
                    )),
                    const SliverToBoxAdapter(child: AppGaps.hGap24),
                    // const SliverToBoxAdapter(
                    //     child: Text('Notes',
                    //         style: TextStyle(fontWeight: FontWeight.w500))
                    //         ),
                    // const SliverToBoxAdapter(child: AppGaps.hGap15),
                    /* <---- Notes text field ----> */
                    // SliverToBoxAdapter(
                    //     child: CustomTextFormField(
                    //         minLines: 1,
                    //         maxLines: 3,
                    //         hintText: 'Notes for user',
                    //         prefixIcon: SvgPicture.asset(AppAssetImages.editSVGLogoLine,
                    //             color: AppColors.bodyTextColor))),
                    // const SliverToBoxAdapter(child: AppGaps.hGap24),
                    SliverToBoxAdapter(
                        child: Text(
                            LanguageHelper.currentLanguageText(
                                LanguageHelper.paymentInfoTransKey),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: AppColors.primaryColor))),
                    const SliverToBoxAdapter(child: AppGaps.hGap8),
                    /* <---- Payment info box ----> */
                    SliverToBoxAdapter(
                        child: Container(
                            padding: const EdgeInsets.fromLTRB(19, 15, 13, 17),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    AppComponents.defaultBorderRadius)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
/*                                 OrderCostRowWidget(
                                    label: LanguageHelper.currentLanguageText(
                                        LanguageHelper.subTotalTransKey),
                                    amount: controller.orderDetails.subtotal),
                                AppGaps.hGap16,
                                const CustomHorizontalDashedLineWidget(
                                    color: AppColors.lineShapeColor),
                                AppGaps.hGap16,
                                OrderCostRowWidget(
                                    label: LanguageHelper.currentLanguageText(
                                        LanguageHelper.discountTransKey),
                                    amount: controller.orderDetails.discount),
                                AppGaps.hGap16,
                                const CustomHorizontalDashedLineWidget(
                                    color: AppColors.lineShapeColor),
                                AppGaps.hGap16,
                                OrderCostRowWidget(
                                    label: 'Vat',
                                    amount: controller.orderDetails.vat),
                                AppGaps.hGap16,
                                const CustomHorizontalDashedLineWidget(
                                    color: AppColors.lineShapeColor),
                                AppGaps.hGap16,
                                OrderCostRowWidget(
                                    label: 'Delivery',
                                    amount: controller
                                        .orderDetails.delivery.amount),
                                AppGaps.hGap16,
                                const CustomHorizontalDashedLineWidget(
                                    color: AppColors.lineShapeColor),
                                AppGaps.hGap16, */
                                OrderCostRowWidget(
                                    label: LanguageHelper.currentLanguageText(
                                        LanguageHelper.totalTransKey),
                                    amount: controller.orderDetails.total),
                              ],
                            ))),
                    // Bottom extra spaces
                    const SliverToBoxAdapter(child: AppGaps.hGap30),
                  ],
                )),
                /* <-------- Bottom bar --------> */
/*                 bottomNavigationBar: CustomScaffoldBottomBarWidget(
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
                                  Text(
                                    LanguageHelper.currentLanguageText(
                                        LanguageHelper
                                            .deliveryPartnerAssignedTransKey),
                                    style: const TextStyle(
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
                                LanguageHelper.readyToDeliverTransKey),
                            onTap: () {
                              // Go to delivery info map screen
                              Get.toNamed(AppPageNames.deliveryInfoMapScreen);
                            })
                      ],
                    )), */
              ),
            ));
  }
}

class OrderCostRowWidget extends StatelessWidget {
  final String label;
  final double amount;
  const OrderCostRowWidget(
      {super.key, required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        Text(
          Helper.getCurrencyFormattedAmountText(amount),
          style: const TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
