import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTagBottomSheetController extends GetxController {
  TextEditingController addTagController = TextEditingController();
  final GlobalKey<FormState> addTagKey = GlobalKey<FormState>();

  String? textFormValidator(String? text) {
    if (text != null) {
      if (text.isEmpty) return 'Can not be empty';
      if (text.length < 3) return 'Minimum length 3';
    }
    return null;
  }

  void onConfirmAddTagButtontap() {
    if (addTagKey.currentState?.validate() ?? false) {
      Get.back(
        result: addTagController.text,
      );
    }
  }
}
