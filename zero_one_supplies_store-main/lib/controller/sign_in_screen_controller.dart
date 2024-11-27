import 'dart:convert';
import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/core_api_responses/raw_api_response.dart';
import 'package:ecomikstoreapp/models/api_responses/sign_in_response.dart';
import 'package:ecomikstoreapp/models/api_responses/vendor_with_store_details_response.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/app_singleton.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/constants/app_local_stored_keys.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignInController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passTextEditingController = TextEditingController();

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) {
    _isLoading.value = value;
    update();
  }

  /// Toggle value of remember me
  RxBool toggleRememberLogin = false.obs;

  /// Toggle value of hide password
  RxBool toggleHidePassword = true.obs;

  void onForgetPasswordButtonTap() {
    switch (AppSingleton.instance.settings.otpOptionAsEnum) {
      case SettingsOTPOption.email:
        // Go to password recovery enter email address screen
        Get.toNamed(AppPageNames.passwordRecoveryEmailPromptScreen);
        break;
      case SettingsOTPOption.sms:
        // Go to password recovery enter phone number screen
        Get.toNamed(AppPageNames.passwordRecoveryPromptScreen);
        break;
      default:
    }
    // Goto verification method selection screen.
    // Get.toNamed(AppPageNames.passwordRecoverySelectScreen);
  }

  void onSignInButtonTap() {
    signIn();
  }

  void onPasswordHideButtonTap() {
    toggleHidePassword.value = !toggleHidePassword.value;
  }

  void onToggleRememberMe(bool value) async {
    toggleRememberLogin.value = value;
    await GetStorage().write(LocalStoredKeyName.rememberMe, value);
  }

  Future<void> signIn() async {
    isLoading = true;
    final Map<String, Object> requestBody = {
      'email': emailTextEditingController.text,
      'password': passTextEditingController.text,
      'remember_me': toggleRememberLogin.value,
    };
    final String? fcmToken = await Helper.getFCMToken;
    if (fcmToken != null) {
      requestBody['fcm_token'] = fcmToken;
    }
    String requestBodyJson = jsonEncode(requestBody);
    SignInResponse? response = await APIRepo.login(requestBodyJson);
    if (response == null) {
      isLoading = false;
      onErrorSignIn(response);
      return;
    } else if (response.error) {
      isLoading = false;
      onFailureSignIn(response);
      return;
    } else if (response.role != Constants.userRoleVendor) {
      isLoading = false;
      onWrongUserTypeSignIn();
      return;
    } else if (!response.verified) {
      isLoading = false;
      onUnVerifiedSignIn(response);
      return;
    }
    log((response.toJson().toString()).toString());
    onSuccessSignIn(response);
  }

  Future<void> onUnVerifiedSignIn(SignInResponse response) async {
    await AppDialogs.showErrorDialog(
        messageText: 'your account is being verified........',
        titleText: 'Please Wait !');

    /* final Object? dialogResult = await AppDialogs.showActionableDialog(
        messageText: LanguageHelper.currentLanguageText(
            LanguageHelper.accountNotVerifiedTransKey),
        buttonText: LanguageHelper.currentLanguageText(
            LanguageHelper.verifyNowTransKey),
        onTap: () {
          Get.back(result: true);
          sendOTPCode(response);
        });
    if (dialogResult is bool) {
      if (dialogResult) {
        switch (AppSingleton.instance.settings.otpOptionAsEnum) {
          case SettingsOTPOption.email:
            Get.toNamed(AppPageNames.passwordRecoveryVerificationScreen,
                arguments: OTPScreenParameter(
                    userInput: emailTextEditingController.text,
                    type: 'email',
                    fromScreenName: FromScreenName.signupScreen));
            break;
          case SettingsOTPOption.sms:
            Get.toNamed(AppPageNames.passwordRecoveryVerificationScreen,
                arguments: OTPScreenParameter(
                    userInput: response.phone,
                    type: 'phone',
                    fromScreenName: FromScreenName.signupScreen));
          default:
        }
        // Get.toNamed(AppPageNames.passwordRecoveryVerificationScreen,
        //     arguments: OTPScreenParameter(
        //         userInput: response.phone,
        //         type: 'phone',
        //         fromScreenName: FromScreenName.signupScreen));
      }
    } */
  }

  void onErrorSignIn(SignInResponse? response) {
    AppDialogs.showErrorDialog(messageText: response?.msg ?? '');
  }

  void onFailureSignIn(SignInResponse response) {
    AppDialogs.showErrorDialog(messageText: response.msg);
  }

  void onWrongUserTypeSignIn() {
    AppDialogs.showErrorDialog(
        messageText: LanguageHelper.currentLanguageText(
            LanguageHelper.userNotExistTransKey));
  }

  void onSuccessSignIn(SignInResponse response) async {
    await GetStorage()
        .write(LocalStoredKeyName.loggedInVendorToken, response.token);
    getLoggedInVendorDetails();
  }

  Future<void> getLoggedInVendorDetails() async {
    VendorDetailsResponse? response = await APIRepo.getVendorDetails();
    isLoading = false;
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
    BuildContext? context = Get.context;
    if (response.data.store.status == 'approved') {
      if (context != null) {
        Get.offAllNamed(AppPageNames.homeNavigatorScreen);
      }
    } else {
      Get.toNamed(AppPageNames.storeNotApprovedYetScreen);
    }
  }

  @override
  void onClose() {
    emailTextEditingController.dispose();
    passTextEditingController.dispose();
    super.onClose();
  }

  Future<void> sendOTPCode(SignInResponse responseBefore) async {
    final Map<String, Object> requestBody = {
      'role': Constants.userRoleVendor,
    };

    switch (AppSingleton.instance.settings.otpOptionAsEnum) {
      case SettingsOTPOption.email:
        requestBody['email'] = emailTextEditingController.text;
        break;
      case SettingsOTPOption.sms:
        requestBody['phone'] = responseBefore.phone;
        break;
      default:
        requestBody['email'] = emailTextEditingController.text;
    }
    String requestBodyJson = jsonEncode(requestBody);
    isLoading = true;
    RawAPIResponse? response =
        await APIRepo.sendVerifyVendorOTP(requestBodyJson);
    isLoading = false;
    if (response == null) {
      onErrorSendOTP(response);
      return;
    } else if (response.error) {
      onFailureSendOTP(response);
      return;
    }
    log(response.toJson().toString());
  }

  void onErrorSendOTP(RawAPIResponse? response) {
    AppDialogs.showErrorDialog(messageText: response?.msg ?? '');
  }

  void onFailureSendOTP(RawAPIResponse response) {
    AppDialogs.showErrorDialog(messageText: response.msg);
  }

  void _getScreenParameter() {
    final argument = Get.arguments;
    if (argument is bool) {
      final isSessionExpired = argument;
      if (isSessionExpired) {
        AppDialogs.showErrorDialog(
            messageText: AppLanguageTranslation
                .sessionExpiredPleaseLoginTransKey.toCurrentLanguage);
      }
    }
  }

  @override
  void onInit() {
    _getScreenParameter();
    toggleRememberLogin.value = Helper.isRememberedMe();
    super.onInit();
  }
}
