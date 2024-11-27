import 'package:ecomikstoreapp/controller/add_product_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  /// Toggle value of out of stock of the new product

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductScreenController>(
        init: AddProductScreenController(),
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
                        LanguageHelper.addProductTransKey))),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top extra spaces
                        AppGaps.hGap15,
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  /* <---- Product picture ----> */
                                  const CircleAvatar(
                                    backgroundColor: AppColors.lineShapeColor,
                                    radius: 64,
                                  ),
                                  /* <---- Small camera circle icon button ----> */
                                  Positioned(
                                      bottom: 7,
                                      right: -3,
                                      child: IconButton(
                                        onPressed: () {},
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(
                                            minHeight: 34, minWidth: 34),
                                        icon: Container(
                                          height: 34,
                                          width: 34,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.primaryColor,
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: SvgPicture.asset(
                                            AppAssetImages.cameraSVGLogoSolid,
                                            height: 14,
                                            width: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              AppGaps.hGap18,
                              /* <---- Out of stock toggle button of the row ----> */
                              GestureDetector(
                                onTap: () {
                                  controller.isOutOfStock.value =
                                      !controller.isOutOfStock.value;
                                  controller.update();
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      LanguageHelper.currentLanguageText(
                                          LanguageHelper.outOfStockTransKey),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: AppColors.bodyTextColor,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    AppGaps.wGap8,
                                    /* <---- Out of stock toggle button ----> */
                                    Obx(() => FlutterSwitch(
                                          value: controller.isOutOfStock.value,
                                          width: 35,
                                          height: 20,
                                          toggleSize: 12,
                                          activeColor: AppColors.primaryColor,
                                          onToggle: (value) {
                                            controller.isOutOfStock.value =
                                                value;
                                            controller.update();
                                          },
                                        )),
                                  ],
                                ),
                              ),
                              AppGaps.hGap32,
                              CustomHorizontalDashedLineWidget(
                                  color: AppColors.darkColor.withOpacity(0.1)),
                              AppGaps.hGap32,
                              Row(
                                children: [
                                  Text(
                                      LanguageHelper.currentLanguageText(
                                          LanguageHelper.itemInfoTransKey),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                              color: AppColors.primaryColor)),
                                ],
                              ),
                              AppGaps.hGap24,
                              /* <---- Product name ----> */
                              TextFormFieldWidget(
                                  labelText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.itemTitleTransKey),
                                  hintText: 'Item name here',
                                  prefixIcon: AppGaps.emptyGap),
                              AppGaps.hGap24,
                              /* <---- Product category ----> */
                              TextFormFieldWidget(
                                isReadOnly: true,
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.productCategoryTransKey),
                                hintText: 'Choose category',
                                prefixIcon: AppGaps.emptyGap,
                                suffixIcon: PopupMenuButton<int>(
                                    padding: const EdgeInsets.only(right: 5),
                                    position: PopupMenuPosition.under,
                                    child: CustomIconButtonWidget(
                                      fixedSize: const Size(20, 20),
                                      child: SvgPicture.asset(
                                          AppAssetImages.arrowDownSVGLogoLine,
                                          height: 12,
                                          color: AppColors.primaryColor),
                                    ),
                                    itemBuilder: (context) => [
                                          const PopupMenuItem<int>(
                                            value: 0,
                                            child: Text(
                                              'Headphone',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const PopupMenuItem<int>(
                                            value: 1,
                                            child: Text(
                                              'Camera',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const PopupMenuItem<int>(
                                            value: 2,
                                            child: Text(
                                              'Electronics',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ]),
                              ),
                              AppGaps.hGap24,
                              /* <---- Product price and stock ----> */
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormFieldWidget(
                                        labelText:
                                            LanguageHelper.currentLanguageText(
                                                LanguageHelper
                                                    .itemPriceTransKey),
                                        hintText: '0.00',
                                        prefixIcon: const Text(r'$')),
                                  ),
                                  AppGaps.wGap16,
                                  Expanded(
                                    child: TextFormFieldWidget(
                                        labelText:
                                            LanguageHelper.currentLanguageText(
                                                LanguageHelper.stockTransKey),
                                        hintText: '0',
                                        prefixIcon: AppGaps.emptyGap),
                                  ),
                                ],
                              ),
                              AppGaps.hGap24,
                              Row(
                                children: [
                                  CustomTightTextButtonWidget(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                              AppAssetImages.plusSVGLogoSolid,
                                              color: AppColors.primaryColor),
                                          AppGaps.wGap4,
                                          Text(LanguageHelper
                                              .currentLanguageText(
                                                  LanguageHelper
                                                      .addMoreOptionsTransKey)),
                                        ],
                                      )),
                                ],
                              ),
                              // Bottom extra spaces
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
                    child: CustomStretchedButtonWidget(
                  onTap: () {},
                  child: Text(LanguageHelper.currentLanguageText(
                      LanguageHelper.addProductTransKey)),
                )),
              ),
            ));
  }
}
