import 'dart:convert';
import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecomikstoreapp/models/api_responses/reset_password_otp_response.dart';
import 'package:ecomikstoreapp/models/screen_parameters/otp_screen_parameter.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordPhoneOtpController extends GetxController {
  TextEditingController phoneTextEditingController = TextEditingController();
  CountryCode currentCountryCode = CountryCode.fromCountryCode('TG');
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) {
    _isLoading.value = value;
    update();
  }

  void onSendCodeButtonTap() {
    sendCode();
  }

  void onCountryChange(CountryCode countryCode) {
    currentCountryCode = countryCode;
    update();
  }

  String get phoneNumberFormatted {
    return '${currentCountryCode.dialCode}${phoneTextEditingController.text}';
  }

  Future<void> sendCode() async {
    final Map<String, Object> requestBody = {
      'user_input': phoneNumberFormatted,
      'type': 'phone',
      'role': Constants.userRoleVendor,
    };
    String requestBodyJson = jsonEncode(requestBody);
    isLoading = true;
    ResetPasswordOtpResponse? response =
        await APIRepo.sendResetOtp(requestBodyJson);
    isLoading = false;
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log((response.toJson().toString()).toString());
    _onSuccessSendCode();
  }

  void _onSuccessSendCode() {
    BuildContext? context = Get.context;
    if (context != null) {
      Get.offNamed(AppPageNames.passwordRecoveryVerificationScreen,
          arguments: OTPScreenParameter(
              userInput: phoneNumberFormatted, type: 'phone'));
    }
  }
}
