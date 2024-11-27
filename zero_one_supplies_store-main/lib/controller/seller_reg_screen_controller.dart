import 'dart:convert';
import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecomikstoreapp/models/api_responses/sign_up_response.dart';
import 'package:ecomikstoreapp/models/api_responses/vendor_with_store_details_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerRegScreenController extends GetxController {
  /// Toggle value of remember me
  RxBool toggleRememberLogin = false.obs;
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) {
    _isLoading.value = value;
    update();
  }

  /// Toggle value of hide password
  RxBool toggleHidePassword = true.obs;
  CountryCode currentCountryCode = CountryCode.fromCountryCode('TG');

  /// Toggle value of hide confirm password
  RxBool toggleHideConfirmPassword = true.obs;

  final GlobalKey<FormState> sellerRegFormKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  void onCountryChange(CountryCode countryCode) {
    currentCountryCode = countryCode;
    update();
    log('New Country selected: $countryCode');
  }

  String get phoneNumberFormatted {
    return '${currentCountryCode.dialCode}${phoneController.text}';
  }

  String? nameFormValidator(String? text) {
    if (text != null) {
      if (text.isEmpty) {
        return LanguageHelper.currentLanguageText(
            LanguageHelper.canNotBeEmptyTransKey);
      }
      if (text.length < 3) {
        return LanguageHelper.currentLanguageText(
            LanguageHelper.minimumLengthTransKey);
      }
    }
    return null;
  }

  String? passwordFormValidator(String? text) {
    if (text != null) {
      final String? passwordErrorText = Helper.passwordFormValidator(text);
      if (passwordErrorText != null) {
        return passwordErrorText;
      }
      if (text != confirmPasswordController.text) {
        return LanguageHelper.currentLanguageText(
            LanguageHelper.mustMatchConfirmTransKey);
      }
      return null;
    }
    return null;
  }

  String? confirmPasswordFormValidator(String? text) {
    if (text != null) {
      final String? passwordErrorText = Helper.passwordFormValidator(text);
      if (passwordErrorText != null) {
        return passwordErrorText;
      }
      if (text != passwordController.text) {
        return LanguageHelper.currentLanguageText(
            LanguageHelper.mustMatchPassPassTransKey);
      }
      return null;
    }
    return null;
  }

  String? emailFormValidator(String? text) {
    if (text != null) {
      if (!GetUtils.isEmail(text)) {
        return LanguageHelper.currentLanguageText(
            LanguageHelper.invalidEmailTransKey);
      }
      return null;
    }
    return null;
  }

  String? phoneFormValidator(String? text) {
    if (text != null) {
      if (!GetUtils.isPhoneNumber(text)) {
        return LanguageHelper.currentLanguageText(
            LanguageHelper.invalidNumberTransKey);
      }
      return null;
    }
    return null;
  }

  void onPasswordSuffixEyeButtonTap() {
    toggleHidePassword.value = !toggleHidePassword.value;
  }

  void onConfirmPasswordSuffixEyeButtonTap() {
    toggleHideConfirmPassword.value = !toggleHideConfirmPassword.value;
  }

  void onSignUpButtonTap() {
    if (sellerRegFormKey.currentState?.validate() ?? false) {
      signUp();
    }
  }

  Future<void> signUp() async {
    final Map<String, Object> requestBody = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailController.text,
      'phone': phoneNumberFormatted,
      'password': passwordController.text
    };
    String requestBodyJson = jsonEncode(requestBody);
    isLoading = true;
    SignUpResponse? response = await APIRepo.signUp(requestBodyJson);
    isLoading = false;
    if (response == null) {
      onErrorSignUp(response);
      return;
    } else if (response.error) {
      onFailureSignUp(response);
      return;
    }
    log((response.toJson().toString()).toString());
    _onSuccessSignUp(response);
  }

  void onErrorSignUp(SignUpResponse? response) {
    AppDialogs.showErrorDialog(messageText: response?.msg ?? '');
  }

  void onFailureSignUp(SignUpResponse response) {
    AppDialogs.showErrorDialog(messageText: response.msg);
  }

  void _onSuccessSignUp(SignUpResponse response) async {
    // await GetStorage()
    //     .write(LocalStoredKeyName.loggedInVendorToken, response.token);
    // getLoggedInVendorDetails();
    Get.create(() => response.token, tag: 'token', permanent: false);
/*    switch (AppSingleton.instance.settings.otpOptionAsEnum) {
      case SettingsOTPOption.sms:
        Get.offNamed(AppPageNames.passwordRecoveryVerificationScreen,
            arguments: OTPScreenParameter(
                userInput: phoneNumberFormatted,
                type: 'phone',
                fromScreenName: FromScreenName.signupScreen));
        break;
      case SettingsOTPOption.email:
        Get.offNamed(AppPageNames.passwordRecoveryVerificationScreen,
            arguments: OTPScreenParameter(
                userInput: emailController.text,
                type: 'email',
                fromScreenName: FromScreenName.signupScreen));
        break;
      default:
    } */

    BuildContext? context = Get.context;
    if (context != null) {
      Get.offNamed(AppPageNames.accountCreateSuccessful);
      // Get.offNamed(AppPageNames.storeNotApprovedYetScreen);
    }
/*     Get.offNamed(AppPageNames.passwordRecoveryVerificationScreen,
        arguments: OTPScreenParameter(
            userInput: phoneNumberFormatted,
            type: 'phone',
            isFromResetPassPage: false)); */
  }

  Future<void> getLoggedInVendorDetails() async {
    VendorDetailsResponse? response = await APIRepo.getVendorDetails();
    if (response == null) {
      onErrorGetLoggedInVendorDetails(response);
      return;
    } else if (response.error) {
      onFailureGetLoggedInVendorDetails(response);
      return;
    }
    log((response.toJson().toString()).toString());
    onSuccessGetLoggedInVendorDetails(response);
  }

  void onErrorGetLoggedInVendorDetails(VendorDetailsResponse? response) {}

  void onFailureGetLoggedInVendorDetails(VendorDetailsResponse response) {}

  void onSuccessGetLoggedInVendorDetails(VendorDetailsResponse response) async {
    await Helper.setLoggedInUserToLocalStorage(response.data);
    final context = Get.context;
    if (context != null) {
      Get.toNamed(AppPageNames.setupStoreInfoScreen);
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
