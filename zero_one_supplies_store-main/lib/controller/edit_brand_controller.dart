import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:ecomikstoreapp/models/api_responses/edit_brand_response.dart';
import 'package:ecomikstoreapp/models/api_responses/single_brand_item_response.dart';
import 'package:ecomikstoreapp/models/api_responses/single_image_upload_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/image_picker_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as image_picker;

class EditBrandScreenController extends GetxController {
  String brandId = '';
  SingleBrandListItem brandItem = SingleBrandListItem.empty();
  TextEditingController brandnameEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  String token = '';
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
    AppDialogs.showProcessingDialog(
        message:
            AppLanguageTranslation.imageprocessingTransKey.toCurrentLanguage);
  }

  void processUserProfileImage(image_picker.XFile pickedImage) async {
    Uint8List? processedImage =
        await ImagePickerHelper.getProcessedImage(pickedImage);
    if (processedImage == null) {
      AppDialogs.showErrorDialog(
          messageText: AppLanguageTranslation
              .imageprocessingErrorTransKey.toCurrentLanguage);
      return;
    }
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    Object? confirmResponse = await AppDialogs.showConfirmDialog(
      shouldCloseDialogOnceYesTapped: false,
      messageText:
          AppLanguageTranslation.imageAddConfirmationTransKey.toCurrentLanguage,
      onYesTap: () async {
        return Get.back(result: true);
      },
    );
    if (confirmResponse is bool && confirmResponse) {
      String imageFileName = '';
      String id = '';
      Uri? logoUri = Uri.tryParse(brandItem.image);
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
    brandItem.image = response.data;
    update();
    Helper.showSnackBar(AppLanguageTranslation
        .successfullyUploadBrandLogoTransKey.toCurrentLanguage);
  }

  Future<void> saveChanges() async {
    final Map<String, Object> requestBody = {
      '_id': brandItem.id,
      'name': brandnameEditingController.text,
      'image': brandItem.image,
      'description': descriptionEditingController.text,
    };
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
        messageText: AppLanguageTranslation
            .successfullyUploadBrandLogoTransKey.toCurrentLanguage);

    // Get.offNamed(AppPageNames.myAccountScreen);
  }

  void _getScreenParameter() {
    final dynamic argument = Get.arguments;
    if (argument is SingleBrandListItem) {
      brandItem = argument;
    }
  }

  @override
  void onInit() {
    _getScreenParameter();
    super.onInit();
  }

  @override
  void onClose() {
    brandnameEditingController.dispose();
    descriptionEditingController.dispose();
    super.onClose();
  }
}
