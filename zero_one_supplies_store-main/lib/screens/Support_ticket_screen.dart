// ignore_for_file: file_names

import 'package:ecomikstoreapp/controller/support_ticket_screen.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants/app_page_names.dart';
import '../widgets/core_widgets.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportTicketScreenController>(
        init: SupportTicketScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context,
                    hasBackButton: true,
                    titleWidget: const Text('')),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: Center(
                      child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppGaps.hGap10,

                        /* <---- Congratulation illustration ----> */
                        Image.asset(AppAssetImages.ticketlogo, height: 250),
                        AppGaps.hGap56,
                        HighlightAndDetailTextWidget(
                            slogan: AppLanguageTranslation
                                .noTicketFoundTransKey.toCurrentLanguage,
                            subtitle: AppLanguageTranslation
                                .youHaveNoTicketTransKey.toCurrentLanguage),
                        // Bottom extra spaces
                        AppGaps.hGap20,
                      ],
                    ),
                  )),
                ),
                /* <-------- Bottom bar --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                  child: CustomStretchedTextButtonWidget(
                      buttonText: AppLanguageTranslation
                          .createNewTicketTransKey.toCurrentLanguage,
                      onTap: () {
                        Get.toNamed(AppPageNames.supportTicketScreen);
                      }),
                ),
              ),
            ));
  }
}
