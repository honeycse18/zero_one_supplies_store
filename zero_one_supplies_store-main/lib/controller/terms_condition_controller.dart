import 'dart:convert';
import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/term_condition_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsConditionScreenController extends GetxController {
  WebViewController webViewController = WebViewController();

  TermsConditionShortItem termsCondition = TermsConditionShortItem.empty();
  String setHTML(String content) {
    return ('''
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      </head>
        <body>
        $content
        </body>
      </html>
    ''');
  }

  Future<void> getTermsCondition() async {
    final Map<String, String> requestBody = {'key': 'terms_&_conditions'};

    final requestBodyJson = jsonEncode(requestBody);
    TermsConditionResponse? response =
        await APIRepo.getTermsCondition(requestBodyJson);
    if (response == null) {
      onErrorGetTermsCondition(response);
      return;
    } else if (response.error) {
      onFailureGetTermsCondition(response);
      return;
    }
    log((response.toJson().toString()));
    onSuccessGetTermsCondition(response);
  }

  void onErrorGetTermsCondition(TermsConditionResponse? response) {}

  void onFailureGetTermsCondition(TermsConditionResponse response) {}

  void onSuccessGetTermsCondition(TermsConditionResponse response) {
    termsCondition = response.data;
    webViewController.loadHtmlString(setHTML(termsCondition.description));
/*     webViewController?.loadUrl(Uri.dataFromString(
            setHTML(termsCondition.description),
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8'))
        .toString()); */
    update();
  }

  @override
  void onInit() {
    getTermsCondition();

    super.onInit();
  }
}
