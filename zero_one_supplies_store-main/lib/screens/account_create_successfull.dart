import 'package:ecomikstoreapp/controller/accountcreatesuccessful_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountCreateSuccessful extends StatelessWidget {
  const AccountCreateSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountCreateSuccessfulController>(
        init: AccountCreateSuccessfulController(),
        global: false,
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                  /* <-------- Empty appbar with back button --------> */
                  appBar: CoreWidgets.appBarWidget(
                      screenContext: context, hasBackButton: false),
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
                                AppAssetImages.signUpSuccessIllustration,
                                cacheHeight: (240 * 1.5).toInt(),
                                cacheWidth: (260 * 1.5).toInt(),
                                height: 240,
                                width: 260),
                            AppGaps.hGap56,
                            HighlightAndDetailTextWidget(
                                isSpaceShorter: true,
                                slogan: LanguageHelper.currentLanguageText(
                                    LanguageHelper
                                        .accountSuccessFullyCreatedTransKey),
                                subtitle: LanguageHelper.currentLanguageText(
                                    LanguageHelper.canLoginAccountTransKey)),
                            AppGaps.hGap30,
                          ],
                        ),
                      ),
                    ),
                  ),
                  /* <-------- Bottom bar button --------> */
                  bottomNavigationBar: CustomScaffoldBottomBarWidget(
                    child: CustomStretchedTextButtonWidget(
                        buttonText: AppLanguageTranslation
                            .setupStoreTransKey.toCurrentLanguage,
                        onTap: () {
                          Get.toNamed(AppPageNames.setupStoreInfoScreen,
                              arguments: true);
                          controller.update();
                        }),
                  )),
            ));
  }
}
