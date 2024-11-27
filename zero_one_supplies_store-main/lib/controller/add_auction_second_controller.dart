import 'dart:convert';

import 'package:ecomikstoreapp/models/api_responses/auctions_response.dart';
import 'package:ecomikstoreapp/models/api_responses/core_api_responses/raw_api_response.dart';
import 'package:ecomikstoreapp/models/screen_parameters/add_auction_2nd_screen_parameter.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/extensions/int.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAction2ndScreenController extends GetxController {
  String productID = '';
  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  DateTime? startDateTime;
  DateTime? endDateTime;
  bool currentStatus = false;
  AuctionShortItem? auction;
  RxBool isLoading = false.obs;

  bool get isEditing => auction != null;

  String get appbarTitle {
    if (isEditing) {
      return 'Edit auction';
    }
    return LanguageHelper.currentLanguageText(
        LanguageHelper.addAuctionTransKey);
  }

  String get bottomButtonText {
    if (isEditing) {
      return LanguageHelper.currentLanguageText(
          LanguageHelper.updateInfoTransKey);
    }
    return LanguageHelper.currentLanguageText(
        LanguageHelper.addAuctionTransKey);
  }

  DateTime get startFirstDateTime {
    return DateTime.now().copyWith(year: DateTime.now().year - 10);
  }

  DateTime get startEndDateTime {
    return DateTime.now().copyWith(year: DateTime.now().year + 10);
  }

  DateTime get startInitialDateTime {
    if (startDateTime == null) {
      return DateTime.now();
    }
    return startDateTime!;
  }

  DateTime get endInitialDateTime {
    if (endDateTime == null) {
      return DateTime.now();
    }
    return endDateTime!;
  }

  DateTime get endFirstDateTime {
    return startInitialDateTime.add(const Duration(days: 1));
  }

  void onStartDateError(dynamic error) {
    startDateTime = null;
    startDateController.clear();
    update();
  }

  void onEndDateError(dynamic error) {
    endDateTime = null;
    endDateController.clear();
    update();
  }

  void onStartDateAfterPickDate(DateTime? selectedDate) {
    if (selectedDate == null) {
      return;
    }
    startDateTime = selectedDate;
    update();
  }

  void onEndDateAfterPickDate(DateTime? selectedDate) {
    if (selectedDate == null) {
      return;
    }
    endDateTime = selectedDate;
    update();
  }

  void onStartTimeTap(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: startDateTime != null
            ? TimeOfDay.fromDateTime(startDateTime!)
            : TimeOfDay.now());
    if (selectedTime == null || startDateTime == null) {
      return;
    }
    startDateTime = startDateTime!
        .copyWith(hour: selectedTime.hour, minute: selectedTime.minute);
    startTimeController.text =
        '${selectedTime.hourOfPeriod.to2Digits}:${selectedTime.minute.to2Digits} ${selectedTime.period.name}';
    update();
  }

  void onEndTimeTap(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: endDateTime != null
            ? TimeOfDay.fromDateTime(endDateTime!)
            : TimeOfDay.now());
    if (selectedTime == null || endDateTime == null) {
      return;
    }
    endDateTime = endDateTime!
        .copyWith(hour: selectedTime.hour, minute: selectedTime.minute);
    endTimeController.text =
        '${selectedTime.hourOfPeriod.to2Digits}:${selectedTime.minute.to2Digits} ${selectedTime.period.name}';

    update();
  }

  void onStatusToggleChange(bool value) {
    currentStatus = value;
    update();
  }

  bool isValidForSubmitAuctionProduct() {
    if (productID.isEmpty) {
      AppDialogs.showErrorDialog(
          messageText: 'Product ID is not found to be update');
      return false;
    }
    if (startDateTime == null) {
      AppDialogs.showErrorDialog(messageText: 'Start date is required');
      return false;
    }
    if (endDateTime == null) {
      AppDialogs.showErrorDialog(messageText: 'End date is required');
      return false;
    }
    if (priceController.text.isEmpty) {
      AppDialogs.showErrorDialog(messageText: 'Price is required');
      return false;
    }
    return true;
  }

  void onSubmitButtonTap() {
    if (isValidForSubmitAuctionProduct()) {
      addEditProductDetails();
    }
  }

  Future<void> addEditProductDetails() async {
    final String storeID = Helper.getVendor().store.id;
    final Map<String, dynamic> requestBody = {
      'product': productID,
      'store': storeID,
      'start_date':
          APIHelper.toServerDateTimeFormattedStringFromDateTime(startDateTime!),
      'end_date':
          APIHelper.toServerDateTimeFormattedStringFromDateTime(endDateTime!),
      'current_price': priceController.text,
      'status': currentStatus,
    };

    if (isEditing) {
      requestBody['_id'] = auction?.id;
    }
    String requestBodyJson = jsonEncode(requestBody);
    isLoading.value = true;
    RawAPIResponse? response =
        await APIRepo.submitAddEditAuctionProductDetails(requestBodyJson);
    isLoading.value = false;
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    _onSuccessAddEditProductDetails(response);
  }

  void _onSuccessAddEditProductDetails(RawAPIResponse response) async {
    Helper.showSnackBar(response.msg);
    Get.back();
    if (!isEditing) {
      Get.back();
    }
  }

  void _presetAuctionDetails(AuctionShortItem auction) {
    startDateTime = auction.startDate;
    startDateController.text =
        Helper.ddMMMyyyyFormattedDateTime(startDateTime!);
    final TimeOfDay startTime = TimeOfDay.fromDateTime(startDateTime!);
    startTimeController.text =
        '${startTime.hourOfPeriod.to2Digits}:${startTime.minute.to2Digits} ${startTime.period.name}';
    endDateTime = auction.endDate;
    endDateController.text = Helper.ddMMMyyyyFormattedDateTime(endDateTime!);
    final TimeOfDay endTime = TimeOfDay.fromDateTime(endDateTime!);
    endTimeController.text =
        '${endTime.hourOfPeriod.to2Digits}:${endTime.minute.to2Digits} ${endTime.period.name}';
    priceController.text = '${auction.currentPrice}';
    currentStatus = auction.status;
    update();
  }

  void _getScreenParameter() {
    final argument = Get.arguments;
    if (argument is AddAuction2ndScreenParameter) {
      productID = argument.productID;
      auction = argument.auction;
      if (isEditing) {
        _presetAuctionDetails(argument.auction!);
      }
    }
  }

  @override
  void onInit() {
    _getScreenParameter();
    super.onInit();
  }

  @override
  void onClose() {
    startDateController.dispose();
    startTimeController.dispose();
    endDateController.dispose();
    endTimeController.dispose();
    priceController.dispose();
    super.onClose();
  }
}
