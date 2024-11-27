import 'package:ecomikstoreapp/controller/products_screen_controller.dart';
import 'package:ecomikstoreapp/models/api_responses/auctions_response.dart';
import 'package:ecomikstoreapp/models/api_responses/products_response.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/models/screen_parameters/add_auction_2nd_screen_parameter.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/bid_screen_widget.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/products_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsScreenController>(
        init: ProductsScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Appbar --------> */
                appBar: CoreWidgets.appBarWidget(
                    hasBackButton: false,
                    screenContext: context,
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.myProductsTransKey))),

                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      switch (controller.currentTab) {
                        case ProductScreenTab.auctions:
                          return controller.auctionsPagingController.refresh();
                        case ProductScreenTab.products:
                          return controller.productsPagingController.refresh();
                        case ProductScreenTab.trash:
                          return controller.trashProductsPagingController
                              .refresh();
                      }
                    },
                    child: Column(
                      children: [
                        /* <---- Top extra spaces ----> */
                        AppGaps.hGap10,
                        /* <---- Search and filter button row ----> */
                        DecoratedBox(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /* <---- Product Active Auctions tab button ----> */
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    height: 48,
                                    child: Obx(() =>
                                        CustomTabToggleButtonWidget(
                                            text: LanguageHelper
                                                .currentLanguageText(
                                                    LanguageHelper
                                                        .auctionsTransKey),
                                            isSelected: controller.currentTab ==
                                                ProductScreenTab.auctions,
                                            onTap: () {
                                              controller.currentTab =
                                                  ProductScreenTab.auctions;
                                              controller.update();
                                            })),
                                  ),
                                ),
                              ),
                              AppGaps.wGap2,
                              /* <---- Product Won Auctions tab button ----> */
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    height: 48,
                                    child: Obx(() =>
                                        CustomTabToggleButtonWidget(
                                            text: LanguageHelper
                                                .currentLanguageText(
                                                    LanguageHelper
                                                        .newProductsTransKey),
                                            isSelected: controller.currentTab ==
                                                ProductScreenTab.products,
                                            onTap: () {
                                              controller.currentTab =
                                                  ProductScreenTab.products;
                                              controller.update();
                                            })),
                                  ),
                                ),
                              ),
                              AppGaps.wGap2,
                              /* <---- Product Won Auctions tab button ----> */
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    height: 48,
                                    child: Obx(() =>
                                        CustomTabToggleButtonWidget(
                                            text: 'Trash',
                                            isSelected: controller.currentTab ==
                                                ProductScreenTab.trash,
                                            onTap: () {
                                              controller.currentTab =
                                                  ProductScreenTab.trash;
                                              controller.update();
                                            })),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        AppGaps.hGap12,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /* <---- Search text field ----> */
                            Expanded(
                                child: TextFormFieldWidget(
                                    hasShadow: false,
                                    controller:
                                        controller.searchTextEditingController,
                                    onChanged:
                                        controller.onSearchTextEditOnChange,
                                    hintText:
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper
                                                .searchProductTransKey),
                                    prefixIcon: SvgPicture.asset(
                                        AppAssetImages.searchSVGLogoLine,
                                        color: AppColors.primaryColor))),
                          ],
                        ),
                        AppGaps.hGap5,
                        Obx(
                          () {
                            int index = 0;
                            switch (controller.currentTab) {
                              case ProductScreenTab.auctions:
                                index = 0;
                                break;
                              case ProductScreenTab.products:
                                index = 1;
                                break;
                              case ProductScreenTab.trash:
                                index = 2;
                                break;
                            }
                            return Expanded(
                              child: IndexedStack(index: index, children: [
                                PagedListView.separated(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 30),
                                  pagingController:
                                      controller.auctionsPagingController,
                                  builderDelegate: PagedChildBuilderDelegate<
                                      AuctionShortItem>(
                                    itemBuilder: (context, item, index) {
                                      final AuctionShortItem bid = item;
                                      return BidWidget(
                                        onTap: () async {
                                          await Get.toNamed(
                                              AppPageNames
                                                  .addActionSecondScreen,
                                              arguments:
                                                  AddAuction2ndScreenParameter(
                                                      productID: bid.product.id,
                                                      auction: bid));

                                          controller.productsPagingController
                                              .refresh();
                                          controller.auctionsPagingController
                                              .refresh();
                                        },
                                        startDateTime: bid.startDate,
                                        endDateTime: bid.endDate,
                                        name: bid.product.name,
                                        bidNumber: bid.bidNumber,
                                        // shortFrame: '',
                                        money: bid.currentPrice,
                                        categoryImageUrl: bid.product.image,
                                      );
                                    },
                                  ),
                                  separatorBuilder: (context, index) =>
                                      AppGaps.hGap16,
                                ),
                                PagedListView.separated(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 30),
                                  pagingController:
                                      controller.productsPagingController,
                                  builderDelegate:
                                      PagedChildBuilderDelegate<Product>(
                                    itemBuilder: (context, item, index) {
                                      final Product product = item;
                                      return ProductListTileWithOutOfStock(
                                          isDraft: product.isDraft,
                                          isOutOfStock: product.stockAvailable,
                                          productImageUrl: product.image,
                                          productName: product.name,
                                          price: product.currentPrice,
                                          productItemNumber:
                                              product.quantity.unitQuantity,
                                          onTap: () => controller
                                              .onProductItemTap(product),
                                          outOfStockGestureOnTap: () =>
                                              controller.outOfStockGestureOnTap(
                                                  product),
                                          outOfStockToggleOnTap: (value) =>
                                              controller.outOfStockToggleOnTap(
                                                  product),
                                          onTrashTap: () => controller
                                              .onProductMoveToTrashButtonTap(
                                                  product));
                                    },
                                  ),
                                  separatorBuilder: (context, index) =>
                                      AppGaps.hGap16,
                                ),
                                PagedListView.separated(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 30),
                                  pagingController:
                                      controller.trashProductsPagingController,
                                  builderDelegate:
                                      PagedChildBuilderDelegate<Product>(
                                    itemBuilder: (context, item, index) {
                                      final Product product = item;
                                      return TrashProductListTileWidget(
                                        productImageUrl: product.image,
                                        productName: product.name,
                                        price: product.currentPrice,
                                        onTap: () => controller
                                            .onProductItemTap(product),
                                        onRecoverTap: () => controller
                                            .onTrashProductRecoverButtonTap(
                                                product),
                                        onDeleteTap: () => controller
                                            .onTrashProductPermanentDeleteButtonTap(
                                                product),
                                      );
                                    },
                                  ),
                                  separatorBuilder: (context, index) =>
                                      AppGaps.hGap16,
                                )
                              ]),
                            );
                          },
                        ),

                        /* <---- Bottom extra spaces ----> */
                        // AppGaps.hGap30,
                      ],
                    ),
                  ),
                ),
                floatingActionButton: controller.currentTab ==
                        ProductScreenTab.trash
                    ? null
                    : Container(
                        height: 62,
                        width: 62,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            color: Colors.white),
                        child: FloatingActionButton.extended(
                          onPressed: () async {
                            switch (controller.currentTab) {
                              case ProductScreenTab.auctions:
                                await Get.toNamed(AppPageNames.addActionScreen);
                                break;
                              case ProductScreenTab.products:
                                await Get.toNamed(
                                    AppPageNames.addProduct1stScreen);
                                break;
                              default:
                            }
                            controller.productsPagingController.refresh();
                            controller.auctionsPagingController.refresh();
                            controller.trashProductsPagingController.refresh();
                          },
                          label: SvgPicture.asset(AppAssetImages.plusaction,
                              color: Colors.white, height: 24, width: 24),
                          // icon: SvgPicture.asset(AppAssetImages.plusaction,
                          //     color: Colors.white, height: 24, width: 24),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          backgroundColor: AppColors.primaryColor,
                        ),
                      ),
              ),
            ));
  }
}
