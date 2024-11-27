import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/core_api_responses/raw_api_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:get/get.dart';

class DeleteAccountScreenController extends GetxController {
  Future<void> deleteAccount() async {
    RawAPIResponse? response = await APIRepo.deleteAccount();
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log((response.toJson().toString()));
    onSuccessGetTermsCondition(response);
  }

  void onSuccessGetTermsCondition(RawAPIResponse response) async {
    await AppDialogs.showSuccessDialog(messageText: response.msg);
    Get.offAllNamed(AppPageNames.introScreen);
    update();
  }
}
