import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/languages_response.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/app_singleton.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:get/get.dart';

class LanguageScreenController extends GetxController {
  List<Language> languages = [];
  Language selectedLanguage = Language();
  LanguageSetting currentLanguage = LanguageSetting.english;

  void onLanguageTap(Language language) async {
    selectedLanguage = language;
    update();
    await AppSingleton.instance.localBox
        .put(Constants.hiveDefaultLanguageKey, language.name);
  }

  Future<void> getLanguage() async {
    LanguagesResponse? response = await APIRepo.fetchLanguages();
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onError(response.msg);
      return;
    }
    log(response.toJson().toString());
    _onSuccessGetLanguage(response);
  }

  void _onSuccessGetLanguage(LanguagesResponse response) async {
    languages = response.data.where((language) => language.active).toList();
    final dynamic currentLanguageName =
        AppSingleton.instance.localBox.get(Constants.hiveDefaultLanguageKey);
    if (currentLanguageName is String) {
      final Language? foundLanguage = languages
          .firstWhereOrNull((language) => language.name == currentLanguageName);
      if (foundLanguage != null) {
        selectedLanguage = foundLanguage;
      }
    }
    update();
  }

  @override
  void onInit() {
    getLanguage();
    super.onInit();
  }
}
