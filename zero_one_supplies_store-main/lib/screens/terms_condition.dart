import 'package:ecomikstoreapp/controller/terms_condition_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Get screen size
    return GetBuilder<TermsConditionScreenController>(
        init: TermsConditionScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Empty appbar with back button --------> */
                /* <-------- Appbar --------> */
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context,
                    titleWidget: Text(controller.termsCondition.title)),
                // appBar: CoreWidgets.appBarWidget(screenContext: context),
                /* <-------- Content --------> */

                body: Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: WebViewWidget(
                            controller: controller.webViewController),
                      )
                    ],
                  ),
                ),

                /* <-------- Bottom bar of sign up text --------> */
              ),
            ));
  }
}
