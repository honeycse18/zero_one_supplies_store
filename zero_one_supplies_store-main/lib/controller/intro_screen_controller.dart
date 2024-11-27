import 'package:ecomikstoreapp/models/fake_data.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IntroScreenController extends GetxController {
  /// Page controller for managing intro content sequences.
  final PageController pageController = PageController(keepPage: false);

  /// Go to next intro section
  void gotoNextIntroSection(BuildContext context) {
    // If intro section ends, goto sign in screen.
    if (pageController.page == FakeData.fakeIntroContents.length - 1) {
      Get.toNamed(AppPageNames.signInScreen);
    }
    // Goto next intro section
    pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  void _setNotificationPermission() async {
    await Helper.setNotificationPermission();
  }

  @override
  void onReady() {
    _setNotificationPermission();
    super.onReady();
  }
}
