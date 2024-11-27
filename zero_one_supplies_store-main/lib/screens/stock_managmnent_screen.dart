import 'dart:ui';

import 'package:ecomikstoreapp/controller/stock_management_controller.dart';
import 'package:ecomikstoreapp/controller/update_dialog_stock_management_controller.dart';
import 'package:ecomikstoreapp/models/fake_data.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/stockManagement_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum RadioButton { Add, Remove, Null }

class StockManagementScreen extends StatelessWidget {
  const StockManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StockManagementScreenController>(
        init: StockManagementScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Appbar --------> */
                appBar: CoreWidgets.appBarWidget(
                    hasBackButton: true,
                    screenContext: context,
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.stockManagementTransKey))),

                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: CustomScrollView(
                    slivers: [
                      /* <---- Top extra spaces ----> */
                      const SliverToBoxAdapter(child: AppGaps.hGap10),
                      /* <---- Search and filter button row ----> */
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final stock = FakeData.stockManagement[index];
                          return SliverListItemWidget(
                            itemWidget: CustomTightTextButtonWidget(
                              child: StoreManagementWidget(
                                productName: stock.productName,
                                productImageUrl: stock.productImageUrl,
                                price: stock.price,
                                productCount: stock.productCount,
                                colorNames: stock.colorNames,
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor:
                                      Colors.transparent.withOpacity(0.0),
                                  builder: (BuildContext context) {
                                    return UpdateStockDialogWidget(
                                        productCount: stock.productCount);
                                  },
                                );
                              },
                            ),
                            dividerWidget: AppGaps.hGap16,
                            currentIndex: index,
                            listLength: FakeData.stockManagement.length,
                          );
                        },
                        childCount: FakeData.stockManagement.length,
                      )),
                      const SliverToBoxAdapter(child: AppGaps.hGap24),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class UpdateStockDialogWidget extends StatelessWidget {
  final int productCount;
  const UpdateStockDialogWidget({
    this.productCount = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateDialogScreenController>(
        init: UpdateDialogScreenController(),
        global: false,
        initState: (state) {
          Get.create<int>(() => productCount, tag: 'productCount');
        },
        builder: (controller) {
          // controller.productCount = productCount;
          return Container(
            margin: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.1, sigmaY: 5.1),
                child: Stack(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withOpacity(0.5),
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
                                  child: const Text(
                                    'Beats AJ504 Green Airpod',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  child: Container(
                                    margin: const EdgeInsets.all(18),
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: Image.asset(AppAssetImages.cross)
                                            .image,
                                        //          xFit.fill
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.back();
                                  },
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
                                        LanguageHelper.currentStockTransKey),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                    margin: const EdgeInsets.only(right: 18),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5,
                                            color: AppColors.primaryColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Text('$productCount')),
                              ],
                            ),

                            AppGaps.hGap12,

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 18),
                                  child: Text(
                                    '${LanguageHelper.currentLanguageText(LanguageHelper.quantityTransKey)} : ',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  margin: const EdgeInsets.only(right: 18),
                                  child: PlusMinusCounterRow(
                                      counterText: '${controller.productCount}',
                                      onRemoveTap: () {
                                        if (controller.productCount > 0) {
                                          controller.productCount--;
                                          controller.update();
                                        }
                                      },
                                      onAddTap: () {
                                        controller.productCount++;
                                        controller.update();
                                      }),
                                ),
                              ],
                            ),
                            AppGaps.hGap24,

                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 18),
                                  child: Text(
                                    '${LanguageHelper.currentLanguageText(LanguageHelper.typeTransKey)}:',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  margin: const EdgeInsets.only(right: 18),
                                  child: Row(
                                    children: [
                                      CustomRadioWidget(
                                          value: true,
                                          groupValue:
                                              controller.stockQuantityType,
                                          onChanged: (Value) {
                                            controller.stockQuantityType = true;
                                            controller.update();
                                          }),
                                      AppGaps.wGap8,
                                      const Text('Add '),
                                      AppGaps.wGap16,
                                      CustomRadioWidget(
                                          value: false,
                                          groupValue:
                                              controller.stockQuantityType,
                                          onChanged: (Value) {
                                            controller.stockQuantityType =
                                                false;
                                            controller.update();
                                          }),
                                      AppGaps.wGap8,
                                      Text(LanguageHelper.currentLanguageText(
                                          LanguageHelper.subtractTransKey)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            AppGaps.hGap20,
                            // const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 62,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: CustomStretchedTextButtonWidget(
                                          buttonText: LanguageHelper
                                              .currentLanguageText(
                                                  LanguageHelper
                                                      .updateInfoTransKey),
                                          onTap: () {})),
                                )
                              ],
                            ),
                            // const Spacer(),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
