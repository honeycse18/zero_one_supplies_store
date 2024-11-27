import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/constants/app_text_styles.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialogs {
  static Future<Object?> showSuccessDialog(
      {String? titleText, required String messageText}) async {
    final String dialogTitle = titleText ?? 'Success';
    return await Get.dialog(AlertDialogWidget(
      backgroundColor: AppColors.successBackgroundColor,
      titleWidget: Text(dialogTitle,
          style: AppTextStyles.titleSmallSemiboldTextStyle
              .copyWith(color: AppColors.successColor),
          textAlign: TextAlign.center),
      contentWidget: Text(messageText,
          style: AppTextStyles.bodyLargeSemiboldTextStyle,
          textAlign: TextAlign.center),
      actionWidgets: [
        CustomStretchedTextButtonWidget(
          buttonText: 'OK',
          // backgroundColor: AppColors.successColor,
          onTap: () {
            Get.back();
          },
        )
      ],
    ));
  }

  static Future<Object?> showStoreSetupSuccessDialog(
      {String? titleText, required String messageText}) async {
    final String dialogTitle = titleText ?? 'Success';
    return await Get.dialog(AlertDialogWidget(
      backgroundColor: AppColors.successBackgroundColor,
      titleWidget: Text(dialogTitle,
          style: AppTextStyles.titleSmallSemiboldTextStyle
              .copyWith(color: AppColors.successColor),
          textAlign: TextAlign.center),
      contentWidget: Text(messageText,
          style: AppTextStyles.bodyLargeSemiboldTextStyle,
          textAlign: TextAlign.center),
      actionWidgets: [
        CustomStretchedTextButtonWidget(
          buttonText: 'OK',
          // backgroundColor: AppColors.successColor,
          onTap: () {
            // Get.toNamed(AppPageNames.homeNavigatorScreen);
            Get.toNamed(AppPageNames.signInScreen);
          },
        )
      ],
    ));
  }

  static Future<Object?> showErrorDialog(
      {String? titleText, required String messageText}) async {
    final String dialogTitle = titleText ?? 'Error';
    return await Get.dialog(AlertDialogWidget(
      backgroundColor: AppColors.alertBackgroundColor,
      titleWidget: Text(dialogTitle,
          style: AppTextStyles.titleSmallSemiboldTextStyle
              .copyWith(color: AppColors.alertColor),
          textAlign: TextAlign.center),
      contentWidget: Text(messageText,
          style: AppTextStyles.bodyLargeSemiboldTextStyle,
          textAlign: TextAlign.center),
      actionWidgets: [
        CustomStretchedTextButtonWidget(
          buttonText: 'OK',
          // backgroundColor: AppColors.alertColor,
          onTap: () {
            Get.back();
          },
        )
      ],
    ));
  }

  static Future<Object?> showConfirmDialog({
    String titleText = 'Confirm',
    required String messageText,
    required Future<void> Function() onYesTap,
    void Function()? onNoTap,
    bool shouldCloseDialogOnceYesTapped = true,
    String yesButtonText = 'Yes',
    String noButtonText = 'No',
  }) async {
    return await Get.dialog(AlertDialogWidget(
      titleWidget: Text(titleText,
          style: AppTextStyles.titleSmallSemiboldTextStyle,
          textAlign: TextAlign.center),
      contentWidget: Text(messageText,
          style: AppTextStyles.bodyLargeSemiboldTextStyle,
          textAlign: TextAlign.center),
      actionWidgets: [
        Row(
          children: [
            Expanded(
              child: CustomStretcheOutlinedTextButtonWidget(
                buttonText: noButtonText,
                onTap: onNoTap ??
                    () {
                      Get.back();
                    },
              ),
            ),
            AppGaps.wGap12,
            Expanded(
              child: CustomStretchedTextButtonWidget(
                buttonText: yesButtonText,
                onTap: () async {
                  await onYesTap();
                  if (shouldCloseDialogOnceYesTapped) Get.back();
                },
              ),
            ),
          ],
        )
      ],
    ));
  }

  static Future<Object?> showActionableDialog(
      {String titleText = 'Error',
      required String messageText,
      Color titleTextColor = AppColors.alertColor,
      String buttonText = 'OK',
      void Function()? onTap}) async {
    return await Get.dialog(AlertDialogWidget(
      backgroundColor: AppColors.alertBackgroundColor,
      titleWidget: Text(titleText,
          style: AppTextStyles.titleSmallSemiboldTextStyle
              .copyWith(color: titleTextColor),
          textAlign: TextAlign.center),
      contentWidget: Text(messageText,
          style: AppTextStyles.bodyLargeSemiboldTextStyle,
          textAlign: TextAlign.center),
      actionWidgets: [
        CustomStretchedTextButtonWidget(
          buttonText: buttonText,
          // backgroundColor: AppColors.alertColor,
          onTap: onTap,
        )
      ],
    ));
  }

  static Future<Object?> showProcessingDialog(
      {String message = 'Processing'}) async {
    return await Get.dialog(
        AlertDialogWidget(
          titleWidget: Text(message,
              style: AppTextStyles.headlineLargeBoldTextStyle,
              textAlign: TextAlign.center),
          contentWidget: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              AppGaps.hGap16,
              Text('Please wait', textAlign: TextAlign.center),
            ],
          ),
        ),
        barrierDismissible: false);
  }

  static Future<Object?> showImageProcessingDialog() async {
    return await Get.dialog(
        const AlertDialogWidget(
          titleWidget: Text('Image is processing',
              style: AppTextStyles.headlineLargeBoldTextStyle,
              textAlign: TextAlign.center),
          contentWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              AppGaps.hGap16,
              Text(
                'Please wait',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        barrierDismissible: false);
  }
}
