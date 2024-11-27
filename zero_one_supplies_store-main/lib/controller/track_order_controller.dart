import 'package:ecomikstoreapp/utils/constants/app_data.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/order_status_screen_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TrackOrderScreenController extends GetxController {
  RxBool isActiveSelected = false.obs;

  Widget orderDelivered(String currentOrderStatus) {
    switch (currentOrderStatus) {
      case AppData.orderStatusDelivered:
        return StepperEnabledWidget(
          timeText: '9:30',
          statusText:
              AppLanguageTranslation.deliveredTransKey.toCurrentLanguage,
          statusDescriptionText: AppLanguageTranslation
              .productDeliveredDetailsTransKey.toCurrentLanguage,
        );
      default:
        return StepperDisabledWidget(
          statusText:
              AppLanguageTranslation.deliveredTransKey.toCurrentLanguage,
          statusDescriptionText: AppLanguageTranslation
              .productDeliveredDetailsTransKey.toCurrentLanguage,
        );
    }
  }

  /// Get processing order stepper widget based on current order status
  Widget orderProcessing(String currentOrderStatus) {
    switch (currentOrderStatus) {
      case AppData.orderStatusProcessing:
      case AppData.orderStatusDelivered:
        return StepperEnabledWidget(
          timeText: '9:30 AM',
          statusText:
              AppLanguageTranslation.orderProcessingTransKey.toCurrentLanguage,
          statusDescriptionText: AppLanguageTranslation
              .yourOrderProcessingTransKey.toCurrentLanguage,
        );
      default:
        return StepperDisabledWidget(
          statusText:
              AppLanguageTranslation.orderProcessingTransKey.toCurrentLanguage,
          statusDescriptionText: AppLanguageTranslation
              .yourOrderProcessingTransKey.toCurrentLanguage,
        );
    }
  }

  /// Get confirmed order stepper widget based on current order status
  Widget orderConfirmed(String currentOrderStatus) {
    switch (currentOrderStatus) {
      case AppData.orderStatusConfirmed:
      case AppData.orderStatusProcessing:
      case AppData.orderStatusDelivered:
        return StepperEnabledWidget(
            timeText: '9:30 AM',
            statusText:
                AppLanguageTranslation.orderConfirmedTransKey.toCurrentLanguage,
            statusDescriptionText:
                'Your order is confirmed. Will deliver within 20 minutes');
      default:
        return StepperDisabledWidget(
            statusText:
                AppLanguageTranslation.orderConfirmedTransKey.toCurrentLanguage,
            statusDescriptionText:
                'Your order is confirmed. Will deliver within 20 minutes');
    }
  }

  /// Get pending order stepper widget based on current order status
  Widget orderPendingWidget(String currentOrderStatus) {
    switch (currentOrderStatus) {
      case AppData.orderStatusPending:
      case AppData.orderStatusConfirmed:
      case AppData.orderStatusProcessing:
      case AppData.orderStatusDelivered:
        return const StepperEnabledWidget(
            timeText: '9:30 AM',
            statusText: 'Order pending',
            statusDescriptionText:
                'Your order is pending for confirmation. Will confirm within 5 minutes.');
      default:
        return const StepperDisabledWidget(
            statusText: 'Order pending',
            statusDescriptionText:
                'Your order is pending for confirmation. Will confirm within 5 minutes.');
    }
  }

  /// Get placed order stepper widget based on current order status
  Widget orderPlacedWidget(String currentOrderStatus) {
    switch (currentOrderStatus) {
      case AppData.orderStatusPlaced:
      case AppData.orderStatusPending:
      case AppData.orderStatusConfirmed:
      case AppData.orderStatusProcessing:
      case AppData.orderStatusDelivered:
        return const StepperEnabledWidget(
            timeText: '9:30 AM',
            statusText: 'Order placed',
            statusDescriptionText:
                'Your order #2783839 was placed for delivery.');
      default:
        return const StepperDisabledWidget(
            statusText: 'Order placed',
            statusDescriptionText:
                'Your order #2783839 was placed for delivery.');
    }
  }

  /// Get bottom button widget based on current order status
  Widget bottomButtonWidget(
      BuildContext screenContext, String currentOrderStatus) {
    switch (currentOrderStatus) {
      case AppData.orderStatusPlaced:
      case AppData.orderStatusPending:
        return CustomStretchedTextButtonWidget(
            buttonText: 'Cancel order', onTap: () {});
      case AppData.orderStatusConfirmed:
      case AppData.orderStatusProcessing:
        return const CustomStretchedTextButtonWidget(
            buttonText: 'Cancel order', onTap: null);
      case AppData.orderStatusDelivered:
        return CustomStretchedTextButtonWidget(
            buttonText: 'Leave a feedback',
            onTap: () {
              // Get.toNamed(screenContext, AppPageNames.addReviewScreen);
            });
      default:
        return const CustomStretchedTextButtonWidget(
            buttonText: 'Cancel order', onTap: null);
    }
  }
}
