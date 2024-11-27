import 'package:ecomikstoreapp/controller/brand_controller.dart';
import 'package:ecomikstoreapp/models/api_responses/brand_list_api_response.dart';
import 'package:ecomikstoreapp/utils/constants/app_gaps.dart';
import 'package:ecomikstoreapp/utils/constants/app_images.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/brand_list_widget.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BrandsScreenController>(
        init: BrandsScreenController(),
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
                        LanguageHelper.brandListTransKey))),
                body: CustomScaffoldBodyWidget(
                    child: RefreshIndicator(
                  onRefresh: () async =>
                      controller.brandListPagingController.refresh(),
                  child: CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(
                        child: AppGaps.hGap15,
                      ),
                      PagedSliverList.separated(
                          pagingController:
                              controller.brandListPagingController,
                          builderDelegate:
                              PagedChildBuilderDelegate<BrandListItem>(
                                  itemBuilder: (context, item, index) {
                            final BrandListItem brand = item;
                            return BrandListWidget(
                              isAdded: brand.isAdded,
                              label: brand.active,
                              onToggle: (value) =>
                                  controller.toggleChanges(value, brand),
                              onEditTap: () => controller.onEditTab(brand),
                              value: brand.active,
                              brandName: brand.name,
                              image: brand.image,
                            );
                          }),
                          separatorBuilder: (context, index) => AppGaps.hGap24)
                    ],
                  ),
                )),
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                    child: CustomStretchedTextButtonWidget(
                  buttonText: LanguageHelper.currentLanguageText(
                      LanguageHelper.addNewBrandTransKey),
                  onTap: controller.onAddNewButtonTab,
                )),
              ),
            ));
  }
}
