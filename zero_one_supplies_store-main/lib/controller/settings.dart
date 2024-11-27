import 'package:ecomikstoreapp/utils/app_singleton.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:get/get.dart';

class SettingsScreenController extends GetxController {
  RxBool toggleNotification = false.obs;
  String get currentLanguageText {
    final dynamic currentLanguageName =
        AppSingleton.instance.localBox.get(Constants.hiveDefaultLanguageKey);
    if (currentLanguageName is String) {
      return currentLanguageName;
    }
    return '';
  }
}
