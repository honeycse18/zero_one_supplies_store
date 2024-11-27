import 'dart:convert';
import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/core_api_responses/raw_api_response.dart';
import 'package:ecomikstoreapp/models/api_responses/single_image_upload_response.dart';
import 'package:ecomikstoreapp/models/api_responses/store_categories_response.dart';
import 'package:ecomikstoreapp/models/api_responses/vendor_with_store_details_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetupStoreInfoController extends GetxController {
  VendorDetails vendorDetails = VendorDetails.empty();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  // TextEditingController taxNameController = TextEditingController();
  // TextEditingController taxNumberController = TextEditingController();
  TextEditingController nidNumberController = TextEditingController();
  List<StoreCategory> storeCategories = [];
  StoreCategory? selectedStoreCategory;
  ScrollController storeLogoImagesScrollController = ScrollController();
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) {
    _isLoading.value = value;
    update();
  }
  // Uint8List? storeLogoImage;
  // Uint8List? nidCardImage;
  // Uint8List? addressProofImage;
  // String storeLogoImageURL = '';
  // String nidCardImageURL = '';
  // String addressProofImageURL = '';
  // RxList<Uint8List> storeLogoImages = <Uint8List>[].obs;
  // ScrollController nidImagesScrollController = ScrollController();
  // RxList<Uint8List> nidImages = <Uint8List>[].obs;
  // ScrollController addressProofImagesScrollController = ScrollController();
  // RxList<Uint8List> addressProofImages = <Uint8List>[].obs;

/*   void processStoreLogoImages(List<image_picker.XFile> pickedImages) async {
    List<Uint8List> processedImages =
        await ImagePickerHelper.getProcessedImages(pickedImages);
    storeLogoImages.addAll(processedImages);
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    update();
    Helper.scrollToEnd(storeLogoImagesScrollController);
  } */
  bool isSetupStoreFirstTime = false;
  String token = '';

/*   void processStoreLogoImage(image_picker.XFile pickedImage) async {
    Uint8List? processedImage =
        await ImagePickerHelper.getProcessedImage(pickedImage);
    if (processedImage == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Error occurred while processing image');
      return;
    }
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    Object? confirmResponse = await AppDialogs.showConfirmDialog(
      shouldCloseDialogOnceYesTapped: false,
      messageText: 'Are you sure to set this image as store logo?',
      onYesTap: () async {
        return Get.back(result: true);
      },
    );
    if (confirmResponse is bool && confirmResponse) {
      // storeLogoImage = processedImage;
      // update();
      String imageFileName = '';
      String id = '';
      Uri? logoUri = Uri.tryParse(vendorDetails.store.logo);
      if (logoUri != null) {
        if (logoUri.pathSegments.length >= 2) {
          // id = logoUri.pathSegments[logoUri.pathSegments.length - 2];
          // imageFileName = logoUri.pathSegments[logoUri.pathSegments.length - 1];
        }
      }
      APIHelper.uploadSingleImage(
          processedImage, _onSuccessUploadStoreLogoImage,
          imageFileName: imageFileName, id: id, additionalData: const {});
    }
  } */

/*   void pickStoreLogoImages() async {
    final List<image_picker.XFile>? pickedImages =
        await ImagePickerHelper.getPhoneImages();
    if (pickedImages == null) {
      return;
    }
    processStoreLogoImages(pickedImages);
    AppDialogs.showImageProcessingDialog();
  } */

/*   void pickStoreLogoImage() async {
    final image_picker.XFile? pickedImage =
        await ImagePickerHelper.getPhoneImage();
    if (pickedImage == null) {
      return;
    }
    processStoreLogoImage(pickedImage);
    AppDialogs.showProcessingDialog(message: 'Image is processing');
  } */

  void onStoreLogoImageButtonTap() {
    // pickStoreLogoImage();
    Helper.pickImage(
        onSuccessUploadSingleImage: _onSuccessUploadStoreLogoImage,
        token: token);
  }

  void _onSuccessUploadStoreLogoImage(SingleImageUploadResponse response,
      Map<String, dynamic> additionalData) async {
    vendorDetails.store.logo = response.data;
    update();
    Helper.showSnackBar('Successfully uploaded store logo image');
  }

/*   void processNIDCardImage(image_picker.XFile pickedImage) async {
    Uint8List? processedImage =
        await ImagePickerHelper.getProcessedImage(pickedImage);
    if (processedImage == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Error occurred while processing image');
      return;
    }
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    Object? confirmResponse = await AppDialogs.showConfirmDialog(
      shouldCloseDialogOnceYesTapped: false,
      messageText: 'Are you sure to set this image as National ID Card?',
      onYesTap: () async {
        return Get.back(result: true);
      },
    );
    if (confirmResponse is bool && confirmResponse) {
      // nidCardImage = processedImage;
      // storeLogoImage = processedImage;
      // update();
      String imageFileName = '';
      String id = '';
      Uri? logoUri = Uri.tryParse(vendorDetails.store.nidImage);
      if (logoUri != null) {
        if (logoUri.pathSegments.length >= 2) {
          // id = logoUri.pathSegments[logoUri.pathSegments.length - 2];
          // imageFileName = logoUri.pathSegments[logoUri.pathSegments.length - 1];
        }
      }
      APIHelper.uploadSingleImage(processedImage, _onUploadNIDCardImageSuccess,
          imageFileName: imageFileName, id: id, additionalData: const {});
    }
  } */

/*   void pickNIDCardImage() async {
    final image_picker.XFile? pickedImage =
        await ImagePickerHelper.getPhoneImage();
    if (pickedImage == null) {
      return;
    }
    processNIDCardImage(pickedImage);
    AppDialogs.showProcessingDialog(message: 'Image is processing');
  } */

  void onNIDCardImageButtonTap() {
    // pickNIDCardImage();
    Helper.pickImage(
        onSuccessUploadSingleImage: _onUploadNIDCardImageSuccess, token: token);
  }

  void _onUploadNIDCardImageSuccess(
      SingleImageUploadResponse response, Map<String, dynamic> additionalData) {
    vendorDetails.store.nidImage = response.data;
    update();
    Helper.showSnackBar('Successfully uploaded national card image');
  }

  void onAddressProofImageButtonTap() {
    // pickAddressProofImage();
    Helper.pickImage(
        onSuccessUploadSingleImage: _onSuccessUploadAddressProofImage,
        token: token);
  }

  void _onSuccessUploadAddressProofImage(SingleImageUploadResponse response,
      Map<String, dynamic> additionalData) async {
    vendorDetails.store.addressProof = response.data;
    update();
    Helper.showSnackBar('Successfully uploaded address proof image');
  }

/*   void processAddressProofImage(image_picker.XFile pickedImage) async {
    Uint8List? processedImage =
        await ImagePickerHelper.getProcessedImage(pickedImage);
    if (processedImage == null) {
      AppDialogs.showErrorDialog(
          messageText: 'Error occurred while processing image');
      return;
    }
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    Object? confirmResponse = await AppDialogs.showConfirmDialog(
      shouldCloseDialogOnceYesTapped: false,
      messageText: 'Are you sure to set this image as store logo?',
      onYesTap: () async {
        return Get.back(result: true);
      },
    );
    if (confirmResponse is bool && confirmResponse) {
      // addressProofImage = processedImage;
      // storeLogoImage = processedImage;
      // update();
      String imageFileName = '';
      String id = '';
      Uri? logoUri = Uri.tryParse(vendorDetails.store.addressProof);
      if (logoUri != null) {
        if (logoUri.pathSegments.length >= 2) {
          // id = logoUri.pathSegments[logoUri.pathSegments.length - 2];
          // imageFileName = logoUri.pathSegments[logoUri.pathSegments.length - 1];
        }
      }
      APIHelper.uploadSingleImage(
          processedImage, _onSuccessUploadAddressProofImage,
          imageFileName: imageFileName, id: id, additionalData: const {});
    }
  } */

/*   void pickAddressProofImage() async {
    final image_picker.XFile? pickedImage =
        await ImagePickerHelper.getPhoneImage();
    if (pickedImage == null) {
      return;
    }
    processAddressProofImage(pickedImage);
    AppDialogs.showProcessingDialog(message: 'Image is processing');
  } */

  Future<void> getStoreCategories() async {
    StoreCategoriesResponse? response =
        await APIRepo.getStoreCategories(token: token);
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log((response.toJson().toString()));
    onSuccessGetStoreCategories(response);
  }

  void onSuccessGetStoreCategories(StoreCategoriesResponse response) {
    storeCategories = response.data;
    if (!isSetupStoreFirstTime) {
      selectedStoreCategory = storeCategories.firstWhereOrNull(
          (element) => element.id == vendorDetails.store.category);
    }
    update();
  }

  void onApplyNowButtonTap() {
    // Get.toNamed(AppPageNames.addCardScreen);
    setVendorDetails();
  }

  void onStoreCategoryChanged(StoreCategory? value) {
    selectedStoreCategory = value;
  }

  void setVendorDetailsInitially() {
    vendorDetails = Helper.getVendor();
    storeNameController.text = vendorDetails.store.name;
    locationController.text = vendorDetails.store.location;
    descriptionController.text = vendorDetails.store.description;
    // taxNameController.text = vendorDetails.store.taxName;
    // taxNumberController.text = vendorDetails.store.taxNumber;
    nidNumberController.text = vendorDetails.store.nidNumber;
    update();
  }

  Map<String, Object> setVendorDetailsRequestBody() => <String, Object>{
        'name': storeNameController.text,
        // 'category': selectedStoreCategory?.id ?? '',
        'location': locationController.text,
        'description': descriptionController.text,
        // 'tax_name': taxNameController.text,
        // 'tax_number': taxNumberController.text,
        'logo': vendorDetails.store.logo,
        'nid_image': vendorDetails.store.nidImage,
        'nid_number': nidNumberController.text,
        'address_proof': vendorDetails.store.addressProof,
      };

  Future<void> setVendorDetails() async {
    final Map<String, Object> requestBody = setVendorDetailsRequestBody();
    if (vendorDetails.store.id.isNotEmpty) {
      requestBody['_id'] = vendorDetails.store.id;
    }
    if (selectedStoreCategory != null) {
      requestBody['category'] = selectedStoreCategory!.id;
    }
    String requestBodyJson = jsonEncode(requestBody);
    isLoading = true;
    RawAPIResponse? response =
        await APIRepo.storeVendorInfo(requestBodyJson, token: token);
    isLoading = false;
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log((response.toJson().toString()));
    _onSuccessSetVendorDetails(response);
  }

  void _onSuccessSetVendorDetails(RawAPIResponse response) async {
    _getLoggedInVendorDetails();
  }

  Future<void> _getLoggedInVendorDetails() async {
    isLoading = true;
    VendorDetailsResponse? response =
        await APIRepo.getVendorDetails(token: token);
    isLoading = false;
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log((response.toJson().toString()).toString());
    onSuccessGetLoggedInVendorDetails(response);
    AppDialogs.showStoreSetupSuccessDialog(
      messageText:
          'Your submission has been received successfully . Please wait while your account is being verified.....',
    );
  }

  void onSuccessGetLoggedInVendorDetails(VendorDetailsResponse response) async {
    await Helper.setLoggedInUserToLocalStorage(response.data);
  }

  void _getScreenParameter() {
    final argument = Get.arguments;
    if (argument is bool) {
      isSetupStoreFirstTime = argument;
      if (isSetupStoreFirstTime) {
        try {
          token = Get.find<String>(tag: 'token');
          Get.delete<String>(tag: 'token');
        } catch (e) {}
      }
    }
  }

  @override
  void onInit() {
    _getScreenParameter();
    if (!isSetupStoreFirstTime) {
      setVendorDetailsInitially();
    }
    getStoreCategories();
    super.onInit();
  }
}
