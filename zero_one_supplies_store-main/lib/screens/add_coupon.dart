import 'package:ecomikstoreapp/controller/add_coupon_controller.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/constants/app_text_styles.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/add_product_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCouponScreen extends StatelessWidget {
  const AddCouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCouponScreenController>(
        init: AddCouponScreenController(),
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
                        SectionHeaderTextWidget(
                            text: AppLanguageTranslation
                                .couponTransKey.toCurrentLanguage),
                        AppGaps.hGap16,
                        Form(
                          key: controller.addEditCouponFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormFieldWidget(
                                controller: controller.nameController,
                                isRequired: true,
                                labelText: 'Coupon name',
                                hintText: 'Enter coupon name',
                                textInputType: TextInputType.text,
                                validator: (text) {
                                  if (text == null) {
                                    return 'Required field. Can not be empty.';
                                  }
                                  if (text.isEmpty) {
                                    return 'Required field. Can not be empty.';
                                  }
                                  return null;
                                },
                              ),
                              AppGaps.hGap24,
                              TextFormFieldWidget(
                                controller: controller.codeController,
                                labelText: 'Coupon code',
                                hintText:
                                    'Code will be automatically generated',
                                textInputType: TextInputType.text,
                                isReadOnly: true,
                              ),
                              AppGaps.hGap24,
                              TextFormFieldWidget(
                                controller: controller.valueController,
                                isRequired: true,
                                labelText: 'Value',
                                hintText: 'Enter coupon value',
                                validator: (text) {
                                  if (text == null) {
                                    return 'Required field. Can not be empty.';
                                  }
                                  if (text.isEmpty) {
                                    return 'Required field. Can not be empty.';
                                  }
                                  if (double.tryParse(text) == null) {
                                    return 'Must be an amount';
                                  }
                                  return null;
                                },
                                textInputType: TextInputType.number,
                              ),
                              AppGaps.hGap24,
                              DropdownButtonFormFieldWidget<DiscountType>(
                                isRequired: true,
                                labelText: 'Discount type',
                                hintText: 'Select discount type',
                                value: controller.selectedDiscountType,
                                getItemText: (item) => item.stringValueForView,
                                items: DiscountType.values,
                                validator: (value) {
                                  if (value == null) {
                                    return 'Required field. Can not be empty';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  controller.selectedDiscountType = value;
                                  controller.update();
                                },
                              ),
                              AppGaps.hGap24,
                              TextFormFieldWidget(
                                controller:
                                    controller.usageLimitCustomerController,
                                isRequired: true,
                                labelText: 'Usage limit per customer',
                                hintText:
                                    'How many times a single customer can use this. Ex: 3',
                                textInputType: TextInputType.number,
                                validator: (text) {
                                  if (text == null) {
                                    return 'Required field. Can not be empty.';
                                  }
                                  if (text.isEmpty) {
                                    return 'Required field. Can not be empty.';
                                  }
                                  if (int.tryParse(text) == null) {
                                    return 'Must be a number';
                                  }
                                  return null;
                                },
                              ),
                              AppGaps.hGap24,
                              TextFormFieldWidget(
                                controller:
                                    controller.usageLimitCouponController,
                                isRequired: true,
                                labelText: 'Usage limit per coupon',
                                hintText:
                                    'How many times this coupon can be used. Ex: 300',
                                textInputType: TextInputType.number,
                                validator: (text) {
                                  if (text == null) {
                                    return 'Required field. Can not be empty.';
                                  }
                                  if (int.tryParse(text) == null) {
                                    return 'Must be a number';
                                  }
                                  return null;
                                },
                              ),
                              AppGaps.hGap24,
                              TextFormFieldWidget(
                                controller:
                                    controller.minimumSpentAmountController,
                                labelText: 'Minimum spend amount',
                                hintText: 'Enter minimum spend amount',
                                validator: (text) {
                                  if (text == null) {
                                    return 'Required field. Can not be empty.';
                                  }
                                  if (double.tryParse(text) == null) {
                                    return 'Must be an amount';
                                  }
                                  return null;
                                },
                                textInputType: TextInputType.number,
                              ),
                              AppGaps.hGap24,
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormFieldWidget(
                                      isReadOnly: true,
                                      controller:
                                          controller.startDateController,
                                      isRequired: true,
                                      labelText: 'Start date',
                                      hintText: 'Select start date',
                                      validator: (text) {
                                        if (text == null) {
                                          return 'Required field. Can not be empty.';
                                        }
                                        if (text.isEmpty) {
                                          return 'Required field. Can not be empty.';
                                        }
                                        return null;
                                      },
                                      onTap: () async {
                                        DateTime? selectedDate;
                                        try {
                                          selectedDate = await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  controller.startDateTime,
                                              firstDate: controller.isEditing
                                                  ? controller.startDateTime
                                                  : controller.currentDateTime,
                                              lastDate: controller
                                                  .currentDateTime
                                                  .add(const Duration(
                                                      days: 365)));
                                        } catch (e) {
                                          selectedDate = await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  controller.currentDateTime,
                                              firstDate:
                                                  controller.currentDateTime,
                                              lastDate: controller
                                                  .currentDateTime
                                                  .add(const Duration(
                                                      days: 365)));
                                        }
                                        if (selectedDate != null) {
                                          controller.onStartDateSelected(
                                              selectedDate);
                                        }
                                      },
                                    ),
                                  ),
                                  AppGaps.wGap10,
                                  Expanded(
                                    child: TextFormFieldWidget(
                                      isReadOnly: true,
                                      controller:
                                          controller.startTimeController,
                                      isRequired: true,
                                      labelText: 'Start time',
                                      hintText: 'Select start time',
                                      validator: (text) {
                                        if (text == null) {
                                          return 'Required field. Can not be empty.';
                                        }
                                        if (text.isEmpty) {
                                          return 'Required field. Can not be empty.';
                                        }
                                        return null;
                                      },
                                      onTap: () async {
                                        final TimeOfDay? selectedTime =
                                            await showTimePicker(
                                                context: context,
                                                initialTime:
                                                    TimeOfDay.fromDateTime(
                                                        controller
                                                            .startDateTime));
                                        if (selectedTime != null) {
                                          controller.onStartTimeSelected(
                                              selectedTime);
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                              AppGaps.hGap24,
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormFieldWidget(
                                      isReadOnly: true,
                                      controller: controller.endDateController,
                                      isRequired: true,
                                      labelText: 'End date',
                                      hintText: 'Select end date',
                                      validator: (text) {
                                        if (text == null) {
                                          return 'Required field. Can not be empty.';
                                        }
                                        if (text.isEmpty) {
                                          return 'Required field. Can not be empty.';
                                        }
                                        return null;
                                      },
                                      onTap: () async {
                                        DateTime? selectedDate;
                                        try {
                                          selectedDate = await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  controller.endDateTime,
                                              firstDate: controller.isEditing
                                                  ? controller.endDateTime
                                                  : controller
                                                      .currentNextDayDateTime,
                                              lastDate: controller
                                                  .currentDateTime
                                                  .add(const Duration(
                                                      days: 365)));
                                        } catch (e) {
                                          selectedDate = await showDatePicker(
                                              context: context,
                                              initialDate: controller
                                                  .currentNextDayDateTime,
                                              firstDate: controller
                                                  .currentNextDayDateTime,
                                              lastDate: controller
                                                  .currentDateTime
                                                  .add(const Duration(
                                                      days: 365 + 1)));
                                        }
                                        if (selectedDate != null) {
                                          controller
                                              .onEndDateSelected(selectedDate);
                                        }
                                      },
                                    ),
                                  ),
                                  AppGaps.wGap10,
                                  Expanded(
                                    child: TextFormFieldWidget(
                                      isReadOnly: true,
                                      controller: controller.endTimeController,
                                      isRequired: true,
                                      labelText: 'End time',
                                      hintText: 'Select end time',
                                      validator: (text) {
                                        if (text == null) {
                                          return 'Required field. Can not be empty.';
                                        }
                                        if (text.isEmpty) {
                                          return 'Required field. Can not be empty.';
                                        }
                                        return null;
                                      },
                                      onTap: () async {
                                        final TimeOfDay? selectedTime =
                                            await showTimePicker(
                                                context: context,
                                                initialTime:
                                                    TimeOfDay.fromDateTime(
                                                        controller
                                                            .endDateTime));
                                        if (selectedTime != null) {
                                          controller
                                              .onEndTimeSelected(selectedTime);
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                              AppGaps.hGap24,
                              TextFormFieldWidget(
                                controller: controller.descriptionController,
                                labelText: 'Description',
                                hintText: 'Enter coupon description',
                              ),
                              AppGaps.hGap24,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    LanguageHelper.currentLanguageText(
                                        LanguageHelper.activeTransKey),
                                    style:
                                        AppTextStyles.bodyLargeMediumTextStyle,
                                  ),
                                  AppGaps.wGap8,
                                  /* <---- Remember me toggle button ----> */
                                  SwitchWidget(
                                    value: controller.currentActiveStatus,
                                    onToggle: (value) {
                                      controller.currentActiveStatus = value;
                                      controller.update();
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        // Bottom extra spaces
                        AppGaps.hGap30,
                      ],
                    ),
                  ),
                ),
                /* <-------- Bottom bar --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                    child: CustomStretchedTextButtonWidget(
                  isLoading: controller.isLoading,
                  buttonText: controller.isEditing
                      ? 'Update'
                      : AppLanguageTranslation.submitTransKey.toCurrentLanguage,
                  onTap: controller.onSubmitButtonTap,
                )),
              ),
            ));
  }
}
