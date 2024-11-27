import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:ecomikstoreapp/models/api_responses/brand_list_api_response.dart';
import 'package:ecomikstoreapp/models/api_responses/edit_brand_response.dart';
import 'package:ecomikstoreapp/models/api_responses/single_image_upload_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/image_picker_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as image_picker;

class AddBrandScreenController extends GetxController {
  BrandListItem currentBrand = BrandListItem.empty();
  TextEditingController brandnameEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  String token = '';

  bool get isEditing => !currentBrand.isEmpty;

  void userProfileImageAdd() {
    pickUserImage();
  }

  void pickUserImage() async {
    final image_picker.XFile? pickedImage =
        await ImagePickerHelper.getPhoneImage();
    if (pickedImage == null) {
      return;
    }
    processUserProfileImage(pickedImage);
    AppDialogs.showProcessingDialog(message: 'Image is processing');
  }

  void processUserProfileImage(image_picker.XFile pickedImage) async {
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
      messageText: 'Are you sure to set this image as brand logo?',
      onYesTap: () async {
        return Get.back(result: true);
      },
    );
    if (confirmResponse is bool && confirmResponse) {
      String imageFileName = '';
      String id = '';
      Uri? logoUri = Uri.tryParse(currentBrand.image);
      if (logoUri != null) {
        if (logoUri.pathSegments.length >= 2) {}
      }
      APIHelper.uploadSingleImage(
          processedImage, _onUploadUserProfileImageSuccess,
          imageFileName: imageFileName,
          id: id,
          additionalData: const {},
          token: '');
    }
  }

  void onSaveChangesButtonTap() {
    saveChanges();
  }

  void _onUploadUserProfileImageSuccess(
      SingleImageUploadResponse response, Map<String, dynamic> additionalData) {
    currentBrand.image = response.data;
    update();
    Helper.showSnackBar('Successfully uploaded brand logo');
  }

  Future<void> saveChanges() async {
    final Map<String, Object> requestBody = {
      'name': brandnameEditingController.text,
      'image': currentBrand.image,
      'description': descriptionEditingController.text,
    };
    if (isEditing) {
      requestBody['_id'] = currentBrand.id;
    }
    String requestBodyJson = jsonEncode(requestBody);
    EditBrandResponse? response = await APIRepo.editBrand(requestBodyJson);
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log(response.toJson().toString());
    _onSuccessEditingAccountResponse(response);
  }

  void _onSuccessEditingAccountResponse(EditBrandResponse response) {
    AppDialogs.showSuccessDialog(
        messageText: 'Successfully uploaded brand logo!');

    // Get.offNamed(AppPageNames.myAccountScreen);
  }

  void _getScreenParameter() {
    final argument = Get.arguments;
    if (argument is BrandListItem) {
      currentBrand = argument;
    }
  }

  void _initializeBrandForm() {
    brandnameEditingController.text = currentBrand.name;
    descriptionEditingController.text = currentBrand.description;
  }

  @override
  void onInit() {
    _getScreenParameter();
    if (isEditing) {
      _initializeBrandForm();
    }
    super.onInit();
  }

  @override
  void onClose() {
    brandnameEditingController.dispose();
    descriptionEditingController.dispose();
    super.onClose();
  }
}
