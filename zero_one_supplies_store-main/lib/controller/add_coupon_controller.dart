import 'package:ecomikstoreapp/models/api_responses/core_api_responses/raw_api_response.dart';
import 'package:ecomikstoreapp/models/api_responses/coupon_list_response.dart';
import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/extensions/datetime.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCouponScreenController extends GetxController {
  final String dateFormatPattern = 'dd MMM, yyyy';
  final String timeFormatPattern = 'hh:mm a';
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController usageLimitCustomerController = TextEditingController();
  TextEditingController usageLimitCouponController = TextEditingController();
  TextEditingController minimumSpentAmountController = TextEditingController();
  DateTime _startDateTime = DateTime.now();
  DateTime get startDateTime => _startDateTime;
  set startDateTime(DateTime value) {
    _startDateTime = value;
    _setStartDateText();
    _setStartTimeText();
  }

  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  DateTime _endDateTime = DateTime.now().add(const Duration(days: 1));
  DateTime get endDateTime => _endDateTime;
  set endDateTime(DateTime value) {
    _endDateTime = value;
    _setEndDateText();
    _setEndTimeText();
  }

  TextEditingController endDateController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Coupon existingCoupon = Coupon.empty();
  DiscountType? selectedDiscountType;
  bool currentActiveStatus = true;
  final GlobalKey<FormState> addEditCouponFormKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  // Getters
  String get appbarTitle {
    if (isEditing) {
      return 'Edit coupon';
    }
    return 'Add coupon';
  }

  DateTime get currentDateTime =>
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime get currentNextDayDateTime =>
      currentDateTime.add(const Duration(days: 1));

  // Functions
  void onSubmitButtonTap() {
    if (addEditCouponFormKey.currentState?.validate() ?? false) {
      if (checkStartEndDateTimeValidation()) {
        submitCouponDetails();
      }
    }
  }

  void onStartDateSelected(DateTime dateTime) {
    startDateTime = dateTime;
    // checkStartEndDateTimeValidation();
  }

  void onStartTimeSelected(TimeOfDay timeOfDay) {
    startDateTime = DateTime(startDateTime.year, startDateTime.month,
        startDateTime.day, timeOfDay.hour, timeOfDay.minute);
    // checkStartEndDateTimeValidation();
  }

  void onEndDateSelected(DateTime dateTime) {
    endDateTime = dateTime;
    // checkStartEndDateTimeValidation();
  }

  void onEndTimeSelected(TimeOfDay timeOfDay) {
    endDateTime = DateTime(endDateTime.year, endDateTime.month, endDateTime.day,
        timeOfDay.hour, timeOfDay.minute);
    // checkStartEndDateTimeValidation();
  }

  Future<void> submitCouponDetails() async {
    final vendorDetails = Helper.getVendor();
    Map<String, dynamic> requestBody = <String, dynamic>{
      'store': vendorDetails.id,
      'name': nameController.text,
      'value': double.tryParse(valueController.text) ?? 0,
      'usage_limit_per_customer':
          double.tryParse(usageLimitCustomerController.text) ?? 0,
      'usage_limit_per_coupon':
          double.tryParse(usageLimitCouponController.text) ?? 0,
      'min_spend': double.tryParse(minimumSpentAmountController.text) ?? 0,
      'start_date':
          APIHelper.toServerDateTimeFormattedStringFromDateTime(startDateTime),
      'end_date':
          APIHelper.toServerDateTimeFormattedStringFromDateTime(endDateTime),
      'discount_type': selectedDiscountType?.stringValue,
      'description': descriptionController.text,
      'active': currentActiveStatus
    };
    // if (isEditing) {
    requestBody['_id'] = existingCoupon.id;
    requestBody['code'] = existingCoupon.code;
    // }
    isLoading = true;
    final RawAPIResponse? response = await APIRepo.submitCoupon(requestBody);
    isLoading = false;
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    _onSuccessAddEditProductDetails(response);
  }

  void _onSuccessAddEditProductDetails(RawAPIResponse response) {
    Helper.showSnackBar(response.msg);
    _clearForm();
    if (!isEditing) {
      Get.back(result: true);
    }
  }

  void _clearForm() {}

  bool checkStartEndDateTimeValidation() {
    final isValid = _validateStartEndDate();
    if (!isValid) {
      _fixInvalidStartEndDate();
    }
    update();
    return isValid;
  }

  bool _validateStartEndDate() {
    if (!isEditing) {
      if (startDateTime.isBefore(currentDateTime)) {
        AppDialogs.showErrorDialog(
            messageText: 'You can not set start date before today!');
        return false;
      }
      if (endDateTime.isBefore(currentNextDayDateTime)) {
        AppDialogs.showErrorDialog(
            messageText: 'You can not set end date before today\'s 24 hour!');
        return false;
      }
    }
    if (endDateTime.isBefore(startDateTime)) {
      AppDialogs.showErrorDialog(
          messageText: 'You can not set end date before start date!');
      return false;
    }
    return true;
  }

  void _fixInvalidStartEndDate() {
    if (!isEditing) {
      if (startDateTime.isBefore(currentDateTime)) {
        startDateTime = currentDateTime;
        if (endDateTime.isBefore(startDateTime)) {
          endDateTime = currentNextDayDateTime;
        }
      }
      if (endDateTime.isBefore(currentNextDayDateTime)) {
        endDateTime = currentNextDayDateTime;
        if (endDateTime.isBefore(startDateTime)) {
          startDateTime = currentDateTime;
        }
      }
    }
    if (endDateTime.isBefore(startDateTime)) {
      // Swap start and end dateTime
      // final tempEndDate = endDateTime.copyWith();
      // startDateTime = endDateTime.copyWith();
      // endDateTime = tempEndDate;
    }
    update();
  }

  void _setStartDateText() {
    startDateController.text = startDateTime.formatted(dateFormatPattern);
    update();
  }

  void _setStartTimeText() {
    startTimeController.text = startDateTime.formatted(timeFormatPattern);
    update();
  }

  void _setEndDateText() {
    endDateController.text = endDateTime.formatted(dateFormatPattern);
    update();
  }

  void _setEndTimeText() {
    endTimeController.text = endDateTime.formatted(timeFormatPattern);
    update();
  }

  void _prefillCouponData() {
    nameController.text = existingCoupon.name;
    codeController.text = existingCoupon.code;
    valueController.text = existingCoupon.value.toStringAsFixed(2);
    usageLimitCustomerController.text =
        existingCoupon.usageLimitPerCustomer.toString();
    usageLimitCouponController.text =
        existingCoupon.usageLimitPerCoupon.toString();
    minimumSpentAmountController.text =
        existingCoupon.minSpend.toStringAsFixed(2);
    startDateTime = existingCoupon.startDate;
    endDateTime = existingCoupon.endDate;
    selectedDiscountType = existingCoupon.discountTypeEnum;
    checkStartEndDateTimeValidation();
    _setStartDateText();
    _setStartTimeText();
    _setEndDateText();
    _setEndTimeText();
    descriptionController.text = existingCoupon.description;
    currentActiveStatus = existingCoupon.active;
    update();
  }

  void _getScreenParameter() {
    final dynamic argument = Get.arguments;
    if (argument is Coupon) {
      existingCoupon = argument;
      isEditing = true;
      _prefillCouponData();
    }
  }

  @override
  void onInit() {
    _getScreenParameter();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    codeController.dispose();
    valueController.dispose();
    usageLimitCouponController.dispose();
    usageLimitCustomerController.dispose();
    minimumSpentAmountController.dispose();
    startDateController.dispose();
    startTimeController.dispose();
    endDateController.dispose();
    endTimeController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
