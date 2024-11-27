import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:ecomikstoreapp/models/api_responses/edit_accound_response.dart';
import 'package:ecomikstoreapp/models/api_responses/single_image_upload_response.dart';
import 'package:ecomikstoreapp/models/api_responses/vendor_with_store_details_response.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_components.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/image_picker_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as image_picker;

class EditAccountScreenController extends GetxController {
  VendorDetails vendorAccountDetails = VendorDetails.empty();
  List<String> genderOptions = ['Male', 'Female'];

  DateTime selectedDate = AppComponents.defaultUnsetDateTime;
  final GlobalKey<FormState> userUpdateProfileFormKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  // TextEditingController genderController = TextEditingController();
  String? selectedGender = Constants.userGenderMale;
  // Need to update this line later...
  // String imageURI =
  //     'https://appstick-resources.s3.ap-southeast-1.amazonaws.com/01supplies/store/6458942906c88c812ed2ec60/image.jpg';
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) {
    _isLoading.value = value;
    update();
  }

  Future<void> updateUser() async {
    final VendorDetails currentVendorUpdated = Helper.getVendor();
    currentVendorUpdated.firstName = firstNameController.text;
    currentVendorUpdated.lastName = lastNameController.text;
    currentVendorUpdated.email = emailController.text;
    currentVendorUpdated.image = vendorAccountDetails.image;
    currentVendorUpdated.phone = phoneController.text;
    // currentVendorUpdated.birthday =
    //     APIHelper.getSafeDateTimeValue(dateOfBirthController.text);
    currentVendorUpdated.gender =
        UserGender.toEnumValueFromViewable(selectedGender ?? '').stringValue;
    await Helper.setLoggedInUserToLocalStorage(currentVendorUpdated);
  }

  String? nameFormValidator(String? name) {
    if (name != null) {
      if (name.isEmpty) {
        return AppLanguageTranslation.canNotEmptyTransKey.toCurrentLanguage;
      }
      if (name.length < 3) {
        return AppLanguageTranslation.minimumLengthTransKey.toCurrentLanguage;
      }
    }
    return null;
  }
/* 
  String? emailFormValidator(String? text) {
    if (text != null) {
      if (!GetUtils.isEmail(text)) {
        return 'Invalid email format';
      }
      return null;
    }
    return null;
  } */

  String? phoneFormValidator(String? text) {
    if (text != null) {
      if (!GetUtils.isPhoneNumber(text)) {
        return AppLanguageTranslation.invalidNumberTransKey.toCurrentLanguage;
      }
      return null;
    }
    return null;
  }

  void onSaveChangesButtonTap() {
    if (userUpdateProfileFormKey.currentState?.validate() ?? false) {
      saveChanges();
    } else {
      AppDialogs.showErrorDialog(
          messageText:
              AppLanguageTranslation.somethingWrongTransKey.toCurrentLanguage);
    }
  }

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
          AppLanguageTranslation.imageSetConfirmTransKey.toCurrentLanguage,
      onYesTap: () async {
        return Get.back(result: true);
      },
    );
    if (confirmResponse is bool && confirmResponse) {
      String imageFileName = '';
      String id = '';
      Uri? logoUri = Uri.tryParse(vendorAccountDetails.image);
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

  void _onUploadUserProfileImageSuccess(
      SingleImageUploadResponse response, Map<String, dynamic> additionalData) {
    vendorAccountDetails.image = response.data;
    update();
    Helper.showSnackBar(AppLanguageTranslation
        .successFullyProfileImageTransKey.toCurrentLanguage);
  }

  Future<void> saveChanges() async {
    final Map<String, Object> requestBody = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailController.text,
      'image': vendorAccountDetails.image,
      'phone': phoneController.text,
      'birthday':
          APIHelper.toServerDateTimeFormattedStringFromDateTime(selectedDate),
      'gender':
          UserGender.toEnumValueFromViewable(selectedGender ?? '').stringValue,
    };
    String requestBodyJson = jsonEncode(requestBody);
    isLoading = true;
    EditAccountResponse? response = await APIRepo.editAccount(requestBodyJson);
    isLoading = false;
    if (response == null) {
      AppDialogs.showErrorDialog(
          messageText:
              AppLanguageTranslation.somethingWrongTransKey.toCurrentLanguage);
      return;
    } else if (response.error) {
      AppDialogs.showErrorDialog(messageText: response.msg);
      return;
    }
    log(response.toJson().toString());
    onSuccessEditingAccountResponse(response);
  }

  void onSuccessEditingAccountResponse(EditAccountResponse response) async {
    await updateUser();

    AppDialogs.showSuccessDialog(
        messageText: AppLanguageTranslation
            .accountUpdatedSuccessfullyTransKey.toCurrentLanguage);

    // Get.offNamed(AppPageNames.myAccountScreen);
  }

  void fillUserDetails() {
    vendorAccountDetails = Helper.getVendor();
    firstNameController.text = vendorAccountDetails.firstName;
    lastNameController.text = vendorAccountDetails.lastName;
    emailController.text = vendorAccountDetails.email;
    phoneController.text = vendorAccountDetails.phone;
    // dateOfBirthController.text =
    //     Helper.ddMMyyFormattedDateTime(vendorAccountDetails.birthday);
    selectedGender = _setSelectedGender();
    // currentUserUpdated.image = imageURI;
  }

  String _setSelectedGender() {
    if (UserGender.toEnumValue(vendorAccountDetails.gender) ==
        UserGender.unknown) {
      return UserGender.male.stringValueForView;
    }
    return UserGender.toEnumValue(vendorAccountDetails.gender)
        .stringValueForView;
  }

  @override
  void onInit() {
    fillUserDetails();
    super.onInit();
  }
}
