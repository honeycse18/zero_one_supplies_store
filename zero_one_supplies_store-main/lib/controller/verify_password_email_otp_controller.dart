import 'dart:convert';
import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/reset_password_otp_response.dart';
import 'package:ecomikstoreapp/models/screen_parameters/otp_screen_parameter.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordEmailOtpController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) {
    _isLoading.value = value;
    update();
  }

  void onSendCodeButtonTap() {
    sendCode();
  }

  Future<void> sendCode() async {
    final Map<String, Object> requestBody = {
      'user_input': emailTextEditingController.text,
      'type': 'email',
      'role': Constants.userRoleVendor,
    };
    String requestBodyJson = jsonEncode(requestBody);
    isLoading = true;
    ResetPasswordOtpResponse? response =
        await APIRepo.sendResetOtp(requestBodyJson);
    isLoading = false;
    if (response == null) {
      onErrorSendCode(response);
      return;
    } else if (response.error) {
      onFailureSendCode(response);
      return;
    }
    log((response.toJson().toString()).toString());
    onSuccessSendCode();
  }

  void onErrorSendCode(ResetPasswordOtpResponse? response) {
    AppDialogs.showErrorDialog(messageText: response?.msg ?? '');
  }

  void onFailureSendCode(ResetPasswordOtpResponse response) {
    AppDialogs.showErrorDialog(messageText: response.msg);
  }

  void onSuccessSendCode() {
    // AppDialogs.showSuccessDialog(messageText: 'Code sent successfully.');
    BuildContext? context = Get.context;
    if (context != null) {
      Get.offNamed(AppPageNames.passwordRecoveryVerificationScreen,
          arguments: OTPScreenParameter(
              userInput: emailTextEditingController.text, type: 'email'));
    }
  }
}
