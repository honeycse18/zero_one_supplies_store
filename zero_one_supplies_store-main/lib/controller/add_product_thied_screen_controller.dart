import 'dart:convert';

import 'package:ecomikstoreapp/models/api_responses/core_api_responses/raw_api_response.dart';
import 'package:ecomikstoreapp/models/api_responses/product_details_response.dart';
import 'package:ecomikstoreapp/models/api_responses/vendor_with_store_details_response.dart';
import 'package:ecomikstoreapp/models/local/product_add_details/product_add_details.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductThirdScreenController extends GetxController {
  bool isDraft = true;
  ProductAddDetails productAddDetails = ProductAddDetails.empty();
  TextEditingController approximateDeliveryTimeController =
      TextEditingController();
  TextEditingController minimumAmountController = TextEditingController();
  TextEditingController productReturnTimeController = TextEditingController();
  TextEditingController returnPolicyMessageController = TextEditingController();

  FocusNode apprDeliveryTimeFocusNode = FocusNode();
  FocusNode minAmountFocusNode = FocusNode();
  FocusNode productReturnTimeFocusNode = FocusNode();
  FocusNode returnPolicyMessageFocusNode = FocusNode();
  RxBool isLoading = false.obs;

  bool isValidForUpload() {
    if (approximateDeliveryTimeController.text.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Approximate delivery time is required');
      return false;
    } else if (int.tryParse(approximateDeliveryTimeController.text) == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Approximate delivery time must be in number');
      return false;
    }
    if (minimumAmountController.text.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Minimum amount for free shipping is required');
      return false;
    } else if (double.tryParse(minimumAmountController.text) == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Minimum amount for free shipping must be in number');
      return false;
    }
    if (productReturnTimeController.text.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Product return time is required');
      return false;
    } else if (int.tryParse(productReturnTimeController.text) == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Product return time must be in number');
      return false;
    }
    if (returnPolicyMessageController.text.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Product return policy message is required');
      return false;
    }
    return true;
  }

  void onUploadButtonTap() {
    isDraft = false;
    update();
    if (isValidForUpload()) {
      productAddDetails.deliveryInfo = ProductAddDetailsDeliveryInfo(
        delivery: int.tryParse(approximateDeliveryTimeController.text) ?? 0,
        shipping: double.tryParse(minimumAmountController.text) ?? 0,
        productReturn: ProductAddDetailsProductReturn(
            days: int.tryParse(productReturnTimeController.text) ?? 0,
            msg: returnPolicyMessageController.text),
      );
      final VendorDetails vendorDetails = Helper.getVendor();
      productAddDetails.store = ProductAddDetailsStore(
          id: vendorDetails.store.id, name: vendorDetails.store.name);
      addEditProductDetails();
    }
  }

  Map<String, dynamic> checkAndFilterUnnecessaryData(
      Map<String, dynamic> requestBody) {
    if (!productAddDetails.isProductEditing) {
      requestBody.remove('_id');
    }
    if (productAddDetails.discount.isEmpty) {
      requestBody.remove('discount');
    }
    if (productAddDetails.attributes.isEmpty) {
      requestBody.remove('attributes');
    }
    if (productAddDetails.subcategories.isNotEmpty) {
      if (productAddDetails.subcategories.firstOrNull != null) {
        requestBody.remove('subcategories');
      }
    }
    if (productAddDetails.childCategory.isNotEmpty) {
      if (productAddDetails.childCategory.firstOrNull != null) {
        requestBody.remove('child_category');
      }
    }
    for (final (int, ProductAddDetailsSpecification) specification
        in productAddDetails.specifications.indexed) {
      if (specification.$2.isAdding) {
        final requestBodySpecification =
            requestBody['specifications'][specification.$1];
        requestBodySpecification.remove('_id');
        requestBody['specifications'][specification.$1];
      }
    }
    if (productAddDetails.attribute.isEmpty) {
      requestBody.remove('attribute');
    } else {
      // Filter product attribute
      requestBody['attributes_checked'] = <Map<String, dynamic>>[];
      final attributesChecked = requestBody['attributes_checked'];
      for (final (int, ProductAttribute) attribute
          in productAddDetails.attribute.indexed) {
        final requestBodyAttribute = requestBody['attribute'][attribute.$1];
        if (attribute.$2.id.isEmpty) {
          requestBodyAttribute.remove('_id');
        }
        for (final (int, ProductAttributeOption) option
            in attribute.$2.options.indexed) {
          final requestBodyOption = requestBodyAttribute['options'][option.$1];
          if (option.$2.id.isEmpty) {
            requestBodyOption.remove('_id');
          }
          if (!option.$2.isValueHexColorCode) {
            requestBodyOption.remove('value');
          }
        }
        if (attribute.$2.isProductColorAttribute) {
          attributesChecked.add(<String, dynamic>{
            'attribute': true,
            'index': attribute.$1,
          });
        }
      }
    }
    if (productAddDetails.quantityBasedPrices.isEmpty) {
      requestBody.remove('quantity_based_price');
    } else {
      for (final (int, QuantityBasedPrice) quantityBasedPrice
          in productAddDetails.quantityBasedPrices.indexed) {
        final requestBodyQuantityBasedPrice =
            requestBody['quantity_based_price'][quantityBasedPrice.$1];
        if (quantityBasedPrice.$2.id.isEmpty) {
          requestBodyQuantityBasedPrice.remove('_id');
        }
      }
    }
    return requestBody;
  }

  Future<void> addEditProductDetails() async {
    try {
      Map<String, dynamic> requestBody = productAddDetails.toJson();
      requestBody['is_draft'] = isDraft;

      requestBody = checkAndFilterUnnecessaryData(requestBody);
      String requestBodyJson = jsonEncode(requestBody);
      isLoading.value = true;
      RawAPIResponse? response =
          await APIRepo.submitAddEditProductDetails(requestBodyJson);
      isLoading.value = false;
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

  void _onSuccessAddEditProductDetails(RawAPIResponse response) async {
    Helper.showSnackBar(response.msg);
    if (!isDraft) {
      Get.back();
      Get.back();
      Get.back();
    }
  }

  void _preSelectData() {
    approximateDeliveryTimeController.text =
        '${productAddDetails.deliveryInfo.delivery}';
    minimumAmountController.text = '${productAddDetails.deliveryInfo.shipping}';
    productReturnTimeController.text =
        '${productAddDetails.deliveryInfo.productReturn.days}';
    returnPolicyMessageController.text =
        productAddDetails.deliveryInfo.productReturn.msg;
    update();
  }

  String get appbarTitle {
    if (productAddDetails.isProductEditing) {
      return 'Edit product';
    }
    return LanguageHelper.currentLanguageText(
        LanguageHelper.addProductTransKey);
  }

  void _getScreenParameter() {
    final dynamic argument = Get.arguments;
    if (argument is ProductAddDetails) {
      productAddDetails = argument;
      if (productAddDetails.isProductEditing) {
        _preSelectData();
      }
    }
  }

  void setProductAddDetails() {
    productAddDetails.deliveryInfo = ProductAddDetailsDeliveryInfo(
      delivery: int.tryParse(approximateDeliveryTimeController.text) ?? 0,
      shipping: double.tryParse(minimumAmountController.text) ?? 0,
      productReturn: ProductAddDetailsProductReturn(
          days: int.tryParse(productReturnTimeController.text) ?? 0,
          msg: returnPolicyMessageController.text),
    );
    update();
  }

  void updateDraft() {
    setProductAddDetails();
    addEditProductDetails();
  }

  @override
  void onInit() {
    _getScreenParameter();

    apprDeliveryTimeFocusNode.addListener(() {
      if (!apprDeliveryTimeFocusNode.hasFocus) {
        updateDraft();
      }
    });
    minAmountFocusNode.addListener(() {
      if (!minAmountFocusNode.hasFocus) {
        updateDraft();
      }
    });
    productReturnTimeFocusNode.addListener(() {
      if (!productReturnTimeFocusNode.hasFocus) {
        updateDraft();
      }
    });
    returnPolicyMessageFocusNode.addListener(() {
      if (!returnPolicyMessageFocusNode.hasFocus) {
        updateDraft();
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    approximateDeliveryTimeController.dispose();
    minimumAmountController.dispose();
    productReturnTimeController.dispose();
    returnPolicyMessageController.dispose();
    super.onClose();
  }
}
