import 'package:ecomikstoreapp/controller/order_screen_controller.dart';
import 'package:ecomikstoreapp/models/api_responses/all_orders_response.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/my_orders_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenController>(
        init: OrderScreenController(),
        builder: (controller) => Scaffold(
              /* <-------- Appbar --------> */
              appBar: CoreWidgets.appBarWidget(
                  screenContext: context,
                  hasBackButton: false,
                  titleWidget: Text(controller.isPastOrderSelected.value
                      ? LanguageHelper.currentLanguageText(
                          LanguageHelper.pastOrdersTransKey)
                      : LanguageHelper.currentLanguageText(
                          LanguageHelper.newOrdersTransKey))),
              /* <-------- Content --------> */
              body: CustomScaffoldBodyWidget(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top extra spaces
                    AppGaps.hGap10,
                    /* <---- 'New orders' and 'Past orders' tab button ----> */
                    Container(
                      height: 82,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(22))),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /* <---- Product review tab button ----> */
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomTabToggleButtonWidget(
                                  text: LanguageHelper.currentLanguageText(
                                      LanguageHelper.newOrdersTransKey),
                                  isSelected:
                                      !controller.isPastOrderSelected.value,
                                  onTap: () {
                                    controller.isPastOrderSelected.value =
                                        false;
                                    controller.update();
                                    controller.ordersPagingController.refresh();
                                  }
                                  // )
                                  ),
                            ),
                          ),
                          AppGaps.wGap5,
                          /* <---- Product description tab button ----> */
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomTabToggleButtonWidget(
                                  text: LanguageHelper.currentLanguageText(
                                      LanguageHelper.pastOrdersTransKey),
                                  isSelected:
                                      controller.isPastOrderSelected.value,
                                  onTap: () {
                                    controller.isPastOrderSelected.value = true;
                                    controller.update();
                                    controller.ordersPagingController.refresh();
                                  }
                                  // )
                                  ),
                            ),
                          )
                        ],
                      ),
                    ),
                    /* <---- Order list ----> */
                    Expanded(
                        child: RefreshIndicator(
                      onRefresh: () async =>
                          controller.ordersPagingController.refresh(),
                      child: PagedListView.separated(
                        pagingController: controller.ordersPagingController,
                        padding: const EdgeInsets.only(top: 16, bottom: 30),
                        separatorBuilder: (context, index) => AppGaps.hGap16,
                        builderDelegate: CoreWidgets.pagedChildBuilderDelegate<
                                StoreOrder>(
                            noItemFoundIndicatorBuilder: (context) => Center(
                                child: Text(LanguageHelper.currentLanguageText(
                                    LanguageHelper.noOrderFoundTransKey))),
                            itemBuilder: (context, item, index) {
                              /// Single order
                              final myOrder = item;
                              return CustomListTileWidget(
                                  paddingValue: const EdgeInsets.all(16),
                                  onTap: () {
                                    // Tapping on it goes to order status screen
                                    Get.toNamed(AppPageNames.deliveryInfoScreen,
                                        arguments: myOrder.id);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: CachedNetworkImageWidget(
                                          imageURL: myOrder.product.image,
                                          boxFit: BoxFit.cover,
                                        ),
                                      ),
                                      AppGaps.wGap16,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    myOrder.product.name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                AppGaps.hGap5,
                                                Text(
                                                  '\$${myOrder.total}',
                                                  style: const TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                            AppGaps.hGap8,
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    myOrder.date,
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                ),
                                                AppGaps.hGap5,
                                                Text(
                                                  LanguageHelper
                                                      .currentLanguageText(
                                                          LanguageHelper
                                                              .cashOnDeliveryTransKey),
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: AppColors
                                                          .bodyTextColor),
                                                ),
                                              ],
                                            ),
                                            AppGaps.hGap8,
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Order num: ${myOrder.orderNumber}',
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    /* const Text(
                                                      'Item 3',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ), */
                                                    // AppGaps.wGap36,
                                                    OrderStatusWidget(
                                                        orderStatus:
                                                            myOrder.status),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ));
                            }),
                      ),
                    )),
                  ],
                ),
              ),
            ));
  }
}
