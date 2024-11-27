import 'dart:convert';
import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/reset_password_create_new_password_response.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordCreateNewPasswordController extends GetxController {
  TextEditingController newPassword1EditingController = TextEditingController();
  TextEditingController newPassword2EditingController = TextEditingController();
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) {
    _isLoading.value = value;
    update();
  }

  String theToken = '_token';

  /// Toggle value of hide new password
  bool toggleHideNewPassword = true;

  /// Toggle value of hide confirm password
  bool toggleHideConfirmPassword = true;

  /// Toggle value of over 5 characters requirement
  bool isPasswordOver5Characters = false;

  /// Toggle value of at least 1 digit number
  bool isPasswordHasAtLeastSingleNumberDigit = false;

  /// Create new password editing controller
  // TextEditingController newPasswordEditingController = TextEditingController();

  /// Password strong level value
  PasswordStrongLevel passwordStrongLevel = PasswordStrongLevel.none;

  /// Find if any password text character has number digit.
  bool _detectPasswordNumber(String passwordText) =>
      passwordText.contains(RegExp(r'[0-9]'));

  /// Check password
  void passwordCheck(String passwordText) {
    _setPasswordStrongLevel(passwordText);
    if (passwordText.length > 5) {
      isPasswordOver5Characters = true;
    } else {
      isPasswordOver5Characters = false;
    }
    if (_detectPasswordNumber(passwordText)) {
      isPasswordHasAtLeastSingleNumberDigit = true;
    } else {
      isPasswordHasAtLeastSingleNumberDigit = false;
    }
  }

  /// Simple password strong level algorithm form new password field
  void _setPasswordStrongLevel(String passwordText) {
    final isNumberFound = _detectPasswordNumber(passwordText);
    if (passwordText.isEmpty) {
      passwordStrongLevel = PasswordStrongLevel.none;
    } else {
      if (passwordText.length > 5 && isNumberFound) {
        passwordStrongLevel = PasswordStrongLevel.strong;
        if (passwordText.length > 11 && isNumberFound) {
          passwordStrongLevel = PasswordStrongLevel.veryStrong;
        }
      } else if (passwordText.length > 5) {
        passwordStrongLevel = PasswordStrongLevel.normal;
      } else {
        passwordStrongLevel = PasswordStrongLevel.weak;
      }
    }
  }

  void onSavePasswordButtonTap() {
    if (passMatched()) {
      sendPass();
    } else {
      AppDialogs.showErrorDialog(
          messageText: LanguageHelper.currentLanguageText(
              LanguageHelper.passNotMassTransKey));
    }
  }

  bool passMatched() {
    return newPassword1EditingController.text ==
        newPassword2EditingController.text;
  }

  Future<void> sendPass() async {
    final Map<String, Object> requestBody = {
      'password': newPassword1EditingController.text,
      'confirmPassword': newPassword2EditingController.text,
      'role': Constants.userRoleVendor,
    };
    String requestBodyJson = jsonEncode(requestBody);
    isLoading = true;
    ResetPasswordCreateNewPasswordResponse? response =
        await APIRepo.resetPassCreateNewPass(requestBodyJson, theToken);
    isLoading = false;
    log('${response?.toJson()} $theToken');
    if (response == null) {
      onErrorSavePassword(response);
      return;
    } else if (response.error) {
      onFailureSavePassword(response);
      return;
    }
    onSuccessSavePassword();
  }

  void onErrorSavePassword(ResetPasswordCreateNewPasswordResponse? response) {
    AppDialogs.showErrorDialog(
        messageText: response?.msg ??
            LanguageHelper.currentLanguageText(
                LanguageHelper.errorSavingPassTransKey));
  }

  void onFailureSavePassword(ResetPasswordCreateNewPasswordResponse response) {
    AppDialogs.showErrorDialog(messageText: response.msg);
  }

  void onSuccessSavePassword() {
    BuildContext? context = Get.context;
    if (context != null) {
      Get.offNamed(AppPageNames.passwordChangeSuccessScreen);
    }
  }

  void _getScreenParameters() {
    final argument = Get.arguments;
    if (argument is String) {
      theToken = argument;
    }
  }

  @override
  void onInit() {
    _getScreenParameters();
    // newPasswordEditingController = TextEditingController();
    newPassword1EditingController.addListener(() {
      passwordCheck(newPassword1EditingController.text);
      update();
    });
    super.onInit();
  }
}
