import 'package:ecomikstoreapp/controller/add_auction_second_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/add_product_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAuction2ndScreen extends StatelessWidget {
  const AddAuction2ndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAction2ndScreenController>(
        init: AddAction2ndScreenController(),
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
                    titleWidget: Text(controller.appbarTitle)),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // CircleAvatar(
                        //   backgroundImage: Image.asset(
                        //     AppAssetImages.myAccountProfilePicture,
                        //   ).image,
                        //   radius: 64,
                        // ),
                        // Top extra spaces
                        AppGaps.hGap15,
                        /* <---- Product picture ----> */

                        SectionHeaderTextWidget(
                            text: LanguageHelper.currentLanguageText(
                                LanguageHelper.auctionProductTransKey)),
                        AppGaps.hGap16,
                        Row(
                          children: [
                            Expanded(
                                child: TextFormDatePickerWidget(
                                    textEditingController:
                                        controller.startDateController,
                                    initialDate:
                                        controller.startInitialDateTime,
                                    firstDate: controller.startFirstDateTime,
                                    lastDate: controller.startEndDateTime,
                                    labelText:
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.startDateTransKey),
                                    hintText: 'Select start date',
                                    onAfterPickDate:
                                        controller.onStartDateAfterPickDate,
                                    onError: controller.onStartDateError)),
                            AppGaps.wGap15,
                            Expanded(
                                child: TextFormFieldWidget(
                              controller: controller.startTimeController,
                              isReadOnly: true,
                              labelText: LanguageHelper.currentLanguageText(
                                  LanguageHelper.startTimeTransKey),
                              hintText: 'Select start time',
                              onTap: () => controller.onStartTimeTap(context),
                            )),
                          ],
                        ),
                        AppGaps.hGap24,
                        Row(
                          children: [
                            Expanded(
                                child: TextFormDatePickerWidget(
                                    textEditingController:
                                        controller.endDateController,
                                    initialDate: controller.endInitialDateTime,
                                    firstDate: controller.startFirstDateTime
                                        .add(const Duration(days: 1)),
                                    lastDate: controller.startEndDateTime
                                        .add(const Duration(days: 1)),
                                    labelText:
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.endDateTransKey),
                                    hintText: AppLanguageTranslation
                                        .selectEndDateTransKey
                                        .toCurrentLanguage,
                                    onAfterPickDate:
                                        controller.onEndDateAfterPickDate,
                                    onError: controller.onEndDateError)),
                            AppGaps.wGap15,
                            Expanded(
                                child: TextFormFieldWidget(
                              controller: controller.endTimeController,
                              isReadOnly: true,
                              labelText: LanguageHelper.currentLanguageText(
                                  LanguageHelper.endTimeTransKey),
                              hintText: AppLanguageTranslation
                                  .selectEndTimeTransKey.toCurrentLanguage,
                              onTap: () => controller.onEndTimeTap(context),
                            )),
                          ],
                        ),
                        AppGaps.hGap24,
/*                         CustomScaffoldBottomBarWidget(
                            child: CustomStretchedTextButtonWidget(
                          buttonText: LanguageHelper.currentLanguageText(
                              LanguageHelper.uploadTransKey),
                          onTap: () {},
                        )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomTightTextButtonWidget(
                              onTap: () {
                                Get.back();
                              },
                              child: Text(
                                  LanguageHelper.currentLanguageText(
                                      LanguageHelper.addMoreImageTransKey),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: AppColors.primaryColor)),
                            )
                          ],
                        ),

                        /* <---- Edit Date ----> */
                        CustomTextFormField(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.startDateTransKey),
                            hintText: '  2/11/21  ',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.calenderSVGLogoLine)),
                        AppGaps.hGap24,
                        CustomTextFormField(
                            labelText: LanguageHelper.currentLanguageText(
                                LanguageHelper.endDateTransKey),
                            hintText: '  2/11/21  ',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.calenderSVGLogoLine)),

                        AppGaps.hGap24,
                        Row(
                          children: [
                            Text(
                                LanguageHelper.currentLanguageText(
                                    LanguageHelper.itemPriceTransKey),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: Colors.black)),
                          ],
                        ),
                        AppGaps.hGap24,
                        /* <---- Edit your phone number ----> */
                        CustomTextFormField(
                          labelText: LanguageHelper.currentLanguageText(
                              LanguageHelper.startBiddingAmountTransKey),
                          hintText: r'  eg  $0.50',
                          textInputType: TextInputType.phone,
                          // prefixIcon: SvgPicture.asset(
                          //     AppAssetImages.callingSVGLogoLine,
                          //     color: AppColors.bodyTextColor)
                        ),
                        AppGaps.hGap24,
                        CustomTextFormField(
                          labelText: LanguageHelper.currentLanguageText(
                              LanguageHelper.reservedPriceTransKey),
                          hintText: r'  eg  $50000',
                          textInputType: TextInputType.phone,
                          // prefixIcon: SvgPicture.asset(
                          //     AppAssetImages.callingSVGLogoLine,
                          //     color: AppColors.bodyTextColor)
                        ), */
                        TextFormFieldWidget(
                          controller: controller.priceController,
                          labelText: LanguageHelper.currentLanguageText(
                              LanguageHelper.setPriceTransKey),
                          hintText: LanguageHelper.currentLanguageText(
                              LanguageHelper.enterPriceTransKey),
                          textInputType: TextInputType.number,
                        ),
                        AppGaps.hGap24,
                        ToggleRowWidget(
                            label: LanguageHelper.currentLanguageText(
                                LanguageHelper.statusTransKey),
                            value: controller.currentStatus,
                            onToggle: controller.onStatusToggleChange),
                        // Bottom extra spaces
                        AppGaps.hGap30,
                      ],
                    ),
                  ),
                ),

                /* <-------- Bottom bar --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                    child: Obx(() => controller.isLoading.value
                        ? LoadingCustomStretchedTextButtonWidget(
                            buttonText: controller.bottomButtonText)
                        : CustomStretchedTextButtonWidget(
                            buttonText: controller.bottomButtonText,
                            onTap: controller.onSubmitButtonTap,
                          ))),
              ),
            ));
  }
}
