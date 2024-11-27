import 'package:ecomikstoreapp/controller/empty_status_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmptyStatusScreenController>(
        init: EmptyStatusScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: Center(
                      child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /* <---- Congratulation illustration ----> */
                        Image.asset(AppAssetImages.congratulationIllustration,
                            height: 272),
                        AppGaps.hGap56,
                        HighlightAndDetailTextWidget(
                            slogan: LanguageHelper.currentLanguageText(
                                LanguageHelper.congratulationsTransKey),
                            subtitle: LanguageHelper.currentLanguageText(
                                LanguageHelper.dontWorryTransKey)),
                        // Bottom extra spaces
                        AppGaps.hGap30,
                      ],
                    ),
                  )),
                ),
                /* <-------- Bottom bar --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                  child: CustomStretchedTextButtonWidget(
                      buttonText: LanguageHelper.currentLanguageText(
                          LanguageHelper.goToHomeTransKey),
                      onTap: () {
                        Get.toNamed(AppPageNames.homeNavigatorScreen,
                            arguments: 0);
                      }),
                ),
              ),
            ));
  }
}
