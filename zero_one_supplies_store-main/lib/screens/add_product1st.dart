import 'package:collection/collection.dart';
import 'package:ecomikstoreapp/controller/add_product_1st_screen_controller.dart';
import 'package:ecomikstoreapp/models/api_responses/child_categories_response.dart';
import 'package:ecomikstoreapp/models/api_responses/coupon_list_response.dart';
import 'package:ecomikstoreapp/models/api_responses/pickup_stations_response.dart';
import 'package:ecomikstoreapp/models/api_responses/product_add_subcategories_response.dart';
import 'package:ecomikstoreapp/models/api_responses/product_elements_response.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/models/local/product_details_attribute_ui.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/constants/app_text_styles.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/add_product_screen_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/products_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddProduct1stScreen extends StatelessWidget {
  const AddProduct1stScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProduct1stScreenController>(
      init: AddProduct1stScreenController(),
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
                titleWidget: Text(controller.appbarTitle)),
            /* <-------- Content --------> */
            body: CustomScaffoldBodyWidget(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Top extra spaces
                    AppGaps.hGap15,
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SectionHeaderTextWidget(
                              text: LanguageHelper.currentLanguageText(
                                  LanguageHelper.itemInfoTransKey)),
                          AppGaps.hGap24,
                          AppGaps.hGap24,
                          SectionHeaderTextWidget(
                            text: LanguageHelper.currentLanguageText(
                                LanguageHelper.imageTransKey),
                          ),
                          AppGaps.hGap16,
                          SingleImageUploadSectionWidget(
                              label: LanguageHelper.currentLanguageText(
                                  LanguageHelper.productImageTransKey),
                              imageURL: controller.productImageURL,
                              onImageUploadTap:
                                  controller.onUploadProductImageTap),
                          AppGaps.hGap24,
                          SingleImageUploadSectionWidget(
                              label: LanguageHelper.currentLanguageText(
                                  LanguageHelper.thumbnailImageTransKey),
                              imageURL: controller.thumbnailImageURL,
                              onImageUploadTap:
                                  controller.onUploadThumbnailImageTap),
                          AppGaps.hGap24,
                          MultiImageUploadSectionWidget(
                              label: LanguageHelper.currentLanguageText(
                                  LanguageHelper.galleryImageTransKey),
                              imageURLs: controller.galleryImageURLs,
                              onImageUploadTap:
                                  controller.onUploadAddGalleryImageTap,
                              onImageEditTap:
                                  controller.onUploadEditGalleryImageTap,
                              onImageDeleteTap:
                                  controller.onUploadDeleteGalleryImageTap),
                          AppGaps.hGap24,
                          /* <---- Item title ----> */
                          TextFormFieldWidget(
                            focusNode: controller.productNameFocusNode,
                            controller: controller.productNameController,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.productNameTransKey),
                            hintText:
                                '${LanguageHelper.currentLanguageText(LanguageHelper.exampleTransKey)}: Apple iPhone 12',
                          ),
                          AppGaps.hGap24,
                          /* <---- Product model ----> */
                          TextFormFieldWidget(
                            controller: controller.productModelController,
                            focusNode: controller.productModelFocusNode,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.productModelTransKey),
                            hintText: 'Product model name',
                          ),
                          AppGaps.hGap24,
                          DropdownButtonFormFieldWidget<ProductCondition>(
                            labelText: 'Product condition',
                            hintText: 'Choose product condition',
                            isLoading: controller.isElementsLoading.value,
                            items: ProductCondition.values,
                            value: controller.selectedProductCondition,
                            getItemText: (item) => item.viewableText,
                            onChanged: controller.onProductCategoryChange,
                          ),
                          AppGaps.hGap24,
                          /* <---- Brand name ----> */

                          Obx(() => DropdownButtonFormFieldWidget<
                                  ProductElementBrand>(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.brandNameTransKey),
                                textButton: AppLanguageTranslation
                                    .addNewBrandTransKey.toCurrentLanguage,
                                onAddButtonTap:
                                    controller.onAddNewBrandButtonTap,
                                hintText: 'Choose brand name',
                                isLoading: controller.isElementsLoading.value,
                                items: controller.brands,
                                value: controller.selectedBrand,
                                getItemText: (item) => item.name,
                                onChanged: controller.onBrandChange,
                              )),
                          AppGaps.hGap24,
                          /* <---- Item category ----> */
                          Obx(() => DropdownButtonFormFieldWidget<
                                  ProductElementCategory>(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.productCategoryTransKey),
                                hintText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.chooseCategoryTransKey),
                                isLoading: controller.isElementsLoading.value,
                                items: controller.categories,
                                value: controller.selectedCategory,
                                getItemText: (item) => item.name,
                                onChanged: controller.onCategoryChange,
                              )),
                          AppGaps.hGap24,
                          /* <---- Item subcategory ----> */
                          Obx(() => DropdownButtonFormFieldWidget<
                                  ProductElementSubcategory>(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.productSubcategoryTransKey),
                                hintText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.chooseSubCategoryTransKey),
                                items: controller.subcategories,
                                value: controller.selectedSubcategory,
                                isLoading:
                                    controller.isSubcategoryLoading.value,
                                getItemText: (item) => item.name,
                                onChanged: controller.onSubcategoryChange,
                              )),
                          AppGaps.hGap24,
                          Obx(() =>
                              DropdownButtonFormFieldWidget<ChildCategory>(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper
                                        .productChildCategoryTransKey),
                                hintText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.chooseChildCategoryTransKey),
                                items: controller.childCategories,
                                value: controller.selectedChildCategory,
                                isLoading:
                                    controller.isChildCategoriesLoading.value,
                                getItemText: (item) => item.name,
                                onChanged: controller.onChildCategoryChange,
                              )),
                          AppGaps.hGap24,
                          /* <---- Product unit ----> */
                          Obx(() =>
                              DropdownButtonFormFieldWidget<ProductElementUnit>(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.productUnitTransKey),
                                hintText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.chooseProductUnitTransKey),
                                isLoading: controller.isElementsLoading.value,
                                items: controller.units,
                                value: controller.selectedUnit,
                                getItemText: (item) => item.name,
                                onChanged: controller.onProductUnitChange,
                              )),
                          AppGaps.hGap24,
                          /* <---- Product tags ----> */
                          MultiItemedDropdownButtonWidget<ProductElementTag>(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.productTagsTransKey),
                            textButton: AppLanguageTranslation
                                .addNewBrandTransKey.toCurrentLanguage,
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.chooseTagsTransKey),
                            onAddButtonTap: controller.onAddNewTagButtonTap,
                            isLoading: controller.isElementsLoading.value,
                            items: controller.tags,
                            value: controller.selectedTag,
                            selectedItems: controller.selectedTags.toList(),
                            getItemText: (item) => item.name,
                            isEqual: (fromItem, toItem) {
                              return fromItem.id == toItem.id;
                            },
                            onItemDeleteButtonTap:
                                controller.onProductTagDeleteChange,
                            onChanged: controller.onProductTagsChange,
                          ),
                          AppGaps.hGap24,
                          SectionHeaderTextWidget(
                              text: LanguageHelper.currentLanguageText(
                                  LanguageHelper.quantityTransKey)),
                          AppGaps.hGap16,
                          TextFormFieldWidget(
                            controller: controller.unitQuantityController,
                            focusNode: controller.unitQuantityFocusNode,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.unitQuantityTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper
                                    .enterProductUnitQuantityTransKey),
                            textInputType: TextInputType.number,
                          ),
                          AppGaps.hGap24,
                          TextFormFieldWidget(
                            controller: controller.stockQuantityController,
                            focusNode: controller.stockQuantityFocusNode,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.stockQuantityTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper
                                    .enterProductStockQuantityTransKey),
                            textInputType: TextInputType.number,
                          ),
                          AppGaps.hGap24,
                          TextFormFieldWidget(
                            controller:
                                controller.minimumPurchaseQuantityController,
                            focusNode:
                                controller.minimumPurchaseQuantityFocusNode,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.minimumPurchaseQuantityTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper
                                    .enterMinimumPurchaseQuantityTransKey),
                            textInputType: TextInputType.number,
                          ),
                          AppGaps.hGap24,
                          TextFormFieldWidget(
                            controller: controller.stockAlertQuantityController,
                            focusNode: controller.stockAlertQuantityFocusNode,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.stockAlertQuantityTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.enterStockAlertQuantityTransKey),
                            textInputType: TextInputType.number,
                          ),
                          AppGaps.hGap24,
                          SectionHeaderTextWidget(
                              text: LanguageHelper.currentLanguageText(
                                  LanguageHelper.priceTransKey)),
                          AppGaps.hGap16,
                          TextFormFieldWidget(
                            controller: controller.priceController,
                            focusNode: controller.priceFocusNode,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.productPriceTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.enterProductPriceTransKey),
                            textInputType: TextInputType.number,
                          ),
                          AppGaps.hGap24,
                          const SectionHeaderTextWidget(
                              text: 'Quantity based price'),
                          AppGaps.hGap12,
                          ...controller.productQuantityBasedPriceUIs.mapIndexed(
                              (index, productQuantityBasedPriceUI) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFormFieldWidget(
                                                controller:
                                                    productQuantityBasedPriceUI
                                                        .minimumController,
                                                focusNode:
                                                    productQuantityBasedPriceUI
                                                        .minimumFocusNode,
                                                labelText: 'Minimum quantity',
                                                hintText:
                                                    'Enter minimum quantity',
                                                textInputType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                            AppGaps.wGap12,
                                            Expanded(
                                                child: TextFormFieldWidget(
                                              controller:
                                                  productQuantityBasedPriceUI
                                                      .maximumController,
                                              focusNode:
                                                  productQuantityBasedPriceUI
                                                      .maximumFocusNode,
                                              labelText: 'Maximum quantity',
                                              hintText:
                                                  'Enter maximum quantity',
                                              textInputType:
                                                  TextInputType.number,
                                            ))
                                          ],
                                        ),
                                        AppGaps.hGap8,
                                        TextFormFieldWidget(
                                          controller:
                                              productQuantityBasedPriceUI
                                                  .priceController,
                                          focusNode: productQuantityBasedPriceUI
                                              .priceFocusNode,
                                          labelText: 'Price',
                                          hintText: 'Enter price',
                                          textInputType: TextInputType.number,
                                        ),
                                        AppGaps.hGap12,
                                        TightTextIconButtonWidget(
                                            text: 'Delete',
                                            iconWidget: SvgPicture.asset(
                                              AppAssetImages.deleteSVGLogoLine,
                                              color: AppColors.alertColor,
                                            ),
                                            textStyle: const TextStyle(
                                                color: AppColors.alertColor),
                                            onTap: () => controller
                                                .onRemoveQuantityBasedPriceButtonTap(
                                                    index,
                                                    productQuantityBasedPriceUI)),
                                        AppGaps.hGap24,
                                      ])),
                          AppGaps.hGap12,
                          CustomStretcheOutlinedTextButtonWidget(
                            buttonText: 'Add a quantity based price',
                            onTap: controller.onAddQuantityBasedPriceButtonTap,
                          ),
                          AppGaps.hGap24,
                          TextFormFieldWidget(
                            controller: controller.discountController,
                            focusNode: controller.discountFocusNode,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.discountTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.enterDiscountValueTransKey),
                            textInputType: TextInputType.number,
                          ),
                          AppGaps.hGap24,
                          DropdownButtonFormFieldWidget<
                              ({String forView, String value})>(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.discountTypeTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.chooseDiscountTransKey),
                            // isLoading: controller.di.value,
                            items: controller.discountTypes,
                            value: controller.selectedDiscountType,
                            getItemText: (item) => item.forView,
                            onChanged: controller.onDiscountTypeChanged,
                          ),
                          AppGaps.hGap24,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: TextFormDatePickerWidget(
                                  textEditingController:
                                      controller.discountPriceStartController,
                                  initialDate:
                                      controller.discountPriceStartInitialDate,
                                  firstDate: DateTime.now()
                                      .copyWith(year: DateTime.now().year - 1),
                                  lastDate: DateTime.now()
                                      .copyWith(year: DateTime.now().year + 1),
                                  labelText: LanguageHelper.currentLanguageText(
                                      LanguageHelper
                                          .discountPriceStartDateTransKey),
                                  hintText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.selectStartDateTransKey),
                                  showDeleteButton:
                                      controller.discountPriceStartDateTime !=
                                          null,
                                  onDeleteButtonTap: controller
                                      .onDiscountStartDateDeleteButtonTap,
                                  onAfterPickDate: controller
                                      .onAfterDiscountStartDatePickDate,
                                  onError: (error) {
                                    controller
                                        .onDiscountStartDateDeleteButtonTap();
                                  },
                                ),
                              ),
                              AppGaps.wGap15,
                              Expanded(
                                  child: TextFormFieldWidget(
                                controller:
                                    controller.discountPriceStartTimeController,
                                focusNode:
                                    controller.discountPriceStartTimeFocusNode,
                                isReadOnly: true,
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.startTimeTransKey),
                                hintText: 'Select start time',
                                onTap: () => controller.onStartTimeTap(context),
                              )),
                            ],
                          ),
                          AppGaps.hGap24,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: TextFormDatePickerWidget(
                                  textEditingController:
                                      controller.discountPriceEndController,
                                  initialDate:
                                      controller.discountPriceEndInitialDate,
                                  firstDate:
                                      controller.discountPriceEndFirstDate,
                                  lastDate: DateTime.now().copyWith(
                                      year: DateTime.now().year + 1,
                                      month: DateTime.now().month,
                                      day: DateTime.now().day + 1),
                                  labelText: LanguageHelper.currentLanguageText(
                                      LanguageHelper
                                          .discountPriceEndDateTransKey),
                                  hintText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.selectEndDateTransKey),
                                  showDeleteButton:
                                      controller.discountPriceEndDateTime !=
                                          null,
                                  onDeleteButtonTap: controller
                                      .onDiscountEndDateDeleteButtonTap,
                                  onAfterPickDate:
                                      controller.onAfterDiscountEndDatePickDate,
                                  onError: (error) {
                                    controller
                                        .onDiscountEndDateDeleteButtonTap();
                                  },
                                ),
                              ),
                              AppGaps.wGap15,
                              Expanded(
                                  child: TextFormFieldWidget(
                                controller:
                                    controller.discountPriceEndTimeController,
                                focusNode:
                                    controller.discountPriceEndTimeFocusNode,
                                isReadOnly: true,
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.endTimeTransKey),
                                hintText: AppLanguageTranslation
                                    .endTimeTransKey.toCurrentLanguage,
                                onTap: () => controller.onEndTimeTap(context),
                              )),
                            ],
                          ),
                          AppGaps.hGap24,
                          MultiItemedDropdownButtonWidget<Coupon>(
                            labelText: 'Coupons',
                            textButton: 'Add',
                            hintText: 'Choose coupons',
                            onAddButtonTap: controller.onAddCouponButtonTap,
                            isLoading: controller.isElementsLoading.value,
                            items: controller.coupons,
                            value: controller.lastSelectedCoupons,
                            selectedItems: controller.selectedCoupons,
                            getItemText: (item) => item.code,
                            isEqual: (fromItem, toItem) {
                              return fromItem.id == toItem.id;
                            },
                            onItemDeleteButtonTap:
                                controller.onCouponDeleteChange,
                            onChanged: controller.onSelectCouponChange,
                          ),
                          AppGaps.hGap24,
                          SectionHeaderTextWidget(
                              text: LanguageHelper.currentLanguageText(
                                  LanguageHelper.descriptionTransKey)),
                          AppGaps.hGap16,
                          TextFormFieldWidget(
                            controller: controller.shortDescriptionController,
                            focusNode: controller.shortDescriptionFocusNode,
                            minLines: 2,
                            maxLines: 4,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.shortDescriptionTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.enterShortDescriptionTransKey),
                          ),
                          AppGaps.hGap24,
                          TextFormFieldWidget(
                            controller: controller.longDescriptionController,
                            focusNode: controller.longDescriptionFocusNode,
                            minLines: 3,
                            maxLines: 5,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.longDescriptionTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.enterLongDescriptionTransKey),
                          ),
                          AppGaps.hGap24,
                          SectionHeaderTextWidget(
                              text: LanguageHelper
                                  .selectAttributeTransKey.toCurrentLanguage),
                          AppGaps.hGap16,
                          ...controller.productAttributeUIs.mapIndexed((index,
                                  productAttributeUI) =>
                              Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    DropdownButtonFormFieldWidget<
                                        ProductElementAttribute>(
                                      labelText:
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .attributeNameTransKey),
                                      hintText:
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .selectAnAttributeTransKey),
                                      isLoading:
                                          controller.isElementsLoading.value,
                                      items: productAttributeUI.attributes,
                                      value:
                                          productAttributeUI.selectedAttribute,
                                      getItemText: (item) => item.name,
                                      onChanged: (item) async {
                                        productAttributeUI.selectedAttribute =
                                            item;
                                        if (item == null) {
                                          return;
                                        }
                                        productAttributeUI.isColorSelected =
                                            false;
                                        if (productAttributeUI
                                            .options.isEmpty) {
                                          productAttributeUI.options = [];
                                        }
                                        productAttributeUI.options.clear();
                                        controller.update();
                                        /* productAttributeUI.options.clear();
                                        productAttributeUI.options.addAll(
                                            productAttributeUI.selectedAttribute!.);
                                        controller.selectedAttributeValues
                                            .clear();
                                        controller.selectedAttributeValue =
                                            null;
                                        controller.update();
                                        controller.isAttributeValuesLoading
                                            .value = true;
                                        await Future.delayed(const Duration(
                                            milliseconds: 50));
                                        controller.update();
                                        controller.isAttributeValuesLoading
                                            .value = false;
                                        controller.update(); */
                                      },
                                    ),
                                    AppGaps.hGap8,
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: Checkbox(
                                              value: productAttributeUI
                                                  .isColorSelected,
                                              onChanged: (value) {
                                                productAttributeUI
                                                        .isColorSelected =
                                                    value ?? false;
                                                controller.update();
                                              }),
                                        ),
                                        AppGaps.wGap5,
                                        Text(AppLanguageTranslation
                                            .colorTransKey.toCurrentLanguage),
                                        const Spacer(),
                                        TightTextIconButtonWidget(
                                          text: AppLanguageTranslation
                                              .deleteTransKey.toCurrentLanguage,
                                          iconWidget: SvgPicture.asset(
                                              AppAssetImages.deleteSVGLogoLine,
                                              color: AppColors.alertColor),
                                          textStyle: const TextStyle(
                                              color: AppColors.alertColor),
                                          onTap: () {
                                            controller.productAttributeUIs
                                                .remove(productAttributeUI);
                                            controller.update();
                                          },
                                        )
                                      ],
                                    ),
                                    AppGaps.hGap16,
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right:
                                              AppGaps.screenPaddingValue * 2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: productAttributeUI.options
                                            .map((optionUI) => Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      DropdownButtonFormFieldWidget<
                                                          String>(
                                                        labelText:
                                                            AppLanguageTranslation
                                                                .optionTransKey
                                                                .toCurrentLanguage,
                                                        hintText: AppLanguageTranslation
                                                            .selectOptionTransKey
                                                            .toCurrentLanguage,
                                                        isLoading: controller
                                                            .isElementsLoading
                                                            .value,
                                                        items: optionUI.options,
                                                        value: optionUI
                                                            .selectedOption,
                                                        getItemText: (item) =>
                                                            item,
                                                        onChanged:
                                                            (item) async {
                                                          optionUI.selectedOption =
                                                              item;
                                                          if (item == null) {
                                                            return;
                                                          }
                                                          controller.update();
                                                        },
                                                      ),
                                                      if (productAttributeUI
                                                          .isColorSelected)
                                                        AppGaps.hGap12,
                                                      if (productAttributeUI
                                                          .isColorSelected)
                                                        TextFormFieldWidget(
                                                          controller: optionUI
                                                              .valueController,
                                                          focusNode: optionUI
                                                              .valueFocusNode,
                                                          labelText:
                                                              AppLanguageTranslation
                                                                  .colorTransKey
                                                                  .toCurrentLanguage,
                                                          hintText: AppLanguageTranslation
                                                              .colorHexCodeTransKey
                                                              .toCurrentLanguage,
                                                        ),
                                                      AppGaps.hGap12,
                                                      TextFormFieldWidget(
                                                        controller: optionUI
                                                            .priceController,
                                                        focusNode: optionUI
                                                            .priceFocusNode,
                                                        textInputType:
                                                            TextInputType
                                                                .number,
                                                        labelText:
                                                            AppLanguageTranslation
                                                                .priceTransKey
                                                                .toCurrentLanguage,
                                                        hintText: AppLanguageTranslation
                                                            .enterPriceTransKey
                                                            .toCurrentLanguage,
                                                      ),
                                                      AppGaps.hGap8,
                                                      TightTextIconButtonWidget(
                                                          text: AppLanguageTranslation
                                                              .deleteOptionTransKey
                                                              .toCurrentLanguage,
                                                          iconWidget: SvgPicture.asset(
                                                              AppAssetImages
                                                                  .deleteSVGLogoLine,
                                                              color: AppColors
                                                                  .alertColor),
                                                          textStyle: const TextStyle(
                                                              color: AppColors
                                                                  .alertColor),
                                                          onTap: () {
                                                            optionUI
                                                                .valueFocusNode
                                                                .removeListener(
                                                                    () {});
                                                            optionUI
                                                                .priceFocusNode
                                                                .removeListener(
                                                                    () {});
                                                            productAttributeUI
                                                                .options
                                                                .remove(
                                                                    optionUI);
                                                            controller.update();
                                                          }),
                                                      AppGaps.hGap16,
                                                    ]))
                                            .toList(),
                                      ),
                                    ),
                                    AppGaps.hGap16,
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right:
                                              AppGaps.screenPaddingValue * 2),
                                      child: CustomOutlinedButtonWidget(
                                          onTap: () {
                                            final priceController =
                                                TextEditingController();
                                            priceController.text =
                                                0.0.toString();
                                            if (productAttributeUI
                                                .options.isEmpty) {
                                              productAttributeUI.options = [];
                                            }

                                            final FocusNode valueFocusNode =
                                                FocusNode();
                                            valueFocusNode.addListener(() {
                                              if (valueFocusNode.hasFocus) {
                                                controller.updateDraft();
                                              }
                                            });
                                            final FocusNode priceFocusNode =
                                                FocusNode();
                                            priceFocusNode.addListener(() {
                                              if (priceFocusNode.hasFocus) {
                                                controller.updateDraft();
                                              }
                                            });
                                            productAttributeUI.options.add(
                                                ProductAttributeOptionUI(
                                                    options: productAttributeUI
                                                        .selectedAttribute
                                                        ?.attributes,
                                                    valueController:
                                                        TextEditingController(),
                                                    valueFocusNode:
                                                        valueFocusNode,
                                                    priceController:
                                                        priceController,
                                                    priceFocusNode:
                                                        priceFocusNode));
                                            controller.update();
                                          },
                                          child: Text(AppLanguageTranslation
                                              .addOptionTransKey
                                              .toCurrentLanguage)),
                                    ),
                                    AppGaps.hGap24,
                                  ])),
                          CustomStretcheOutlinedTextButtonWidget(
                            buttonText: AppLanguageTranslation
                                .addattributeTransKey.toCurrentLanguage,
                            onTap: () {
                              controller.productAttributeUIs.add(
                                  ProductAttributeUI(
                                      attributes: controller.attributes));
                              controller.update();
                            },
                          ),
                          AppGaps.hGap24,
                          SectionHeaderTextWidget(
                              text: LanguageHelper.currentLanguageText(
                                  LanguageHelper.selectAttributeTransKey)),
                          AppGaps.hGap16,
                          DropdownButtonFormFieldWidget<
                              ProductElementAttribute>(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.attributeNameTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.selectAnAttributeTransKey),
                            isLoading: controller.isElementsLoading.value,
                            items: controller.attributes,
                            value: controller.selectedAttribute,
                            getItemText: (item) => item.name,
                            onChanged: (item) async {
                              controller.selectedAttribute = item;
                              if (item == null) {
                                return;
                              }
                              controller.attributeValues.clear();
                              controller.attributeValues.addAll(
                                  controller.selectedAttribute!.attributes);
                              controller.selectedAttributeValues.clear();
                              controller.selectedAttributeValue = null;
                              controller.update();
                              controller.isAttributeValuesLoading.value = true;
                              await Future.delayed(
                                  const Duration(milliseconds: 50));
                              controller.update();
                              controller.isAttributeValuesLoading.value = false;
                              controller.updateDraft();
                              controller.update();
                            },
                          ),
                          AppGaps.hGap24,
                          Obx(() => MultiItemedDropdownButtonWidget<String>(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.attributeValuesTransKey),
                                hintText: LanguageHelper.currentLanguageText(
                                    LanguageHelper
                                        .selectAttributeValuesTransKey),
                                isLoading:
                                    controller.isAttributeValuesLoading.value,
                                items: controller.attributeValues,
                                value: controller.selectedAttributeValue,
                                selectedItems:
                                    controller.selectedAttributeValues.toList(),
                                getItemText: (item) => item,
                                isEqual: (fromItem, toItem) =>
                                    fromItem == toItem,
                                onItemDeleteButtonTap: (index, selectedItem) {
                                  controller.selectedAttributeValues
                                      .remove(selectedItem);
                                  controller.update();
                                },
                                onChanged: (String? item) {
                                  if (item == null) {
                                    return;
                                  }
                                  controller.selectedAttributeValues.add(item);
                                  controller.updateDraft();
                                  controller.update();
                                },
                              )),
                          AppGaps.hGap24,
                          SectionHeaderTextWidget(
                              text: LanguageHelper.currentLanguageText(
                                  LanguageHelper
                                      .productSpecificationsTransKey)),
                          AppGaps.hGap16,
                          TextFormFieldWidget(
                            controller:
                                controller.specificationDescriptionController,
                            focusNode:
                                controller.specificationDescriptionFocusNode,
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.descriptionTransKey),
                            hintText: LanguageHelper.currentLanguageText(
                                LanguageHelper.descriptionTransKey),
                            minLines: 2,
                            maxLines: 4,
                          ),
                          AppGaps.hGap24,
                          ...controller.specificationKeyValueControllers.map(
                            (specificationKeyValue) => Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormFieldWidget(
                                  controller:
                                      specificationKeyValue.keyController,
                                  focusNode: specificationKeyValue.keyFocusNode,
                                  labelText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.nameTransKey),
                                  hintText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.enterNameTransKey),
                                ),
                                AppGaps.hGap16,
                                TextFormFieldWidget(
                                  controller:
                                      specificationKeyValue.valueController,
                                  focusNode:
                                      specificationKeyValue.valueFocusNode,
                                  labelText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.valueTransKey),
                                  hintText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.enterValueTransKey),
                                ),
                                AppGaps.hGap10,
                                TightTextIconButtonWidget(
                                    text: LanguageHelper.currentLanguageText(
                                        LanguageHelper.deleteTransKey),
                                    iconWidget: SvgPicture.asset(
                                        AppAssetImages.deleteSVGLogoLine,
                                        color: AppColors.alertColor),
                                    textStyle: const TextStyle(
                                        color: AppColors.alertColor),
                                    onTap: () {
                                      controller
                                          .specificationKeyValueControllers
                                          .remove(specificationKeyValue);
                                      controller.update();
                                      controller.updateDraft();
                                    }),
                                AppGaps.hGap24,
                              ],
                            ),
                          ),
                          CustomOutlinedButtonWidget(
                              onTap: controller.onAddSpecificationButtonTap,
                              child: Text(LanguageHelper.currentLanguageText(
                                  LanguageHelper.addSpecificationTransKey))),
                          AppGaps.hGap24,
                          DropdownButtonFormFieldWidget<ProductLocation>(
                            labelText: 'Select product location',
                            hintText: 'Choose product location',
                            isRequired: true,
                            items: ProductLocation.list,
                            isLoading: controller.isProductLocationLoading,
                            value: controller.selectedProductLocation,
                            getItemText: (item) => item.viewableText,
                            onChanged: controller.onProductLocationChange,
                          ),
                          AppGaps.hGap24,
                          Builder(
                            builder: (context) {
                              switch (controller.selectedProductLocation) {
                                case ProductLocation.store:
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LabelWithRightTextButtonWidget(
                                        labelText: 'Store location',
                                        buttonText: 'Set location',
                                        onButtonTap: controller
                                            .onSetStoreLocationButtonTap,
                                      ),
                                      AppGaps.hGap5,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 20),
                                        decoration: const BoxDecoration(
                                            color: AppColors.backgroundColor,
                                            borderRadius:
                                                AppComponents.defaultBorder),
                                        child: Text(controller
                                                .vendorDetails
                                                .store
                                                .storeLocation
                                                .address
                                                .isEmpty
                                            ? 'No location set'
                                            : controller.vendorDetails.store
                                                .storeLocation.address),
                                      )
                                    ],
                                  );
                                default:
                                  return AppGaps.emptyGap;
                              }
                            },
                          ),
                          if (controller.selectedProductLocation ==
                              ProductLocation.pickupStations)
                            DropdownButtonFormFieldWidget<PickupStation>(
                              labelText: 'Select Pickup Station',
                              hintText: 'Choose Pickup Station',
                              items: controller.pickupStations,
                              value: controller.selectedPickupStation,
                              getItemText: (item) => item.name,
                              onChanged: controller.onSelectPickupStations,
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
                child: CustomStretchedTextButtonWidget(
              buttonText: LanguageHelper.currentLanguageText(
                  LanguageHelper.nextTransKey),
              onTap: controller.onNextButtonTap,
            )),
          )),
    );
  }
}
