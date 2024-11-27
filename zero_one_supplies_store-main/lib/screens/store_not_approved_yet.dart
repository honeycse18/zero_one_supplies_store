import 'package:ecomikstoreapp/controller/store_not_approved_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StoreNotApprovedYetWarningScreen extends StatelessWidget {
  const StoreNotApprovedYetWarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreNotApprovedYetWarningScreenController>(
        init: StoreNotApprovedYetWarningScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                  /* <-------- Empty appbar with back button --------> */
                  appBar: CoreWidgets.appBarWidget(
                      screenContext: context,
                      onBackButtonTap: () {
                        Get.offAllNamed(AppPageNames.signInScreen);
                      },
                      actions: [
                        CustomIconButtonWidget(
                            onTap: () => Helper.logout(),
                            child: SvgPicture.asset(
                              AppAssetImages.logoutSVGLogoDualTone,
                              color: AppColors.primaryColor,
                              height: 24,
                              width: 24,
                            ))
                      ]),
                  /* <-------- Content --------> */
                  body: CustomScaffoldBodyWidget(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /* <---- Password change illustration image ----> */
                            Image.asset(AppAssetImages.notApproved,
                                cacheHeight: (240 * 1.5).toInt(),
                                cacheWidth: (260 * 1.5).toInt(),
                                height: 240,
                                width: 260),
                            AppGaps.hGap56,
                            HighlightAndDetailTextWidget(
                                isSpaceShorter: true,
                                slogan: LanguageHelper.currentLanguageText(
                                    LanguageHelper.storeNotApprovedTransKey),
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
                            LanguageHelper.uploadStoreDetailsTransKey),
                        onTap: () {
                          Get.toNamed(AppPageNames.setupStoreInfoScreen);
                        }),
                  )),
            ));
  }
}
