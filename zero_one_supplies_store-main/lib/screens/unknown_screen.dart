import 'package:ecomikstoreapp/controller/unknow_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UnknownScreenController>(
        init: UnknownScreenController(),
        builder: (controller) => Scaffold(
              body: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image:
                            Image.asset(AppAssetImages.backgroundScreen).image,
                        fit: BoxFit.fill)),
                child: SafeArea(
                  child: Center(
                    child: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.pageNotFoundTransKey)),
                  ),
                ),
              ),
            ));
  }
}
