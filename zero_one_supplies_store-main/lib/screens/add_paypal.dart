import 'package:ecomikstoreapp/controller/add_payple_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddPaypalScreen extends StatelessWidget {
  const AddPaypalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPaypalScreenController>(
        init: AddPaypalScreenController(),
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
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.addPaypalTransKey))),
                // appBar: CoreWidgets.appBarWidget(screenContext: context),
                /* <-------- Content --------> */
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppGaps.screenPaddingValue),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppGaps.hGap15,
                        /* <---- User full name text field ----> */
                        TextFormFieldWidget(
                          labelText: LanguageHelper.currentLanguageText(
                              LanguageHelper.accountHolderNameTransKey),
                          hintText: '  Samantha Smith',
                          prefixIcon: SvgPicture.asset(
                              AppAssetImages.profileSVGLogoLine),
                        ),
                        AppGaps.hGap15,
                        /* <---- User full name text field ----> */
                        TextFormFieldWidget(
                          labelText: LanguageHelper.currentLanguageText(
                              LanguageHelper.emailAddressTransKey),
                          hintText: ' contact@ecomic.mail',
                          prefixIcon: Image.asset(AppAssetImages.email),
                        ),

                        /* <---- Email text field ----> */

                        /* <---- Password text field ----> */
                      ],
                    ),
                  ),
                ),
                /* <-------- Bottom bar of sign up text --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /* <---- Sign up text button ----> */
                      CustomStretchedTextButtonWidget(
                          buttonText: LanguageHelper.currentLanguageText(
                              LanguageHelper.addPaypalTransKey),
                          onTap: () {
                            Get.toNamed(AppPageNames.cardPlacedSuccessScreen);
                          })
                    ],
                  ),
                ),
              ),
            ));
  }
}
