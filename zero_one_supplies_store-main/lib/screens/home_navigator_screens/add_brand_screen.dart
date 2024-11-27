import 'package:ecomikstoreapp/controller/add_brand_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBrandScreen extends StatelessWidget {
  const AddBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddBrandScreenController>(
        init: AddBrandScreenController(),
        global: false,
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
                    titleWidget: Text(controller.isEditing
                        ? AppLanguageTranslation
                            .editBrandTransKey.toCurrentLanguage
                        : AppLanguageTranslation
                            .addBrandTransKey.toCurrentLanguage)),
                body: CustomScaffoldBodyWidget(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        controller: controller.brandnameEditingController,
                        labelText: LanguageHelper.currentLanguageText(
                            LanguageHelper.brandNameTransKey),
                        hintText: LanguageHelper.currentLanguageText(
                            LanguageHelper.brandNameTransKey),
                      ),
                      AppGaps.hGap24,
                      TextFormFieldWidget(
                        maxLines: 5,
                        controller: controller.descriptionEditingController,
                        labelText: LanguageHelper.currentLanguageText(
                            LanguageHelper.descriptionTransKey),
                        hintText: LanguageHelper.currentLanguageText(
                            LanguageHelper.descriptionTransKey),
                      ),
                      AppGaps.hGap24,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            LanguageHelper.currentLanguageText(
                                LanguageHelper.brandLogoTransKey),
                            style: const TextStyle(
                                color: AppColors.darkColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      AppGaps.hGap10,
                      Container(
                        height: 126,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18))),
                        child: controller.currentBrand.image.isEmpty
                            ? SelectImageButton(
                                onTap: controller.userProfileImageAdd)
                            : SelectedNetworkImageWidget(
                                imageURL: controller.currentBrand.image,
                                onEditButtonTap:
                                    controller.userProfileImageAdd),
                      ),
                    ],
                  ),
                )),
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                    child: CustomStretchedTextButtonWidget(
                  buttonText: controller.isEditing
                      ? LanguageHelper.currentLanguageText(
                          LanguageHelper.updateBrandTransKey)
                      : LanguageHelper.currentLanguageText(
                          LanguageHelper.addBrandTransKey),
                  onTap: () {
                    controller.onSaveChangesButtonTap();
                  },
                )),
              ),
            ));
  }
}
