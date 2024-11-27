import 'package:ecomikstoreapp/controller/card_placed_successful_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardPlacedSuccessScreen extends StatelessWidget {
  const CardPlacedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardPlaceSuccessfulScreenController>(
        init: CardPlaceSuccessfulScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                // / <-------- Content --------> /
                body: SafeArea(
                    top: true,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 356,
                                child: Column(
                                  children: [
                                    Text(LanguageHelper.currentLanguageText(
                                        LanguageHelper.congratsTransKey)),
                                    // / <---- Illustration image ----> /
                                    // Image.asset(AppAssetImages.paypcongrats,
                                    //     height: 240),
                                    AppGaps.hGap20,
                                    // / <---- Highlighter text and subtitle text ----> /
                                    HighlightAndDetailTextWidget(
                                        slogan:
                                            LanguageHelper.currentLanguageText(
                                                LanguageHelper
                                                    .congratulationsTransKey),
                                        subtitle:
                                            LanguageHelper.currentLanguageText(
                                                LanguageHelper
                                                    .dontWorryTransKey)),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    )),
                // / <-------- Bottom bar --------> /

                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: CustomStretchedTextButtonWidget(
                          buttonText: LanguageHelper.currentLanguageText(
                              LanguageHelper.goToHomeTransKey),
                          onTap: () {
                            // Go to delivery info screen
                            Get.toNamed(AppPageNames.homeNavigatorScreen);
                          }),
                    ),
                  ),
                ),
              ),
            ));
  }
}
