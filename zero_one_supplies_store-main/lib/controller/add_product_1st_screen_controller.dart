import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:ecomikstoreapp/models/api_responses/add_product_initial_response.dart';
import 'package:ecomikstoreapp/models/api_responses/child_categories_response.dart';
import 'package:ecomikstoreapp/models/api_responses/coupon_list_response.dart';
import 'package:ecomikstoreapp/models/api_responses/pickup_stations_response.dart';
import 'package:ecomikstoreapp/models/api_responses/product_add_subcategories_response.dart';
import 'package:ecomikstoreapp/models/api_responses/product_details_response.dart';
import 'package:ecomikstoreapp/models/api_responses/product_elements_response.dart';
import 'package:ecomikstoreapp/models/api_responses/single_image_upload_response.dart';
import 'package:ecomikstoreapp/models/api_responses/vendor_with_store_details_response.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/models/local/product_add_details/product_add_details.dart';
import 'package:ecomikstoreapp/models/local/product_details_attribute_ui.dart';
import 'package:ecomikstoreapp/models/local/product_quantity_based_price_ui.dart';
import 'package:ecomikstoreapp/models/ui/product_specification_ui.dart';
import 'package:ecomikstoreapp/screens/bottom_sheet_screens/add_tags_bottomsheet.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/extensions/int.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct1stScreenController extends GetxController {
  // Variables
  bool dataLoaded = false;
  String productID = '';
  String productImageURL = '';
  String thumbnailImageURL = '';
  List<String> galleryImageURLs = [];
  TextEditingController productNameController = TextEditingController();
  TextEditingController unitQuantityController = TextEditingController();
  TextEditingController stockQuantityController = TextEditingController();
  TextEditingController minimumPurchaseQuantityController =
      TextEditingController();
  TextEditingController stockAlertQuantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController productModelController = TextEditingController();
  TextEditingController discountPriceStartController = TextEditingController();
  TextEditingController discountPriceStartTimeController =
      TextEditingController();
  TextEditingController discountPriceEndController = TextEditingController();
  TextEditingController discountPriceEndTimeController =
      TextEditingController();
  TextEditingController shortDescriptionController = TextEditingController();
  TextEditingController longDescriptionController = TextEditingController();
  TextEditingController specificationDescriptionController =
      TextEditingController();
  List<PickupStation> pickupStations = const [];
  PickupStation? selectedPickupStation;
  FocusNode productNameFocusNode = FocusNode();
  FocusNode unitQuantityFocusNode = FocusNode();
  FocusNode stockQuantityFocusNode = FocusNode();
  FocusNode minimumPurchaseQuantityFocusNode = FocusNode();
  // FocusNode minimumFocusNode = FocusNode();
  // FocusNode maximumFocusNode = FocusNode();
  FocusNode stockAlertQuantityFocusNode = FocusNode();
  FocusNode priceFocusNode = FocusNode();
  FocusNode quantityBasePriceFocusNode = FocusNode();
  FocusNode discountFocusNode = FocusNode();
  FocusNode productModelFocusNode = FocusNode();
  FocusNode discountPriceStartFocusNode = FocusNode();
  FocusNode discountPriceStartTimeFocusNode = FocusNode();
  FocusNode discountPriceEndFocusNode = FocusNode();
  FocusNode discountPriceEndTimeFocusNode = FocusNode();
  FocusNode shortDescriptionFocusNode = FocusNode();
  FocusNode longDescriptionFocusNode = FocusNode();
  FocusNode specificationDescriptionFocusNode = FocusNode();
  // FocusNode optionUIValueFocusNode = FocusNode();
  // FocusNode optionUIPriceFocusNode = FocusNode();
  FocusNode specificationKeyFocusNode = FocusNode();
  FocusNode specificationValueFocusNode = FocusNode();
  // List<
  //     ({
  //       String id,
  //       TextEditingController keyController,
  //       TextEditingController valueController
  //     })> specificationKeyValueControllers = [];
  List<ProductSpecificationUI> specificationKeyValueControllers = [];
  ProductCondition? selectedProductCondition;
  final RxList<ProductElementBrand> brands = <ProductElementBrand>[].obs;
  ProductElementBrand? selectedBrand;
  final RxList<ProductElementCategory> categories =
      <ProductElementCategory>[].obs;
  ProductElementCategory? selectedCategory;
  final RxList<ProductElementSubcategory> subcategories =
      <ProductElementSubcategory>[].obs;
  ProductElementSubcategory? selectedSubcategory;
  final RxList<ChildCategory> childCategories = <ChildCategory>[].obs;
  ChildCategory? selectedChildCategory;
  final RxList<ProductElementUnit> units = <ProductElementUnit>[].obs;
  ProductElementUnit? selectedUnit;
  final RxList<ProductElementTag> tags = <ProductElementTag>[].obs;
  // final List<ProductElementTag> selectedTags = [];
  final Set<ProductElementTag> selectedTags = {};
  ProductElementTag? selectedTag;
  RxBool isElementsLoading = false.obs;
  RxBool isSubcategoryLoading = false.obs;
  RxBool isChildCategoriesLoading = false.obs;
  RxBool isAttributeValuesLoading = false.obs;
  ProductAddDetails productAddDetails = ProductAddDetails.empty();
  final List<({String forView, String value})> discountTypes = [
    (value: 'percentage', forView: 'Percentage'),
    (value: 'flat', forView: 'Flat')
  ];
  ({String forView, String value})? selectedDiscountType;
  DateTime? discountPriceStartDateTime;
  DateTime? discountPriceEndDateTime;
  final List<ProductElementAttribute> attributes = [];
  ProductElementAttribute? selectedAttribute;
  final List<String> attributeValues = <String>[];
  String? selectedAttributeValue;
  final Set<String> selectedAttributeValues = {};
  List<ProductAttributeUI> productAttributeUIs = [];
  List<ProductQuantityBasedPriceUI> productQuantityBasedPriceUIs = [];
  List<Coupon> coupons = [];
  List<Coupon> selectedCoupons = [];
  Coupon? lastSelectedCoupons;
  VendorDetails vendorDetails = Helper.getVendor();
  ProductLocation? selectedProductLocation;
  bool _isProductLocationLoading = false;
  bool get isProductLocationLoading => _isProductLocationLoading;
  set isProductLocationLoading(bool value) {
    _isProductLocationLoading = value;
    update();
  }

  // Getters
  bool get shouldUpdateDraft {
    if (selectedProductLocation == ProductLocation.pickupStations &&
        selectedPickupStation == null) {
      return false;
    }
    return true;
  }

  // Functions
  void onSelectPickupStations(PickupStation? pickupStation) {
    if (pickupStation == null) {
      return;
    }
    selectedPickupStation = pickupStation;
    updateDraft();
    update();
  }

  void onSelectCouponChange(Coupon? coupon) {
    if (coupon == null) {
      return;
    }
    final Coupon? foundExistingCoupon =
        selectedCoupons.firstWhereOrNull((element) => element.id == coupon.id);
    if (foundExistingCoupon != null) {
      // selectedCoupons.remove(foundExistingCoupon);
    } else {
      selectedCoupons.add(coupon);
    }
    updateDraft();
    update();
  }

  void onCouponDeleteChange(int index, Coupon? selectedItem) {
    selectedCoupons.remove(selectedItem);
    updateDraft();
    update();
  }

  void onUploadProductImageTap() {
    Helper.pickImage(
        onSuccessUploadSingleImage: _onSuccessUploadProductImage,
        imageName: 'Product image');
  }

  void _onSuccessUploadProductImage(
      SingleImageUploadResponse response, Map<String, dynamic> additionalData) {
    productImageURL = response.data;
    update();
    Helper.showSnackBar('Successfully uploaded product image');
    updateDraft();
  }

  void onUploadThumbnailImageTap() {
    Helper.pickImage(
        onSuccessUploadSingleImage: _onSuccessOnUploadThumbnailImageTap,
        imageName: 'Thumbnail image');
  }

  void _onSuccessOnUploadThumbnailImageTap(
      SingleImageUploadResponse response, Map<String, dynamic> additionalData) {
    thumbnailImageURL = response.data;
    update();
    Helper.showSnackBar('Successfully uploaded thumbnail image');
    updateDraft();
  }

  void onUploadAddGalleryImageTap() {
    Helper.pickImage(
        onSuccessUploadSingleImage: _onSuccessOnUploadAddGalleryImageTap,
        imageName: 'Gallery image');
  }

  void _onSuccessOnUploadAddGalleryImageTap(
      SingleImageUploadResponse response, Map<String, dynamic> additionalData) {
    galleryImageURLs.add(response.data);
    update();
    Helper.showSnackBar('Successfully uploaded new thumbnail image');
    updateDraft();
  }

  void onUploadEditGalleryImageTap(int index) {
    Helper.pickImage(
        onSuccessUploadSingleImage: _onSuccessOnUploadEditGalleryImageTap,
        imageName: 'Gallery image',
        additionalData: {'index': index});
  }

  void _onSuccessOnUploadEditGalleryImageTap(
      SingleImageUploadResponse response, Map<String, dynamic> additionalData) {
    final index = additionalData['index'];
    if (index is! int) {
      AppDialogs.showErrorDialog(
          messageText: 'Something went wrong with uploading existing image!');
      return;
    }
    galleryImageURLs[index] = response.data;
    update();
    Helper.showSnackBar('Successfully edited thumbnail image');
  }

  void onUploadDeleteGalleryImageTap(int index) {
    try {
      galleryImageURLs.removeAt(index);
      update();
      Helper.showSnackBar('Successfully removed gallery image');
      setProductAddDetails();
      addEditProductDetails();
    } catch (e) {
      AppDialogs.showErrorDialog(
          messageText: 'Something went wrong with removing existing image!');
      return;
    }
  }

  void _updateVendorDetails([VendorDetails? vendor]) {
    vendorDetails = vendor ?? Helper.getVendor();
    update();
  }

  Future<void> _updateVendorDetailsFromAPI() async {
    final VendorDetailsResponse? updatedVendorDetails =
        await APIHelper.updateLocalSavedVendorDetails();
    _updateVendorDetails(updatedVendorDetails?.data);
  }

  DateTime get discountPriceStartInitialDate {
    if (discountPriceStartDateTime == null) {
      // return DateTime.now().copyWith( year: DateTime.now().year - 1, month: DateTime.now().month, day: DateTime.now().day);
      return DateTime.now();
    }
    return discountPriceStartDateTime!;
  }

  DateTime get discountPriceEndInitialDate {
    if (discountPriceEndDateTime == null) {
      return discountPriceEndFirstDate;
    }
    return discountPriceEndDateTime!;
  }

  DateTime get discountPriceEndFirstDate {
    return discountPriceStartInitialDate.add(const Duration(days: 1));
  }

  // Functions
  void onAddNewBrandButtonTap() async {
    await Get.toNamed(AppPageNames.addBrandScreen);
    await getProductElements();
  }

  // Functions
  void onSetStoreLocationButtonTap() async {
    await Get.toNamed(AppPageNames.setStoreLocationScreen);
    await _updateVendorDetailsFromAPI();
    update();
  }

  void onAddCouponButtonTap() async {
    await Get.toNamed(AppPageNames.addCouponScreen);
    getCoupons(1);
  }

  void onAddNewTagButtonTap() async {
    final result = await Get.bottomSheet(
      const AddTAgBottomSheet(),
    );
    if (result is String) {
      tags.add(ProductElementTag(
        id: Helper.getRandom6DigitGeneratedNumber().toString(),
        name: result,
      ));
    }
    update();
  }

  void onDiscountTypeChanged(({String forView, String value})? item) {
    selectedDiscountType = item;
    updateDraft();
  }

  void onProductCategoryChange(ProductCondition? item) {
    selectedProductCondition = item;
    updateDraft();
    update();
  }

  void _triggerDropdownShortRefresh(bool reloadTrigger) async {
    isProductLocationLoading = false;
    update();
    isProductLocationLoading = true;
    update();
    await Future.delayed(const Duration(milliseconds: 200));
    isProductLocationLoading = false;
    update();
  }

  bool get isStoreLocationExists => vendorDetails.store.storeLocation.isEmpty;

  void onProductLocationChange(ProductLocation? item) {
    if (item != null) {
      if (item == ProductLocation.store && isStoreLocationExists) {
        _triggerDropdownShortRefresh(isProductLocationLoading);
        AppDialogs.showErrorDialog(
            titleText: 'No store location set',
            messageText:
                'Please set store location first to set this product use that location');
        return;
      }
    }
    selectedProductLocation = item;
    updateDraft();
    update();
  }

  void onBrandChange(ProductElementBrand? item) {
    selectedBrand = item;
    updateDraft();
    update();
  }

  void onRemoveQuantityBasedPriceButtonTap(
      int index, ProductQuantityBasedPriceUI productQuantityBasedPriceUI) {
    productQuantityBasedPriceUI.minimumFocusNode.dispose();
    productQuantityBasedPriceUI.minimumController.dispose();
    productQuantityBasedPriceUI.maximumController.dispose();
    productQuantityBasedPriceUI.maximumFocusNode.dispose();
    productQuantityBasedPriceUI.priceController.dispose();
    productQuantityBasedPriceUI.priceFocusNode.dispose();
    productQuantityBasedPriceUIs.remove(productQuantityBasedPriceUI);
    updateDraft();

    update();
  }

  void onAddQuantityBasedPriceButtonTap() {
    _addProductQuantityBasedPriceUI();
  }

  void _addProductQuanitityBasedPriceListeners() {
    productQuantityBasedPriceUIs.last.minimumFocusNode.removeListener(() {});
    for (ProductQuantityBasedPriceUI element in productQuantityBasedPriceUIs) {
      updateDraft();
    }
  }

  void _addProductQuantityBasedPriceUI() {
    productQuantityBasedPriceUIs.add(ProductQuantityBasedPriceUI(
        minimumController: TextEditingController(),
        minimumFocusNode: FocusNode(),
        maximumController: TextEditingController(),
        maximumFocusNode: FocusNode(),
        priceController: TextEditingController(),
        priceFocusNode: FocusNode()));
    productQuantityBasedPriceUIs.last.minimumFocusNode.addListener(() {
      updateDraft();
    });
    productQuantityBasedPriceUIs.last.maximumFocusNode.addListener(() {
      updateDraft();
    });
    productQuantityBasedPriceUIs.last.priceFocusNode.addListener(() {
      updateDraft();
    });
    update();
  }

  void onCategoryChange(ProductElementCategory? value) {
    selectedCategory = value;
    selectedSubcategory = null;
    selectedChildCategory = null;
    childCategories.clear();
    update();
    if (selectedCategory != null) {
      getProductSubcategoryElements(1, selectedCategory!.id);
    }
    updateDraft();
  }

  void onSubcategoryChange(ProductElementSubcategory? value) {
    selectedSubcategory = value;
    selectedChildCategory = null;
    update();
    if (selectedSubcategory != null) {
      getProductChildCategories(1, selectedSubcategory!.id);
    }
    updateDraft();
  }

  void onChildCategoryChange(ChildCategory? value) {
    selectedChildCategory = value;
    updateDraft();
  }

  void onProductUnitChange(ProductElementUnit? item) {
    selectedUnit = item;
    updateDraft();
  }

  void onProductTagsChange(ProductElementTag? item) {
    if (item == null) {
      return;
    }
    /*  final isDuplicateFound = controller.selectedTags
        .any((selectedTag) =>
            selectedTag.id == item.id);
    if (!isDuplicateFound) {
      controller.selectedTags.add(item);
    } */
    selectedTags.add(item);
    updateDraft();
    update();
  }

  void onProductTagDeleteChange(int index, ProductElementTag? selectedItem) {
    selectedTags.remove(selectedItem);
    updateDraft();
    update();
  }

  void onAddSpecificationButtonTap() {
    final FocusNode keyFocusNode = FocusNode();
    keyFocusNode.addListener(() {
      if (keyFocusNode.hasFocus) {
        updateDraft();
      }
    });

    final FocusNode valueFocusNode = FocusNode();
    valueFocusNode.addListener(() {
      if (valueFocusNode.hasFocus) {
        updateDraft();
      }
    });

    specificationKeyValueControllers.add(ProductSpecificationUI(
      id: '',
      keyController: TextEditingController(),
      keyFocusNode: keyFocusNode,
      valueController: TextEditingController(),
      valueFocusNode: valueFocusNode,
    ));
    updateDraft();
    update();
  }

  void onDiscountStartDateDeleteButtonTap() {
    clearDiscountPriceStartDateTime();
    clearDiscountPriceEndDateTime();
    updateDraft();
  }

  void onDiscountEndDateDeleteButtonTap() {
    clearDiscountPriceEndDateTime();
    updateDraft();
  }

  void clearDiscountPriceStartDateTime() {
    discountPriceStartDateTime = null;
    discountPriceStartController.clear();
    discountPriceStartTimeController.clear();
    update();
  }

  void clearDiscountPriceEndDateTime() {
    discountPriceEndDateTime = null;
    discountPriceEndController.clear();
    discountPriceEndTimeController.clear();
    update();
  }

  void onAfterDiscountStartDatePickDate(DateTime? selectedDate) {
    try {
      if (selectedDate == null) {
        return;
      }
      if (discountPriceStartController.text.isEmpty) {
        discountPriceStartController.text =
            Helper.ddMMMyyyyFormattedDateTime(selectedDate);
      }
      discountPriceStartDateTime = selectedDate;
      update();
      if (discountPriceStartDateTime != null &&
          discountPriceEndDateTime != null) {
        if (Helper.isSameDate(
                discountPriceStartDateTime!, discountPriceEndDateTime!) ||
            discountPriceEndDateTime!.isBefore(discountPriceStartDateTime!)) {
          clearDiscountPriceEndDateTime();
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void onAfterDiscountEndDatePickDate(DateTime? selectedDate) {
    if (selectedDate == null) {
      return;
    }
    if (discountPriceEndController.text.isEmpty) {
      discountPriceEndController.text =
          Helper.ddMMMyyyyFormattedDateTime(selectedDate);
    }
    discountPriceEndDateTime = selectedDate;
    update();
  }

  void onAfterStartTimeTap(TimeOfDay? selectedTime) {
    if (selectedTime == null || discountPriceStartDateTime == null) {
      return;
    }
    discountPriceStartDateTime = discountPriceStartDateTime!
        .copyWith(hour: selectedTime.hour, minute: selectedTime.minute);
    discountPriceStartTimeController.text =
        '${selectedTime.hourOfPeriod.to2Digits}:${selectedTime.minute.to2Digits} ${selectedTime.period.name}';
    update();
    updateDraft();
  }

  void onStartTimeTap(BuildContext context) async {
    final TimeOfDay? selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    onAfterStartTimeTap(selectedTime);
    updateDraft();
  }

  void onAfterEndTimeTap(TimeOfDay? selectedTime) {
    if (selectedTime == null || discountPriceEndDateTime == null) {
      return;
    }
    discountPriceEndDateTime = discountPriceEndDateTime!
        .copyWith(hour: selectedTime.hour, minute: selectedTime.minute);
    discountPriceEndTimeController.text =
        '${selectedTime.hourOfPeriod.to2Digits}:${selectedTime.minute.to2Digits} ${selectedTime.period.name}';
    update();
    updateDraft();
  }

  void onEndTimeTap(BuildContext context) async {
    final TimeOfDay? selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    onAfterEndTimeTap(selectedTime);
    updateDraft();
  }

  void setProductAddDetails() {
    productAddDetails.name = productNameController.text;
    productAddDetails.model = productModelController.text;
    productAddDetails.brand = selectedBrand?.id ?? '';
    productAddDetails.productCondition =
        selectedProductCondition?.stringValue ?? '';
    productAddDetails.categories = [selectedCategory?.id];
    productAddDetails.subcategories = [selectedSubcategory?.id];
    productAddDetails.childCategory = [selectedChildCategory?.id];
    productAddDetails.unit = selectedUnit?.name ?? '';
    productAddDetails.tags = selectedTags.toList().map((e) => e.name).toList();
    productAddDetails.quantity = ProductAddDetailsQuantity(
        unitQuantity: int.tryParse(unitQuantityController.text) ?? 0,
        minPurchaseQuantity:
            int.tryParse(minimumPurchaseQuantityController.text) ?? 0,
        stockAlertQuantity:
            int.tryParse(stockAlertQuantityController.text) ?? 0,
        stockQuantity: int.tryParse(stockQuantityController.text) ?? 0);
    productAddDetails.unitQuantity =
        int.tryParse(unitQuantityController.text) ?? 0;
    productAddDetails.stockQuantity =
        int.tryParse(stockQuantityController.text) ?? 0;
    productAddDetails.minPurchaseQuantity =
        int.tryParse(minimumPurchaseQuantityController.text) ?? 0;
    productAddDetails.stockAlertQuantity =
        int.tryParse(stockAlertQuantityController.text) ?? 0;
    productAddDetails.price = double.tryParse(priceController.text) ?? 0;
    if (discountController.text.isNotEmpty) {
      productAddDetails.discountValue =
          double.tryParse(discountController.text) ?? 0;
    }
    if (selectedDiscountType != null) {
      productAddDetails.discountType = selectedDiscountType!.value;
    }
    if (discountPriceStartDateTime != null) {
      productAddDetails.discountStartDate = discountPriceStartDateTime!;
    }
    if (discountPriceEndDateTime != null) {
      productAddDetails.discountEndDate = discountPriceEndDateTime!;
    }
    if ((discountController.text.isNotEmpty) &&
        (selectedDiscountType != null) &&
        (discountPriceStartDateTime != null) &&
        (discountPriceEndDateTime != null)) {
      productAddDetails.discount = ProductAddDetailsDiscount(
          amount: double.tryParse(discountController.text) ?? 0,
          type: selectedDiscountType!.value,
          startDate: discountPriceStartDateTime!,
          endDate: discountPriceEndDateTime!);
    }
    productAddDetails.description = ProductAddDetailsDescription(
        short: shortDescriptionController.text,
        long: longDescriptionController.text);
    productAddDetails.short = shortDescriptionController.text;
    productAddDetails.productImage = productImageURL;
    productAddDetails.thumbImage = thumbnailImageURL;
    productAddDetails.galleryImages = galleryImageURLs;
    productAddDetails.long = longDescriptionController.text;
    productAddDetails.attributeName = selectedAttribute?.name ?? '';
    productAddDetails.attributeValues = selectedAttributeValues.toList();
    productAddDetails.attributes = ProductAddDetailsAttributes(
        name: selectedAttribute?.name ?? '',
        values: selectedAttributeValues.toList());
    if (specificationDescriptionController.text.isNotEmpty) {
      productAddDetails.specificationDescription =
          specificationDescriptionController.text;
    }
    productAddDetails.specifications = specificationKeyValueControllers
        .map((e) => ProductAddDetailsSpecification(
            id: e.id, key: e.keyController.text, value: e.valueController.text))
        .toList();
/*     productAttributeUIs =
        productAddDetails.attribute.mapIndexed((outerIndex, attribute) {
      final ProductElementAttribute? selectedAttribute = elementsData.attributes
          .firstWhereOrNull((element) => element.name == attribute.key);
      final List<ProductAttributeOptionUI> options =
          attribute.options.mapIndexed((innerIndex, option) {
        final TextEditingController valueController = TextEditingController();
        valueController.text = option.value;
        final TextEditingController priceController = TextEditingController();
        priceController.text = option.price.toStringAsFixed(2);
        final String? selectedOption = selectedAttribute?.attributes
            .firstWhereOrNull((element) => element == option.label);
        return ProductAttributeOptionUI(
            valueController: valueController,
            priceController: priceController,
            options: selectedAttribute?.attributes,
            selectedOption: selectedOption,
            id: option.id);
      }).toList();
      return ProductAttributeUI(
          id: attribute.id,
          attributes: elementsData.attributes,
          selectedAttribute: selectedAttribute,
          isColorSelected: attribute.isProductColorAttribute,
          options: options);
    }).toList(); */
    productAddDetails.attribute =
        productAttributeUIs.mapIndexed((outerIndex, attributeUI) {
      return ProductAttribute(
        key: attributeUI.selectedAttribute?.name ?? '',
        options: attributeUI.options.mapIndexed((innerIndex, optionUI) {
          return ProductAttributeOption(
              label: optionUI.selectedOption ?? '',
              price: double.tryParse(optionUI.priceController.text) ?? 0,
              value: optionUI.valueController.text);
        }).toList(),
      );
    }).toList();
    productAddDetails.quantityBasedPrices = productQuantityBasedPriceUIs
        .map((productQuantityBasedPriceUI) => QuantityBasedPrice(
            id: productQuantityBasedPriceUI.id,
            maximum: int.tryParse(
                    productQuantityBasedPriceUI.maximumController.text) ??
                0,
            minimum: int.tryParse(
                    productQuantityBasedPriceUI.minimumController.text) ??
                0,
            price: double.tryParse(
                    productQuantityBasedPriceUI.priceController.text) ??
                0))
        .toList();
    productAddDetails.couponCodes = selectedCoupons.map((e) => e.id).toList();
    if (selectedProductLocation != null) {
      productAddDetails.selectedProductLocation = selectedProductLocation!;
    }
    productAddDetails.productLocation = ProductAddDetailsLocation(
        type: selectedProductLocation!.type,
        store: ProductAddDetailsLocationStore(
          id: vendorDetails.store.id,
          name: vendorDetails.store.name,
          address: vendorDetails.store.storeLocation.address,
          location: ProductAddDetailsLocationStoreLocation(
              latitude: vendorDetails.store.storeLocation.location.latitude,
              longitude: vendorDetails.store.storeLocation.location.longitude),
        ),
        relayPoint: selectedPickupStation == null
            ? PickupStation.empty()
            : selectedPickupStation!);
    productAddDetails.relayPointID = selectedPickupStation?.id ?? '';
    update();
  }

  void onNextButtonTap() {
    if (isValidForNextScreen()) {
      setProductAddDetails();
      Get.toNamed(AppPageNames.addProduct2ndScreen,
          arguments: productAddDetails);
    }
  }

  bool isValidForNextScreen() {
    if (productNameController.text.isEmpty) {
      AppDialogs.showErrorDialog(messageText: 'Product name is required');
      return false;
    }
    if (productModelController.text.isEmpty) {
      AppDialogs.showErrorDialog(messageText: 'Product model is required');
      return false;
    }
    if (selectedBrand == null) {
      AppDialogs.showErrorDialog(messageText: 'Product brand is required');
      return false;
    }
    if (selectedCategory == null) {
      AppDialogs.showErrorDialog(messageText: 'Product category is required');
      return false;
    }
/*     if (selectedSubcategory == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Product subcategory is required');
      return false;
    }
    if (selectedChildCategory == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Product child category is required');
      return false;
    } */
    if (selectedUnit == null) {
      AppDialogs.showErrorDialog(messageText: 'Product unit is required');
      return false;
    }
    if (selectedTags.isEmpty) {
      AppDialogs.showErrorDialog(messageText: 'Product tags is required');
      return false;
    }
    if (unitQuantityController.text.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Product unit quantity is required');
      return false;
    } else if (int.tryParse(unitQuantityController.text) == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Product unit quantity must be a number');
      return false;
    }
    if (stockQuantityController.text.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Product stock quantity is required');
      return false;
    } else if (int.tryParse(stockQuantityController.text) == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Product stock quantity must be a number');
      return false;
    }
    if (minimumPurchaseQuantityController.text.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Product minimum purchase quantity is required');
      return false;
    } else if (int.tryParse(minimumPurchaseQuantityController.text) == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Product minimum purchase quantity must be a number');
      return false;
    }
    if (stockAlertQuantityController.text.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Product stock alert quantity is required');
      return false;
    } else if (int.tryParse(stockAlertQuantityController.text) == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Product stock alert quantity must be a number');
      return false;
    }
    if (priceController.text.isEmpty) {
      AppDialogs.showErrorDialog(messageText: 'Product price is required');
      return false;
    } else if (double.tryParse(priceController.text) == null) {
      AppDialogs.showErrorDialog(messageText: 'Product price must be a number');
      return false;
    }
    if (discountController.text.isNotEmpty &&
        double.tryParse(discountController.text) == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Product discount value must be a number');
      return false;
    }
    if (discountPriceStartDateTime != null &&
        discountPriceEndDateTime == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Product discount price end date is required');
      return false;
    }
    if (discountPriceEndDateTime != null &&
        discountPriceStartDateTime == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Product discount price start date is required');
      return false;
    }
    if (shortDescriptionController.text.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Product short description is required');
      return false;
    }
    if (longDescriptionController.text.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Product long description is required');
      return false;
    }
/*     if (selectedAttribute == null) {
      AppDialogs.showErrorDialog(messageText: 'Product attribute is required');
      return false;
    }
    if (selectedAttributeValues.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Product attribute values are required');
      return false;
    } */
    if (specificationKeyValueControllers.isNotEmpty) {
      final isAnyEmpty = specificationKeyValueControllers.any(
          (specificationKeyValue) =>
              specificationKeyValue.keyController.text.isEmpty ||
              specificationKeyValue.valueController.text.isEmpty);
      if (isAnyEmpty) {
        AppDialogs.showErrorDialog(
            messageText:
                'Product specification attribute name, value are required');
        return false;
      }
    }
    if (selectedProductLocation == null) {
      AppDialogs.showErrorDialog(messageText: 'Product location is required');
      return false;
    }
    if ((selectedProductLocation == ProductLocation.store) &&
        (vendorDetails.store.storeLocation.isEmpty)) {
      AppDialogs.showErrorDialog(
          messageText:
              'Store location is required. Please set store location first');
      return false;
    }
    if ((selectedProductLocation == ProductLocation.pickupStations) &&
        (selectedPickupStation == null)) {
      AppDialogs.showErrorDialog(messageText: 'Pickup station is required');
      return false;
    }
    return true;
  }

  Future<void> getProductElements() async {
    await getCoupons(1);
    await getPickupStations();
    await _fetchProductElements();
  }

  Future<void> _fetchProductElements() async {
    isElementsLoading.value = true;
    ProductElementsResponse? response = await APIRepo.getProductElements();
    isElementsLoading.value = false;
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log((response.toJson().toString()));
    _onSuccessGetProductElements(response);
  }

  void _onSuccessGetProductElements(ProductElementsResponse response) async {
    final elementsData = response.data;
    brands.clear();
    brands.addAll(elementsData.brands);
    categories.clear();
    categories.addAll(elementsData.categories);
    units.clear();
    units.addAll(elementsData.units);
    subcategories.clear();
    childCategories.clear();
    // subcategories.addAll(elementsData.subcategories);
    tags.clear();
    tags.addAll(elementsData.tags);
    selectedTags.clear();
    for (ProductElementAttribute element in elementsData.attributes) {
      element.attributes = element.attributes.toSet().toList();
    }
    attributes.clear();
    attributes.addAll(elementsData.attributes);
    attributeValues.clear();
    selectedAttributeValues.clear();
    // Preset values
    if (productAddDetails.isProductEditing) {
      // Preselect brand name
      final foundBrand = brands
          .firstWhereOrNull((element) => element.id == productAddDetails.brand);
      selectedBrand = foundBrand;
      // Preselect category
      selectedCategory = categories.firstWhereOrNull((category) =>
          category.name == (productAddDetails.categories.firstOrNull ?? ''));
      onCategoryChange(selectedCategory);
      // Preselect attribute name
      final foundAttribute = attributes.firstWhereOrNull(
          (element) => element.name == productAddDetails.attributes.name);
      selectedAttribute = foundAttribute;
      // Preselect attribute values
      if (selectedAttribute != null) {
        attributeValues.addAll(selectedAttribute!.attributes);
      }
      selectedAttributeValue = productAddDetails.attributes.values.lastOrNull;
      selectedAttributeValues.addAll(productAddDetails.attributes.values);
      // Preselect product unit name
      final foundUnit = units.firstWhereOrNull(
          (element) => element.name == productAddDetails.unit);
      selectedUnit = foundUnit;
      final foundTags = tags
          .where((tag) => (productAddDetails.tags
                  .firstWhereOrNull((element) => element == tag.name) !=
              null))
          .toList();
      // Preselect product tags
      selectedTags.addAll(foundTags);
      selectedTag = selectedTags.lastOrNull;
    }
    productAttributeUIs =
        productAddDetails.attribute.mapIndexed((outerIndex, attribute) {
      final ProductElementAttribute? selectedAttribute = elementsData.attributes
          .firstWhereOrNull((element) => element.name == attribute.key);
      final List<ProductAttributeOptionUI> options =
          attribute.options.mapIndexed((innerIndex, option) {
        final TextEditingController valueController = TextEditingController();
        valueController.text = option.value;
        final FocusNode valueFocusNode = FocusNode();
        valueFocusNode.addListener(() {
          if (valueFocusNode.hasFocus) {
            updateDraft();
          }
        });
        final TextEditingController priceController = TextEditingController();
        priceController.text = option.price.toStringAsFixed(2);
        final FocusNode priceFocusNode = FocusNode();
        priceFocusNode.addListener(() {
          if (priceFocusNode.hasFocus) {
            updateDraft();
          }
        });
        final String? selectedOption = selectedAttribute?.attributes
            .firstWhereOrNull((element) => element == option.label);
        return ProductAttributeOptionUI(
            valueController: valueController,
            valueFocusNode: valueFocusNode,
            priceController: priceController,
            priceFocusNode: priceFocusNode,
            options: selectedAttribute?.attributes,
            selectedOption: selectedOption,
            id: option.id);
      }).toList();
      return ProductAttributeUI(
          id: attribute.id,
          attributes: elementsData.attributes,
          selectedAttribute: selectedAttribute,
          isColorSelected: attribute.isProductColorAttribute,
          options: options);
    }).toList();
    productQuantityBasedPriceUIs =
        productAddDetails.quantityBasedPrices.map((quantityBasedPrice) {
      final minimumController = TextEditingController();
      minimumController.text = quantityBasedPrice.minimum.toString();
      final maximumController = TextEditingController();
      maximumController.text = quantityBasedPrice.maximum.toString();
      final priceController = TextEditingController();
      priceController.text = quantityBasedPrice.price.toStringAsFixed(2);
      return ProductQuantityBasedPriceUI(
          id: quantityBasedPrice.id,
          minimumController: minimumController,
          minimumFocusNode: FocusNode(),
          maximumController: maximumController,
          maximumFocusNode: FocusNode(),
          priceController: priceController,
          priceFocusNode: FocusNode());
    }).toList();

    update();
  }

  Future<void> getPickupStations() async {
    isElementsLoading.value = true;
    final PickupStationsResponse? response = await APIRepo.getPickupStations();
    isElementsLoading.value = false;
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log((response.toJson().toString()));
    _onSuccessGetPickupStations(response);
  }

  void _onSuccessGetPickupStations(PickupStationsResponse response) {
    pickupStations = response.data;
    update();
  }

  Future<void> getCoupons(int currentPageNumber) async {
    final CouponListsResponse? response = await APIRepo.getCoupons(
      currentPageNumber,
      // searchTextEditingController.text,
    );
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log((response.toJson().toString()));
    _onSuccessGetCoupons(response);
  }

  void _onSuccessGetCoupons(CouponListsResponse response) {
    final isFirstPage = response.data.page == 1;
    if (isFirstPage) {
      coupons.clear();
    }
    coupons.addAll(response.data.docs);
    update();
    final isLastPage = !response.data.hasNextPage;
    if (isLastPage) {
      return;
    }
    final nextPageNumber = response.data.page + 1;
    getCoupons(nextPageNumber);
  }

  Future<void> getProductSubcategoryElements(
      int page, String categoryID) async {
    isSubcategoryLoading.value = true;
    ProductElementSubcategoriesResponse? response =
        await APIRepo.getProductSubcategoryElements(page, categoryID);
    isSubcategoryLoading.value = false;
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log((response.toJson().toString()));
    _onSuccessGetProductSubcategoryElements(response);
  }

  void _onSuccessGetProductSubcategoryElements(
      ProductElementSubcategoriesResponse response) {
    if (response.data.page == 1) {
      selectedSubcategory = null;
      subcategories.clear();
    }
    subcategories.addAll(response.data.docs);
    final isLastPage = !response.data.hasNextPage;
    if (isLastPage) {
      update();
      _initiallyPreselectDataFromSubcategory();
      return;
    }
    final nextPageNumber = response.data.page + 1;
    if (selectedCategory != null) {
      getProductSubcategoryElements(nextPageNumber, selectedCategory!.id);
    }
    update();
  }

  void _initiallyPreselectDataFromSubcategory() {
    if (productAddDetails.isProductEditing) {
      // Preselect subcategory
      selectedSubcategory = subcategories.firstWhereOrNull((subcategory) =>
          subcategory.id ==
          (productAddDetails.subcategories.firstOrNull ?? ''));
      onSubcategoryChange(selectedSubcategory);
    }
  }

  Future<void> getProductChildCategories(int page, String subcategoryID) async {
    isChildCategoriesLoading.value = true;
    ChildCategoriesResponse? response =
        await APIRepo.getChildCategories(page, subcategoryID);
    isChildCategoriesLoading.value = false;
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log((response.toJson().toString()));
    _onSuccessGetProductChildCategories(response);
  }

  void _onSuccessGetProductChildCategories(ChildCategoriesResponse response) {
    if (response.data.page == 1) {
      selectedChildCategory = null;
      childCategories.clear();
    }
    childCategories.addAll(response.data.docs);
    final isLastPage = !response.data.hasNextPage;
    if (isLastPage) {
      update();
      _initiallyPreselectDataFromChildCategory();
      return;
    }
    final nextPageNumber = response.data.page + 1;
    if (selectedSubcategory != null) {
      getProductChildCategories(nextPageNumber, selectedSubcategory!.id);
    }
    update();
  }

  void _initiallyPreselectDataFromChildCategory() {
    if (productAddDetails.isProductEditing) {
      // Preselect child category
      selectedChildCategory = childCategories.firstWhereOrNull(
          (childCategory) =>
              childCategory.id ==
              (productAddDetails.childCategory.firstOrNull ?? ''));
      onChildCategoryChange(selectedChildCategory);
    }
  }

  Future<void> getProductDetails(String productID) async {
    final ProductDetailsResponse? response =
        await APIRepo.getProductDetails(productID);
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log((response.toJson().toString()));
    _onSuccessGetProductDetails(response);
  }

  void _setInitialViewData() async {
    productNameController.text = productAddDetails.name;
    productModelController.text = productAddDetails.model;
    selectedProductCondition =
        ProductCondition.toEnumValue(productAddDetails.productCondition);
    unitQuantityController.text = '${productAddDetails.quantity.unitQuantity}';
    // Preselect brand name
    // Preselect category
    // Preselect subcategory
    // Preselect child category
    // Preselect product unit name
    // Preselect product tags
    // Preselect attribute
    // Preselect specifications
    unitQuantityController.text = '${productAddDetails.unitQuantity}';
    stockQuantityController.text =
        '${productAddDetails.quantity.stockQuantity}';
    minimumPurchaseQuantityController.text =
        '${productAddDetails.quantity.minPurchaseQuantity}';
    stockAlertQuantityController.text =
        '${productAddDetails.quantity.stockAlertQuantity}';
    priceController.text = '${productAddDetails.price}';
    discountController.text = '${productAddDetails.discount.amount}';
    final foundDiscountType = discountTypes.firstWhereOrNull(
        (element) => element.value == productAddDetails.discount.type);
    selectedDiscountType = foundDiscountType;
    if (productAddDetails.discount.startDate.year !=
        Constants.defaultUnsetDateTimeYear) {
      onAfterDiscountStartDatePickDate(productAddDetails.discount.startDate);
      onAfterStartTimeTap(
          TimeOfDay.fromDateTime(productAddDetails.discount.startDate));
    }
    if (productAddDetails.discount.endDate.year !=
        Constants.defaultUnsetDateTimeYear) {
      onAfterDiscountEndDatePickDate(productAddDetails.discount.endDate);
      onAfterEndTimeTap(
          TimeOfDay.fromDateTime(productAddDetails.discount.endDate));
    }
    shortDescriptionController.text = productAddDetails.description.short;
    longDescriptionController.text = productAddDetails.description.long;
    // Preselect attribute name
    // Preselect attribute values
    specificationDescriptionController.text =
        productAddDetails.specificationDescription;
//-----------------------
    productImageURL = productAddDetails.productImage;
    thumbnailImageURL = productAddDetails.thumbImage;
    galleryImageURLs = productAddDetails.galleryImages;
    // Preselect specifications
    specificationKeyValueControllers =
        productAddDetails.specifications.map((specification) {
      TextEditingController keyController = TextEditingController();
      keyController.text = specification.key;
      TextEditingController valueController = TextEditingController();
      valueController.text = specification.value;
      final FocusNode keyFocusNode = FocusNode();
      keyFocusNode.addListener(() {
        if (keyFocusNode.hasFocus) {
          updateDraft();
        }
      });

      final FocusNode valueFocusNode = FocusNode();
      valueFocusNode.addListener(() {
        if (valueFocusNode.hasFocus) {
          updateDraft();
        }
      });

      return ProductSpecificationUI(
          id: specification.id,
          keyController: keyController,
          keyFocusNode: keyFocusNode,
          valueController: valueController,
          valueFocusNode: valueFocusNode);
    }).toList();
    update();
  }

  void _onSuccessGetProductDetails(ProductDetailsResponse response) async {
    // final VendorDetails vendorDetails = Helper.getVendor();
    final ProductDetails productDetails = response.data;
    final productAddDetailsFromDetails = ProductAddDetails.empty().copyWith(
        id: productDetails.id,
        store: ProductAddDetailsStore(
            id: productDetails.store.id, name: productDetails.store.name),
        attributeName: productDetails.attributes.name,
        attributeValues: productDetails.attributes.values,
        attribute: productDetails.attribute,
        attributes: ProductAddDetailsAttributes(
            name: productDetails.attributes.name,
            values: productDetails.attributes.values),
        bestSell: productDetails.bestSell,
        brand: productDetails.brand.id,
        productCondition: productDetails.productCondition,
        categories:
            productDetails.categories.map((category) => category.name).toList(),
        childCategory: productDetails.childCategory,
        delivery: productDetails.deliveryInfo.delivery,
        deliveryInfo: ProductAddDetailsDeliveryInfo(
            delivery: productDetails.deliveryInfo.delivery,
            shipping: productDetails.deliveryInfo.shipping,
            productReturn: ProductAddDetailsProductReturn(
                days: productDetails.deliveryInfo.productReturn.days,
                msg: productDetails.deliveryInfo.productReturn.msg)),
        description: ProductAddDetailsDescription(
            short: productDetails.description.short,
            long: productDetails.description.long),
        discount: ProductAddDetailsDiscount(
            startDate: productDetails.discount.startDate,
            endDate: productDetails.discount.endDate,
            amount: productDetails.discount.amount,
            type: productDetails.discount.type),
        discountEndDate: productDetails.discount.endDate,
        discountStartDate: productDetails.discount.startDate,
        discountType: productDetails.discount.type,
        discountValue: productDetails.discount.amount,
        featured: productDetails.featured,
        flashDeal: productDetails.flashDeal,
        galleryImages: productDetails.galleryImages,
        hotSell: productDetails.hotSell,
        isStatus: productDetails.isStatus,
        long: productDetails.description.long,
        short: productDetails.description.short,
        minPurchaseQuantity: productDetails.quantity.minPurchaseQuantity,
        model: productDetails.model,
        name: productDetails.name,
        newArrival: productDetails.newArrival,
        onSell: productDetails.onSell,
        popular: productDetails.popular,
        price: productDetails.price,
        quantityBasedPrices: productDetails.quantityBasedPrices,
        productImage: productDetails.productImage,
        productReturn: ProductAddDetailsProductReturn(
            days: productDetails.deliveryInfo.productReturn.days,
            msg: productDetails.deliveryInfo.productReturn.msg),
        quantity: ProductAddDetailsQuantity(
            unitQuantity: productDetails.quantity.unitQuantity,
            minPurchaseQuantity: productDetails.quantity.minPurchaseQuantity,
            stockAlertQuantity: productDetails.quantity.stockAlertQuantity,
            stockQuantity: productDetails.quantity.stockQuantity),
        shipping: productDetails.deliveryInfo.shipping,
        specificationDescription: productDetails.specificationDescription,
        specifications: productDetails.specifications
            .map((specification) => ProductAddDetailsSpecification(
                id: specification.id,
                key: specification.key,
                value: specification.value))
            .toList(),
        stockAlertQuantity: productDetails.quantity.stockAlertQuantity,
        stockAvailable: productDetails.stockAvailable,
        stockQuantity: productDetails.quantity.stockQuantity,
        stockVisibility: productDetails.stockVisibility,
        subcategories: productDetails.subcategories
            .map((subcategory) => subcategory.id)
            .toList(),
        tags: productDetails.tags,
        thumbImage: productDetails.thumbImage,
        trend: productDetails.trend,
        unit: productDetails.unit,
        unitQuantity: productDetails.quantity.unitQuantity,
        couponCodes: productDetails.couponsCodes,
        productLocation: productDetails.productLocation);
    productAddDetails = productAddDetailsFromDetails;
    productImageURL = productAddDetails.productImage;
    thumbnailImageURL = productAddDetails.thumbImage;
    galleryImageURLs = productAddDetails.galleryImages;
    _setInitialViewData();
    update();
    await getProductElements();
    selectedCoupons.clear();
    for (final couponID in productDetails.couponsCodes) {
      final List<Coupon> foundCoupons =
          coupons.fold(<Coupon>[], (previousValue, element) {
        if (element.id == couponID) {
          previousValue.add(element);
        }
        return previousValue;
      });
      selectedCoupons.addAll(foundCoupons);
    }
    selectedProductLocation = productDetails.productLocation.locationType;
    if (selectedProductLocation == ProductLocation.pickupStations) {
      selectedPickupStation = pickupStations.firstWhereOrNull((element) =>
          element.id == productDetails.productLocation.relayPoint.id);
    }
    update();
  }

  void _getScreenParameter() {
    final dynamic argument = Get.arguments;
    if (argument is String) {
      productID = argument;
    }
  }

  void setStoreInfoToProductDetails() {
    final VendorDetails vendorDetails = Helper.getVendor();
    productAddDetails.store = ProductAddDetailsStore(
        id: vendorDetails.store.id, name: vendorDetails.store.name);
    update();
  }

  String get appbarTitle {
    if (productAddDetails.isProductEditing) {
      return 'Edit product';
    }
    return LanguageHelper.currentLanguageText(
        LanguageHelper.addProductTransKey);
  }

  Future<void> addEditProductDetails() async {
    try {
      Map<String, dynamic> requestBody = productAddDetails.toJson();
      requestBody['is_draft'] = true;

      // requestBody = checkAndFilterUnnecessaryData(requestBody);
      String requestBodyJson = jsonEncode(requestBody);
      // isLoading.value = true;
      AddProductInitialResponse? response =
          await APIRepo.addProductInitialPost(requestBodyJson);
      // isLoading.value = false;
      if (response == null) {
        APIHelper.onError(response?.msg);
        return;
      } else if (response.error) {
        APIHelper.onFailure(response.msg);
        return;
      }
      _onSuccessAddEditProductDetails(response);
    } catch (e) {
      APIHelper.onError(null);
    }
  }

  void _onSuccessAddEditProductDetails(
      AddProductInitialResponse response) async {
    productAddDetails.id = response.data.id;
    Helper.showSnackBar(response.msg);
    // Get.back();
    // Get.back();
    // Get.back();
  }

  void updateDraft() {
    if (!dataLoaded) {
      return;
    }
    if (!shouldUpdateDraft) {
      return;
    }
    setProductAddDetails();
    addEditProductDetails();
  }

  void setPreLoadedValues() async {
    setStoreInfoToProductDetails();
    if (productID.isNotEmpty) {
      await getProductDetails(productID);
    } else {
      await getProductElements();
    }
    callLoaded();
  }

  callLoaded() async {
    await Future.delayed(const Duration(seconds: 7));
    dataLoaded = true;
  }

  @override
  void onInit() {
    _getScreenParameter();
    setPreLoadedValues();
    _setFocusListeners();
    super.onInit();
  }

  void _setFocusListeners() {
    productNameFocusNode.addListener(() {
      if (!productNameFocusNode.hasFocus) {
        updateDraft();
      }
    });
    unitQuantityFocusNode.addListener(() {
      if (!unitQuantityFocusNode.hasFocus) {
        updateDraft();
      }
    });
    stockQuantityFocusNode.addListener(() {
      if (!stockQuantityFocusNode.hasFocus) {
        updateDraft();
      }
    });
    minimumPurchaseQuantityFocusNode.addListener(() {
      if (!minimumPurchaseQuantityFocusNode.hasFocus) {
        updateDraft();
      }
    });
/*     minimumFocusNode.addListener(() {
      if (!minimumFocusNode.hasFocus) {
        updateDraft();
      }
    }); */
/*     maximumFocusNode.addListener(() {
      if (!maximumFocusNode.hasFocus) {
        updateDraft();
      }
    }); */
    stockAlertQuantityFocusNode.addListener(() {
      if (!stockAlertQuantityFocusNode.hasFocus) {
        updateDraft();
      }
    });
    priceFocusNode.addListener(() {
      if (!priceFocusNode.hasFocus) {
        updateDraft();
      }
    });
    quantityBasePriceFocusNode.addListener(() {
      if (!quantityBasePriceFocusNode.hasFocus) {
        updateDraft();
      }
    });
    discountFocusNode.addListener(() {
      if (!discountFocusNode.hasFocus) {
        updateDraft();
      }
    });
    productModelFocusNode.addListener(() {
      if (!productModelFocusNode.hasFocus) {
        updateDraft();
      }
    });
    discountPriceStartFocusNode.addListener(() {
      if (!discountPriceStartFocusNode.hasFocus) {
        updateDraft();
      }
    });
    discountPriceStartTimeFocusNode.addListener(() {
      if (!discountPriceStartTimeFocusNode.hasFocus) {
        updateDraft();
      }
    });
    discountPriceEndFocusNode.addListener(() {
      if (!discountPriceEndFocusNode.hasFocus) {
        updateDraft();
      }
    });
    discountPriceEndTimeFocusNode.addListener(() {
      if (!discountPriceEndTimeFocusNode.hasFocus) {
        updateDraft();
      }
    });
    shortDescriptionFocusNode.addListener(() {
      if (!shortDescriptionFocusNode.hasFocus) {
        updateDraft();
      }
    });
    longDescriptionFocusNode.addListener(() {
      if (!longDescriptionFocusNode.hasFocus) {
        updateDraft();
      }
    });
    specificationDescriptionFocusNode.addListener(() {
      if (!specificationDescriptionFocusNode.hasFocus) {
        updateDraft();
      }
    });
/*     optionUIValueFocusNode.addListener(() {
      if (!optionUIValueFocusNode.hasFocus) {
        updateDraft();
      }
    }); */
/*     optionUIPriceFocusNode.addListener(() {
      if (!optionUIPriceFocusNode.hasFocus) {
        updateDraft();
      }
    }); */
    specificationKeyFocusNode.addListener(() {
      if (!specificationKeyFocusNode.hasFocus) {
        updateDraft();
      }
    });
    specificationValueFocusNode.addListener(() {
      if (!specificationValueFocusNode.hasFocus) {
        updateDraft();
      }
    });
  }

  @override
  void onClose() {
    productNameController.dispose();
    unitQuantityController.dispose();
    stockQuantityController.dispose();
    minimumPurchaseQuantityController.dispose();
    stockAlertQuantityController.dispose();
    productModelController.dispose();
    priceController.dispose();
    discountController.dispose();
    discountPriceStartController.dispose();
    discountPriceStartTimeController.dispose();
    discountPriceEndController.dispose();
    discountPriceEndTimeController.dispose();
    shortDescriptionController.dispose();
    longDescriptionController.dispose();
    specificationDescriptionController.dispose();
    for (final ProductSpecificationUI element
        in specificationKeyValueControllers) {
      element.keyController.dispose();
      element.valueController.dispose();
    }
    for (ProductAttributeUI productAttributeUI in productAttributeUIs) {
      for (ProductAttributeOptionUI element in productAttributeUI.options) {
        element.priceController.dispose();
        element.valueController.dispose();
      }
    }
    for (ProductQuantityBasedPriceUI productQuantityBasedPriceUI
        in productQuantityBasedPriceUIs) {
      productQuantityBasedPriceUI.minimumController.dispose();
      productQuantityBasedPriceUI.maximumController.dispose();
      productQuantityBasedPriceUI.priceController.dispose();
    }
    super.onClose();
  }
}
