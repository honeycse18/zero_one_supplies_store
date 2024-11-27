import 'dart:convert';
import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/add_product_initial_response.dart';
import 'package:ecomikstoreapp/models/local/product_add_details/product_add_details.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:get/get.dart';

class AddProductSecondScreenController extends GetxController {
  ProductAddDetails productAddDetails = ProductAddDetails.empty();
  bool isAvailableToStock = false;
  bool showStock = true;
  // bool isFlashSell = false;
  // bool isNovelty = true;
  // bool isOnSell = false;
  // bool isBestSell = false;
  // bool isTopSell = false;
  // bool isFeatured = false;
  // bool isPopular = false;
  bool isProductActiveStatus = true;
  String productImageURL = '';
  String thumbnailImageURL = '';
  List<String> galleryImageURLs = [];

  /*  void onUploadProductImageTap() {
    Helper.pickImage(
        onSuccessUploadSingleImage: _onSuccessUploadProductImage,
        imageName: 'Product image');
  } */

  bool isValidForNextScreen() {
    /* if (productImageURL.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: AppLanguageTranslation
              .productImagerequiredTransKey.toCurrentLanguage);
      return false;
    } */
/*     if (thumbnailImageURL.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Product thumbnail image is required');
      return false;
    }
    if (galleryImageURLs.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Product gallery image(s) is required');
      return false;
    } */
    return true;
  }

  void onNextButtonTap() {
    if (isValidForNextScreen()) {
      productAddDetails.stockAvailable = isAvailableToStock;
      productAddDetails.stockVisibility = showStock;
      // productAddDetails.flashDeal = isFlashSell;
      // productAddDetails.newArrival = isNovelty;
      // productAddDetails.onSell = isOnSell;
      // productAddDetails.hotSell = isTopSell;
      // productAddDetails.bestSell = isBestSell;
      // productAddDetails.featured = isFeatured;
      // productAddDetails.popular = isPopular;
      productAddDetails.isStatus = isProductActiveStatus;
      /* productAddDetails.productImage = productImageURL;
      productAddDetails.thumbImage = thumbnailImageURL;
      productAddDetails.galleryImages = galleryImageURLs; */
      Get.toNamed(AppPageNames.addProduct3rdScreen,
          arguments: productAddDetails);
    }
  }

/*   void _onSuccessUploadProductImage(
      SingleImageUploadResponse response, Map<String, dynamic> additionalData) {
    productImageURL = response.data;
    update();
    Helper.showSnackBar('Successfully uploaded product image');
  } */

  /* void onUploadThumbnailImageTap() {
    Helper.pickImage(
        onSuccessUploadSingleImage: _onSuccessOnUploadThumbnailImageTap,
        imageName: 'Thumbnail image');
  } */

  /*  void _onSuccessOnUploadThumbnailImageTap(
      SingleImageUploadResponse response, Map<String, dynamic> additionalData) {
    thumbnailImageURL = response.data;
    update();
    Helper.showSnackBar('Successfully uploaded thumbnail image');
  } */
/* 
  void onUploadAddGalleryImageTap() {
    Helper.pickImage(
        onSuccessUploadSingleImage: _onSuccessOnUploadAddGalleryImageTap,
        imageName: 'Thumbnail image');
  }

  void _onSuccessOnUploadAddGalleryImageTap(
      SingleImageUploadResponse response, Map<String, dynamic> additionalData) {
    galleryImageURLs.add(response.data);
    update();
    Helper.showSnackBar('Successfully uploaded new thumbnail image');
  } */

  /*  void onUploadEditGalleryImageTap(int index) {
    Helper.pickImage(
        onSuccessUploadSingleImage: _onSuccessOnUploadEditGalleryImageTap,
        imageName: 'Thumbnail image',
        additionalData: {'index': index});
  } */

  /* void _onSuccessOnUploadEditGalleryImageTap(
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
  } */

  /*  void onUploadDeleteGalleryImageTap(int index) {
    try {
      galleryImageURLs.removeAt(index);
      update();
      Helper.showSnackBar('Successfully removed thumbnail image');
    } catch (e) {
      AppDialogs.showErrorDialog(
          messageText: 'Something went wrong with removing existing image!');
      return;
    }
  } */

  String get appbarTitle {
    if (productAddDetails.isProductEditing) {
      return 'Edit product';
    }
    return LanguageHelper.currentLanguageText(
        LanguageHelper.addProductTransKey);
  }

  void _preSelectData() {
    isAvailableToStock = productAddDetails.stockAvailable;
    showStock = productAddDetails.stockVisibility;
    // isFlashSell = productAddDetails.flashDeal;
    // isNovelty = productAddDetails.newArrival;
    // isOnSell = productAddDetails.onSell;
    // isBestSell = productAddDetails.bestSell;
    // isTopSell = productAddDetails.bestSell;
    // isFeatured = productAddDetails.featured;
    // isPopular = productAddDetails.popular;
    isProductActiveStatus = productAddDetails.isStatus;
    // isAvailableToStock = productAddDetails.stockAvailable;
    /* productImageURL = productAddDetails.productImage;
    thumbnailImageURL = productAddDetails.thumbImage;
    galleryImageURLs = productAddDetails.galleryImages; */
    update();
  }

  void updateDraft() {
    updateDraftData();
    addEditProductDetails();
  }

  void updateDraftData() {
    productAddDetails.stockAvailable = isAvailableToStock;
    productAddDetails.stockVisibility = showStock;
    productAddDetails.isStatus = isProductActiveStatus;
    update();
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

  void _getScreenParameter() {
    final dynamic argument = Get.arguments;
    if (argument is ProductAddDetails) {
      productAddDetails = argument;
      if (productAddDetails.isProductEditing) {
        _preSelectData();
      }
    }
    log(productAddDetails.toJson().toString());
  }

  @override
  void onInit() {
    _getScreenParameter();
    super.onInit();
  }
}
