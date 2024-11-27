import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// This file contains various components for the app
class AppComponents {
  static const defaultBorderRadius =
      Radius.circular(Constants.defaultBorderRadiusValue);
  static const defaultBorder =
      BorderRadius.all(Radius.circular(Constants.defaultBorderRadiusValue));
  static const BorderRadius bottomSheetBorderRadius = BorderRadius.vertical(
      top: Radius.circular(Constants.bottomSheetBorderRadiusValue));

  static const BorderRadius dialogBorderRadius =
      BorderRadius.all(Radius.circular(Constants.dialogBorderRadiusValue));

  static const BorderRadius smallBorderRadius =
      BorderRadius.all(Radius.circular(Constants.smallBorderRadiusValue));

  static const BorderRadius productGridItemBorderRadius = BorderRadius.all(
      Radius.circular(Constants.auctionGridItemBorderRadiusValue));
  static final apiDateTimeFormat = DateFormat(Constants.apiDateTimeFormatValue);
  static NumberFormat defaultNumberFormat =
      NumberFormat.currency(symbol: r'$', decimalDigits: 2);
  static const BorderRadius imageBorderRadius =
      BorderRadius.all(Radius.circular(Constants.imageBorderRadiusValue));
  static final DateTime defaultUnsetDateTime =
      DateTime(Constants.defaultUnsetDateTimeYear);
  static const EdgeInsets dialogTitlePadding = EdgeInsets.fromLTRB(
      Constants.dialogHorizontalSpaceValue,
      Constants.dialogVerticalSpaceValue,
      Constants.dialogHorizontalSpaceValue,
      Constants.dialogVerticalSpaceValue);
  static const EdgeInsets dialogContentPadding = EdgeInsets.fromLTRB(
      Constants.dialogHorizontalSpaceValue,
      Constants.dialogHalfVerticalSpaceValue,
      Constants.dialogHorizontalSpaceValue,
      Constants.dialogVerticalSpaceValue);
  static const EdgeInsets dialogActionPadding = EdgeInsets.fromLTRB(
      Constants.dialogHorizontalSpaceValue,
      Constants.dialogVerticalSpaceValue,
      Constants.dialogHorizontalSpaceValue,
      Constants.dialogVerticalSpaceValue);

  static BorderRadius getBorderRadius(double radiusValue) =>
      BorderRadius.all(Radius.circular(radiusValue));
}
