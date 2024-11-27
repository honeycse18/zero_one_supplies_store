import 'package:ecomikstoreapp/controller/edit_account_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditAccountScreenController>(
        init: EditAccountScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Appbar --------> */
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context,
                    hasBackButton: true,
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.editAccountTransKey))),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top extra spaces
                        AppGaps.hGap15,
                        /* <---- Profile picture, name, phone number, email address
                         ----> */
                        Center(
                          child: Form(
                            key: controller.userUpdateProfileFormKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    /* <---- Profile picture ----> */
                                    CachedNetworkImageWidget(
                                      imageURL:
                                          controller.vendorAccountDetails.image,
                                      imageBuilder: (context, imageProvider) =>
                                          CircleAvatar(
                                        backgroundImage: imageProvider,
                                        radius: 64,
                                      ),
                                    ),
                                    /* <---- Small camera circle icon button ----> */
                                    Positioned(
                                        bottom: 7,
                                        right: -3,
                                        child: IconButton(
                                          onPressed: () {
                                            controller.userProfileImageAdd();
                                          },
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(
                                              minHeight: 34, minWidth: 34),
                                          icon: Container(
                                            height: 34,
                                            width: 34,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor,
                                                border: Border.all(
                                                    color: Colors.white)),
                                            child: SvgPicture.asset(
                                              AppAssetImages.cameraSVGLogoSolid,
                                              height: 14,
                                              width: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                                AppGaps.hGap18,
                                /* <---- Profile name ----> */
                                Text(
                                  '${controller.vendorAccountDetails.firstName} ${controller.vendorAccountDetails.lastName}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(),
                                ),
                                AppGaps.hGap8,
                                /* <---- Profile phone number ----> */
                                Text(controller.vendorAccountDetails.phone,
                                    style: const TextStyle(
                                        color: AppColors.bodyTextColor)),
                                AppGaps.hGap5,
                                /* <---- Profile email address ----> */
                                Text(controller.vendorAccountDetails.email,
                                    style: const TextStyle(
                                        color: AppColors.bodyTextColor)),
                                AppGaps.hGap32,
                                CustomHorizontalDashedLineWidget(
                                    color:
                                        AppColors.darkColor.withOpacity(0.1)),
                                AppGaps.hGap32,
                                /* <---- Edit your name ----> */
                                TextFormFieldWidget(
                                    controller: controller.firstNameController,
                                    validator: controller.nameFormValidator,
                                    labelText:
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.firstNameTransKey),
                                    hintText:
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.firstNameTransKey),
                                    prefixIcon: SvgPicture.asset(
                                        AppAssetImages.profileSVGLogoLine)),
                                AppGaps.hGap32,
                                /* <---- Edit your name ----> */
                                TextFormFieldWidget(
                                    controller: controller.lastNameController,
                                    validator: controller.nameFormValidator,
                                    labelText:
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.lastNameTransKey),
                                    hintText:
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.lastNameTransKey),
                                    prefixIcon: SvgPicture.asset(
                                        AppAssetImages.profileSVGLogoLine)),
                                AppGaps.hGap24,
                                /* <---- Edit your email address ----> */
                                TextFormFieldWidget(
                                    controller: controller.emailController,
                                    validator: Helper.emailFormValidator,
                                    labelText:
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper
                                                .emailAddressTransKey),
                                    hintText: 'contact@gmail.com',
                                    prefixIcon: SvgPicture.asset(
                                        AppAssetImages.messageSVGLogoLine)),
                                AppGaps.hGap24,
                                /* <---- Edit your phone number ----> */
                                TextFormFieldWidget(
                                    controller: controller.phoneController,
                                    validator: controller.phoneFormValidator,
                                    labelText:
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.phoneNumberTransKey),
                                    hintText: 'Phone Number',
                                    prefixIcon: SvgPicture.asset(
                                        AppAssetImages.phoneSVGLogoLine)),
                                AppGaps.hGap24,
                                /* <---- Edit your date of birth ----> */
                                /*  CustomTextFormField(
                                    controller:
                                        controller.dateOfBirthController,
                                    isReadOnly: true,
                                    onTap: () async {
                                      final DateTime? selectedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: controller
                                                  .userDetails.birthday,
                                              firstDate: DateTime(
                                                  DateTime.now().year - 100),
                                              lastDate: DateTime.now());
                                      if (selectedDate == null) {
                                        return;
                                      }
                                      controller.selectedDate = selectedDate;
                                      controller.dateOfBirthController.text =
                                          Helper.ddMMyyFormattedDateTime(
                                              selectedDate);
                                      controller.update();
                                    },
                                    labelText: 'Date of birth',
                                    hintText: '28-10-96',
                                    prefixIcon: SvgPicture.asset(
                                        AppAssetImages.calenderSVGLogoLine)),

                                AppGaps.hGap24, */
                                /* <---- Edit your email address ----> */

                                // Bottom extra spaces
                                AppGaps.hGap30,
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                /* <-------- Bottom bar --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                    child: CustomStretchedButtonWidget(
                  isLoading: controller.isLoading,
                  onTap: () {
                    controller.onSaveChangesButtonTap();
                    // controller.update();
                  },
                  child: Text(LanguageHelper.currentLanguageText(
                      LanguageHelper.updateInfoTransKey)),
                )),
              ),
            ));
  }
}
