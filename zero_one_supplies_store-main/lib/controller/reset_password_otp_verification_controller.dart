import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/core_api_responses/raw_api_response.dart';
import 'package:ecomikstoreapp/models/api_responses/otp_verify_response.dart';
import 'package:ecomikstoreapp/models/api_responses/reset_password_otp_response.dart';
import 'package:ecomikstoreapp/models/api_responses/sign_up_otp_verification_response.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/models/screen_parameters/otp_screen_parameter.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/app_singleton.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordOtpVerificationController extends GetxController {
  TextEditingController otpInputTextController = TextEditingController();

  OTPScreenParameter otpScreenParameter = OTPScreenParameter();
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) {
    _isLoading.value = value;
    update();
  }

  /// OTP timer duration value
  Duration otpTimerDuration = const Duration();

  /// OTP timer
  Timer otpTimer = Timer(
    const Duration(seconds: 1),
    () {},
  );

  void _getScreenParameter() {
    final argument = Get.arguments;
    if (argument is OTPScreenParameter) {
      otpScreenParameter = argument;
    }
  }

  bool isDurationOver() {
    return otpTimerDuration.inSeconds <= 0;
  }

  void onSendCodeButtonTap() {
    sendCode();
  }

  void onResendButtonTap() {
    /* if (isDurationOver()) {
      _resetTimer();
      resendCode();
    } else {
      AppDialogs.showErrorDialog(messageText: 'Please wait few more seconds');
    } */
    resendCode();
  }

  void _resetTimer() {
    otpTimerDuration = const Duration(minutes: 2);
  }

  Future<void> resendCode() async {
    if (otpScreenParameter.fromScreenName ==
        FromScreenName.resetOrForgetPassScreen) {
      final Map<String, Object> requestBody = {
        'user_input': otpScreenParameter.userInput,
        'type': otpScreenParameter.type,
        'role': Constants.userRoleVendor,
      };
      String requestBodyJson = jsonEncode(requestBody);
      isLoading = true;
      ResetPasswordOtpResponse? response =
          await APIRepo.sendResetOtp(requestBodyJson);
      isLoading = false;
      if (response == null) {
        onErrorResendCode(response);
        return;
      } else if (response.error) {
        onFailureResendCode(response);
        return;
      }
      log((response.toJson()).toString());
      onSuccessResendCode();
    } else {
      final Map<String, Object> requestBody = {
        'role': Constants.userRoleVendor,
      };
      switch (AppSingleton.instance.settings.otpOptionAsEnum) {
        case SettingsOTPOption.email:
          requestBody['email'] = otpScreenParameter.userInput;
          break;
        case SettingsOTPOption.sms:
          requestBody['phone'] = otpScreenParameter.userInput;
          break;
        default:
          requestBody['email'] = otpScreenParameter.userInput;
      }

      String requestBodyJson = jsonEncode(requestBody);
      isLoading = true;
      RawAPIResponse? response =
          await APIRepo.sendVerifyVendorOTP(requestBodyJson);
      isLoading = false;
      if (response == null) {
        onErrorResendOTP(response);
        return;
      } else if (response.error) {
        onFailureResendOTP(response);
        return;
      }
      log(response.toJson().toString());
      onSuccessResendCode();
    }
  }

// For ResetPassword OTP
  void onErrorResendCode(ResetPasswordOtpResponse? response) {
    AppDialogs.showErrorDialog(messageText: response?.msg ?? '');
  }

  void onFailureResendCode(ResetPasswordOtpResponse response) {
    AppDialogs.showErrorDialog(messageText: response.msg);
  }

  void onSuccessResendCode() {
    _resetTimer();
  }

// For SignUp page OTP
  void onErrorResendOTP(RawAPIResponse? response) {
    AppDialogs.showErrorDialog(messageText: response?.msg ?? '');
  }

  void onFailureResendOTP(RawAPIResponse response) {
    AppDialogs.showErrorDialog(messageText: response.msg);
  }

  Future<void> sendCode() async {
    if (otpScreenParameter.fromScreenName ==
        FromScreenName.resetOrForgetPassScreen) {
      final Map<String, Object> requestBody = {
        'otp': otpInputTextController.text,
        'user_input': otpScreenParameter.userInput,
        'role': Constants.userRoleVendor,
      };
      String requestBodyJson = jsonEncode(requestBody);
      isLoading = true;
      OtpVerifyResponse? response =
          await APIRepo.verifyOtpForResetPass(requestBodyJson);
      isLoading = false;
      if (response == null) {
        onErrorResponse(response);
        return;
      } else if (response.error) {
        onFailureResponse(response);
        return;
      }
      log((response.toJson().toString()).toString());
      onSuccessResponse(response);
    } else {
      final Map<String, Object> requestBody = {
        'otp': otpInputTextController.text,
        'role': Constants.userRoleVendor,
      };
      switch (AppSingleton.instance.settings.otpOptionAsEnum) {
        case SettingsOTPOption.email:
          requestBody['email'] = otpScreenParameter.userInput;
          break;
        case SettingsOTPOption.sms:
          requestBody['phone'] = otpScreenParameter.userInput;
          break;
        default:
          requestBody['email'] = otpScreenParameter.userInput;
      }

      String requestBodyJson = jsonEncode(requestBody);
      isLoading = true;
      SignUpOtpVerificationResponse? response =
          await APIRepo.signUpOtpVerification(requestBodyJson);
      isLoading = false;
      if (response == null) {
        onErrorResponseOfVendorVerify(response);
        return;
      } else if (response.error) {
        onFailureResponseVendorVerify(response);
        return;
      }
      log(response.toJson().toString());
      onSuccessResponseOfVendorVerify(response);
    }
  }

// From reset Password page
  void onErrorResponse(OtpVerifyResponse? response) {
    AppDialogs.showErrorDialog(messageText: response?.msg ?? '');
  }

  void onFailureResponse(OtpVerifyResponse response) {
    AppDialogs.showErrorDialog(messageText: response.msg);
  }

  void onSuccessResponse(OtpVerifyResponse response) {
    BuildContext? context = Get.context;

    if (context != null) {
      Get.offNamed(AppPageNames.passwordRecoveryCreateScreen,
          arguments: response.token);
    }
  }

  // From sign in page
  void onErrorResponseOfVendorVerify(SignUpOtpVerificationResponse? response) {
    AppDialogs.showErrorDialog(messageText: response?.msg ?? '');
  }

  void onFailureResponseVendorVerify(SignUpOtpVerificationResponse response) {
    AppDialogs.showErrorDialog(messageText: response.msg);
  }

  void onSuccessResponseOfVendorVerify(SignUpOtpVerificationResponse response) {
    BuildContext? context = Get.context;
    if (context != null) {
      Get.offNamed(AppPageNames.accountCreateSuccessful);
      // Get.offNamed(AppPageNames.storeNotApprovedYetScreen);
    }
  }

  @override
  void onInit() {
    _getScreenParameter();
    otpTimerDuration = const Duration(minutes: 2);
    otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (otpTimerDuration.inSeconds > 0) {
        otpTimerDuration = otpTimerDuration - const Duration(seconds: 1);
      }
      update();
    });
    // if (!otpScreenParameter.isFromResetPassPage) {
    //   resendCode();
    // }
    super.onInit();
  }

  @override
  void onClose() {
    if (otpTimer.isActive) {
      otpTimer.cancel();
    }
    super.onClose();
  }
}
