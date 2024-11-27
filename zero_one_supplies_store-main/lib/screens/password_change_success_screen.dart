import 'package:ecomikstoreapp/controller/passward_changed_success_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordChangSuccessScreen extends StatelessWidget {
  const PasswordChangSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordChangSuccessScreenScreenController>(
        init: PasswordChangSuccessScreenScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                  /* <-------- Empty appbar with back button --------> */
                  appBar: CoreWidgets.appBarWidget(screenContext: context),
                  /* <-------- Content --------> */
                  body: CustomScaffoldBodyWidget(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /* <---- Password change illustration image ----> */
                            Image.asset(
                                AppAssetImages
                                    .passwordChangeSuccessIllustration,
                                cacheHeight: (240 * 1.5).toInt(),
                                cacheWidth: (260 * 1.5).toInt(),
                                height: 240,
                                width: 260),
                            AppGaps.hGap56,
                            HighlightAndDetailTextWidget(
                                isSpaceShorter: true,
                                slogan: LanguageHelper.currentLanguageText(
                                    LanguageHelper.greatPassChangedTransKey),
                                subtitle: LanguageHelper.currentLanguageText(
                                    LanguageHelper.dontWorryTransKey)),
                            AppGaps.hGap30,
                          ],
                        ),
                      ),
                    ),
                  ),
                  /* <-------- Bottom bar button --------> */
                  bottomNavigationBar: CustomScaffoldBottomBarWidget(
                    child: CustomStretchedTextButtonWidget(
                        buttonText: LanguageHelper.currentLanguageText(
                            LanguageHelper.nowLogInTransKey),
                        onTap: () {
                          Get.offNamed(AppPageNames.signInScreen);
                        }),
                  )),
            ));
  }
}
