import 'package:ecomikstoreapp/controller/add_product_thied_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/add_product_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductThirdScreen extends StatelessWidget {
  const AddProductThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductThirdScreenController>(
        init: AddProductThirdScreenController(),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppGaps.hGap15,
                        /* <---- Product picture ----> */
                        /* Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                      LanguageHelper.currentLanguageText(
                                          LanguageHelper.deliveryInfoTransKey),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(color: Colors.black)),
                                ],
                              ),

                              AppGaps.hGap24,
                              /* <---- Edit Date ----> */
                              CustomTextFormField(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper
                                        .estimatedDeliveryDaysTransKey),
                                hintText: '  eg  5  ',
                                // prefixIcon: SvgPicture.asset(
                                //     AppAssetImages.calenderSVGLogoLine)
                              ),
                              AppGaps.hGap24,
                              CustomTextFormField(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.freeShippingTransKey),
                                hintText: r'  eg: 5000 $  ',
                                // prefixIcon: SvgPicture.asset(
                                //     AppAssetImages.calenderSVGLogoLine)
                              ),
                              AppGaps.hGap24,
                              CustomTextFormField(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.returnDaysTransKey),
                                hintText: '  eg:  7',
                                // prefixIcon: SvgPicture.asset(
                                //     AppAssetImages.calenderSVGLogoLine)
                              ),

                            ],
                          ),
                        ), */
                        SectionHeaderTextWidget(
                            text: LanguageHelper.currentLanguageText(
                                LanguageHelper.shippingInformationTransKey)),
                        AppGaps.hGap16,
                        TextFormFieldWidget(
                          controller:
                              controller.approximateDeliveryTimeController,
                          focusNode: controller.apprDeliveryTimeFocusNode,
                          labelText: LanguageHelper.currentLanguageText(
                              LanguageHelper.approxDeliveryTransKey),
                          hintText: LanguageHelper.currentLanguageText(
                              LanguageHelper.approxDeliveryHintTransKey),
                          textInputType: TextInputType.number,
                        ),
                        AppGaps.hGap24,
                        TextFormFieldWidget(
                          controller: controller.minimumAmountController,
                          focusNode: controller.minAmountFocusNode,
                          labelText: LanguageHelper.currentLanguageText(
                              LanguageHelper.minimumShippingTransKey),
                          hintText: LanguageHelper.currentLanguageText(
                              LanguageHelper.minimumShippingHintTransKey),
                          textInputType: TextInputType.number,
                        ),
                        AppGaps.hGap24,
                        TextFormFieldWidget(
                          controller: controller.productReturnTimeController,
                          focusNode: controller.productReturnTimeFocusNode,
                          labelText: LanguageHelper.currentLanguageText(
                              LanguageHelper.productReturnTimeTransKey),
                          hintText: LanguageHelper.currentLanguageText(
                              LanguageHelper.productReturnTimeHintTransKey),
                          textInputType: TextInputType.number,
                        ),
                        AppGaps.hGap24,
                        TextFormFieldWidget(
                          controller: controller.returnPolicyMessageController,
                          focusNode: controller.returnPolicyMessageFocusNode,
                          labelText: LanguageHelper.currentLanguageText(
                              LanguageHelper.returnPolicySmsTransKey),
                          hintText: LanguageHelper.currentLanguageText(
                              LanguageHelper.returnPolicySmsHintTransKey),
                        ),
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
                            buttonText: LanguageHelper.currentLanguageText(
                                LanguageHelper.uploadTransKey))
                        : CustomStretchedTextButtonWidget(
                            buttonText: LanguageHelper.currentLanguageText(
                                LanguageHelper.uploadTransKey),
                            onTap: controller.onUploadButtonTap,
                          ))),
              ),
            ));
  }
}
