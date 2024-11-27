import 'dart:developer';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_text_styles.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:ecomikstoreapp/widgets/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';

/// This class contains functions that return a widget
class CoreWidgets {
  static AppBar appBarWidget(
      {required BuildContext screenContext,
      Widget? titleWidget,
      Widget? leading,
      List<Widget>? actions,
      bool hasBackButton = true,
      void Function()? onBackButtonTap}) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading: hasBackButton
          ? Center(
              child: CustomIconButtonWidget(
                  onTap: () {
                    onBackButtonTap != null ? onBackButtonTap() : Get.back();
                  },
                  hasShadow: true,
                  child: SvgPicture.asset(
                    AppAssetImages.arrowLeftSVGLogoLine,
                    color: AppColors.darkColor,
                    height: 18,
                    width: 18,
                  )),
            )
          : leading,
      title: titleWidget,
      actions: actions,
    );
  }

  static PagedChildBuilderDelegate<ItemType>
      pagedChildBuilderDelegate<ItemType>({
    required Widget Function(BuildContext, ItemType, int) itemBuilder,
    Widget Function(BuildContext)? errorIndicatorBuilder,
    Widget Function(BuildContext)? noItemFoundIndicatorBuilder,
    Widget Function(BuildContext)? firstPageLoadingIndicatorBuilder,
    Widget Function(BuildContext)? newPageLoadingIndicatorBuilder,
  }) {
    final firstPageProgressIndicatorBuilder =
        firstPageLoadingIndicatorBuilder ??
            (context) => const Center(child: CircularProgressIndicator());
    final newPageProgressIndicatorBuilder = newPageLoadingIndicatorBuilder ??
        (context) => const Center(child: CircularProgressIndicator());
    final pageErrorIndicatorBuilder =
        errorIndicatorBuilder ?? (context) => const ErrorPaginationWidget();
    final noItemsFoundIndicatorBuilder = noItemFoundIndicatorBuilder ??
        (context) => const ErrorPaginationWidget();
    return PagedChildBuilderDelegate<ItemType>(
        itemBuilder: itemBuilder,
        firstPageErrorIndicatorBuilder: pageErrorIndicatorBuilder,
        newPageErrorIndicatorBuilder: pageErrorIndicatorBuilder,
        noItemsFoundIndicatorBuilder: noItemsFoundIndicatorBuilder,
        firstPageProgressIndicatorBuilder: firstPageProgressIndicatorBuilder,
        newPageProgressIndicatorBuilder: newPageProgressIndicatorBuilder,
        animateTransitions: true,
        transitionDuration: const Duration(milliseconds: 200));
  }
}

class ErrorPaginationWidget extends StatelessWidget {
  final String errorMessage;
  const ErrorPaginationWidget({
    super.key,
    this.errorMessage = 'Error occurred while loading',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 150,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ErrorLoadedIconWidget(isLargeIcon: true),
            AppGaps.hGap5,
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMediumTextStyle,
            ),
          ],
        ));
  }
}

/// Custom padded body widget for scaffold
class CustomScaffoldBodyWidget extends StatelessWidget {
  final Widget child;
  const CustomScaffoldBodyWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppGaps.screenPaddingValue),
      child: child,
    );
  }
}

/// Custom padded bottom bar widget for scaffold
class CustomScaffoldBottomBarWidget extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  const CustomScaffoldBottomBarWidget(
      {super.key,
      required this.child,
      this.backgroundColor,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppGaps.bottomNavBarPadding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}

/// Custom TextButton with small elevation shadow
class CustomTextButtonWidget extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  const CustomTextButtonWidget({
    super.key,
    this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          // color: AppColors.secondaryColor.withOpacity(0.5),
          gradient: onTap == null
              ? LinearGradient(colors: [
                  AppColors.secondaryColor.withOpacity(0.5),
                  AppColors.secondaryColor.withOpacity(0.5)
                ])
              : LinearGradient(colors: [
                  AppColors.secondaryColor,
                  AppColors.secondaryColor.withOpacity(0.4),
                ])),
      child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              elevation: onTap == null ? 0 : 10,
              shadowColor: AppColors.secondaryColor.withOpacity(0.25),
              // backgroundColor: onTap == null
              //     ? AppColors.secondaryColor.withOpacity(0.15)
              //     : AppColors.secondaryColor,
              minimumSize: const Size(30, 62),
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(AppComponents.defaultBorderRadius))),
          child: Text(buttonText,
              style:
                  onTap == null ? const TextStyle(color: Colors.white) : null)),
    );
  }
}

/// Custom TextButton stretches the width of the screen with small elevation
/// shadow
class CustomStretchedTextButtonWidget extends StatelessWidget {
  final bool isLoading;
  final String buttonText;
  final void Function()? onTap;
  final void Function()? onLongPress;
  const CustomStretchedTextButtonWidget({
    super.key,
    this.isLoading = false,
    this.onTap,
    required this.buttonText,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingPlaceholderWidget(
        child: StretchedTextButtonWidget(
            onTap: onTap, onLongPress: onLongPress, buttonText: buttonText),
      );
    }
    return StretchedTextButtonWidget(
        onTap: onTap, onLongPress: onLongPress, buttonText: buttonText);
  }
}

class StretchedTextButtonWidget extends StatelessWidget {
  const StretchedTextButtonWidget({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.buttonText,
  });

  final void Function()? onTap;
  final void Function()? onLongPress;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                // color: AppColors.secondaryColor.withOpacity(0.5),
                gradient: onTap == null
                    ? LinearGradient(colors: [
                        AppColors.secondaryColor.withOpacity(0.5),
                        AppColors.secondaryColor.withOpacity(0.5)
                      ])
                    : LinearGradient(colors: [
                        AppColors.secondaryColor,
                        AppColors.secondaryColor.withOpacity(0.4),
                      ])),
            child: TextButton(
                onPressed: onTap,
                onLongPress: onLongPress,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    elevation: onTap == null ? 0 : 10,
                    shadowColor: AppColors.secondaryColor.withOpacity(0.25),
                    // backgroundColor: onTap == null
                    //     ? AppColors.secondaryColor.withOpacity(0.15)
                    //     : AppColors.secondaryColor,
                    minimumSize: const Size(30, 62),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            AppComponents.defaultBorderRadius))),
                child: Text(buttonText,
                    style: onTap == null
                        ? const TextStyle(color: Colors.white)
                        : null)),
          ),
        ),
      ],
    );
  }
}

/// Custom TextButton stretches the width of the screen with small elevation
/// shadow
class LoadingCustomStretchedTextButtonWidget extends StatelessWidget {
  final String buttonText;
  const LoadingCustomStretchedTextButtonWidget({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LoadingPlaceholderWidget(
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  // color: AppColors.secondaryColor.withOpacity(0.5),
                  gradient: LinearGradient(colors: [
                    AppColors.secondaryColor.withOpacity(0.5),
                    AppColors.secondaryColor.withOpacity(0.5)
                  ])),
              child: TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: AppColors.secondaryColor.withOpacity(0.25),
                      // backgroundColor: onTap == null
                      //     ? AppColors.secondaryColor.withOpacity(0.15)
                      //     : AppColors.secondaryColor,
                      minimumSize: const Size(30, 62),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              AppComponents.defaultBorderRadius))),
                  child: Text(buttonText)),
            ),
          ),
        ),
      ],
    );
  }
}

/// Custom TextButton with small elevation shadow with custom child widget
class CustomOutlinedButtonWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  const CustomOutlinedButtonWidget({
    super.key,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          // elevation: 1000,
          // shadowColor: Colors.white,
          foregroundColor: AppColors.secondaryColor,
          minimumSize: const Size(30, 62),
          shape: const RoundedRectangleBorder(
              // side: BorderSide(color: Colors.black12),
              borderRadius:
                  BorderRadius.all(AppComponents.defaultBorderRadius)),
        ),
        child: child);
  }
}

class CustomStretchedOutlinedTextButtonWidget extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  final double minHeight;
  final double borderRadiusValue;
  const CustomStretchedOutlinedTextButtonWidget({
    super.key,
    this.onTap,
    required this.buttonText,
    this.minHeight = 62,
    this.borderRadiusValue = Constants.buttonBorderRadiusValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                // elevation: 1000,
                // shadowColor: Colors.white,
                // foregroundColor: AppColors.primaryColor,
                minimumSize: Size(30, minHeight),
                shape: RoundedRectangleBorder(
                    // side: BorderSide(color: Colors.black12),
                    side: const BorderSide(color: AppColors.primaryColor),
                    borderRadius:
                        AppComponents.getBorderRadius(borderRadiusValue)),
              ),
              child: Text(buttonText, textAlign: TextAlign.center)),
        ),
      ],
    );
  }
}

/// Custom TextButton with small elevation shadow with custom child widget
class LoadingCustomOutlinedButtonWidget extends StatelessWidget {
  final Widget child;
  const LoadingCustomOutlinedButtonWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingPlaceholderWidget(
      child: OutlinedButton(
          onPressed: null,
          style: OutlinedButton.styleFrom(
            // elevation: 1000,
            // shadowColor: Colors.white,
            foregroundColor: AppColors.secondaryColor,
            minimumSize: const Size(30, 62),
            shape: const RoundedRectangleBorder(
                // side: BorderSide(color: Colors.black12),
                borderRadius:
                    BorderRadius.all(AppComponents.defaultBorderRadius)),
          ),
          child: child),
    );
  }
}

/// Custom TextButton stretches the width of the screen with small elevation
/// shadow with custom child widget
class CustomStretchedOutlinedButtonWidget extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final void Function()? onTap;
  const CustomStretchedOutlinedButtonWidget({
    super.key,
    this.onTap,
    required this.child,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: isLoading
              ? LoadingCustomOutlinedButtonWidget(child: child)
              : CustomOutlinedButtonWidget(onTap: onTap, child: child),
        ),
      ],
    );
  }
}

class CustomStretcheOutlinedTextButtonWidget extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  const CustomStretcheOutlinedTextButtonWidget({
    super.key,
    this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:
              CustomOutlinedButtonWidget(onTap: onTap, child: Text(buttonText)),
        ),
      ],
    );
  }
}

//=========================================================================================================
/// Custom TextButton stretches the width of the screen with small elevation
/// shadow with custom child widget
class CustomStretchedButtonWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final bool isLoading;
  const CustomStretchedButtonWidget({
    super.key,
    this.onTap,
    required this.child,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingPlaceholderWidget(
          child: StretchedButtonWidget(onTap: onTap, child: child));
    }
    return StretchedButtonWidget(onTap: onTap, child: child);
  }
}

class StretchedButtonWidget extends StatelessWidget {
  const StretchedButtonWidget({
    super.key,
    required this.onTap,
    required this.child,
  });

  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  elevation: 10,
                  shadowColor: AppColors.secondaryColor.withOpacity(0.25),
                  backgroundColor: onTap == null
                      ? AppColors.bodyTextColor
                      : AppColors.secondaryColor,
                  minimumSize: const Size(30, 62),
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(AppComponents.defaultBorderRadius))),
              child: child),
        ),
      ],
    );
  }
}
/* 
//Toggle switch
class CustomSwitch extends StatefulWidget {
  final bool value;
  final Color enableColor;
  final Color disableColor;
  final double width;
  final double height;
  final double switchHeight;
  final double switchWidth;
  final ValueChanged<bool> onChanged;

  CustomSwitch(
      {Key? key,
      required this.value,
      required this.enableColor,
      required this.disableColor,
      required this.width,
      required this.height,
      required this.switchHeight,
      required this.switchWidth,
      required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: widget.width ?? 48.0,
            height: widget.height ?? 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _circleAnimation.value == Alignment.centerLeft
                  ? widget.disableColor
                  : widget.enableColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: widget.switchWidth ?? 20.0,
                  height: widget.switchHeight ?? 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
} */

/// Custom toggle button of tab widget
class CustomTabToggleButtonWidget extends StatelessWidget {
  final bool isSelected;
  final String text;
  final void Function()? onTap;
  final double borderRadiusValue;
  const CustomTabToggleButtonWidget(
      {super.key,
      required this.isSelected,
      required this.text,
      this.onTap,
      this.borderRadiusValue = 12});

  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: Duration.zero,
      color: isSelected ? AppColors.secondaryColor : Colors.transparent,
      elevation: isSelected ? 10 : 0,
      shadowColor:
          isSelected ? AppColors.secondaryColor.withOpacity(0.25) : null,
      borderRadius: BorderRadius.all(Radius.circular(borderRadiusValue)),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(borderRadiusValue)),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusValue)),
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: isSelected ? Colors.white : null),
            ),
          ),
        ),
      ),
    );
  }
}

/// Minus, counter, plus buttons row for product cart counter.
class PlusMinusCounterRow extends StatelessWidget {
  final void Function()? onRemoveTap;
  final String counterText;
  final void Function()? onAddTap;
  const PlusMinusCounterRow({
    super.key,
    required this.onRemoveTap,
    required this.counterText,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIconButtonWidget(
              backgroundColor: AppColors.shadeColor1,
              borderRadiusRadiusValue: const Radius.circular(6),
              fixedSize: const Size(24, 24),
              onTap: onRemoveTap,
              child: SvgPicture.asset(
                AppAssetImages.minusSVGLogoSolid,
                color: AppColors.bodyTextColor,
                height: 12,
                width: 12,
              )),
          AppGaps.wGap10,
          Expanded(
            child: Center(
              child: Text(
                counterText,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 12, color: AppColors.darkColor),
              ),
            ),
          ),
          AppGaps.wGap10,
          CustomIconButtonWidget(
              backgroundColor: AppColors.secondaryColor,
              borderRadiusRadiusValue: const Radius.circular(6),
              fixedSize: const Size(24, 24),
              onTap: onAddTap,
              child: SvgPicture.asset(
                AppAssetImages.plusSVGLogoSolid,
                color: Colors.white,
                height: 12,
                width: 12,
              )),
        ],
      ),
    );
  }
}

/// Custom TextFormField configured with Theme.
class TextFormFieldWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPasswordTextField;
  final bool isRequired;
  final bool hasShadow;
  final bool isReadOnly;
  final BoxConstraints prefixIconConstraints;
  final TextInputType? textInputType;
  final BoxConstraints suffixIconConstraints;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int? minLines;
  final int maxLines;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const TextFormFieldWidget({
    super.key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.isPasswordTextField = false,
    this.isRequired = false,
    this.hasShadow = false,
    this.prefixIconConstraints =
        const BoxConstraints(maxHeight: 48, maxWidth: 48),
    this.suffixIconConstraints =
        const BoxConstraints(maxHeight: 48, maxWidth: 48),
    this.isReadOnly = false,
    this.textInputType,
    this.controller,
    this.focusNode,
    this.minLines,
    this.maxLines = 1,
    this.onTap,
    this.onChanged,
    this.initialValue,
    this.validator,
  });

  /// TextField widget
  Widget textFormFieldWidget() {
    return SizedBox(
      // height: (maxLines > 1 || (minLines ?? 1) > 1) ? null : 62,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onTap: onTap,
        readOnly: isReadOnly,
        onChanged: onChanged,
        obscureText: isPasswordTextField,
        keyboardType: textInputType,
        validator: validator,
        initialValue: initialValue,
        minLines: minLines,
        maxLines: maxLines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          prefix: AppGaps.wGap16,
          prefixIconConstraints: prefixIconConstraints,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: prefixIcon,
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          suffixIconConstraints: suffixIconConstraints,
          suffix: AppGaps.wGap10,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: suffixIcon,
                )
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // If label text is not null, then show label as a separate Text widget
    // wrapped inside column widget.
    // Else, just return the TextFormField widget.
    if (labelText != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label text
          isRequired
              ? Row(
                  children: [
                    Text(labelText!,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: AppTextStyles.labelTextStyle),
                    AppGaps.wGap5,
                    Text('*',
                        style: AppTextStyles.labelTextStyle
                            .copyWith(color: AppColors.alertColor)),
                  ],
                )
              : Text(labelText!,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: AppTextStyles.labelTextStyle),
          AppGaps.hGap8,
          // Text field
          hasShadow
              ? PhysicalModel(
                  color: Colors.transparent,
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.25),
                  child: textFormFieldWidget(),
                )
              : textFormFieldWidget(),
        ],
      );
    } else {
      // Text field
      return hasShadow
          ? PhysicalModel(
              color: Colors.transparent,
              elevation: 10,
              shadowColor: Colors.black.withOpacity(0.25),
              child: textFormFieldWidget())
          : textFormFieldWidget();
    }
  }
}

class SliverListItemWidget extends StatelessWidget {
  final Widget itemWidget;
  final Widget dividerWidget;
  final int currentIndex;
  final int listLength;
  const SliverListItemWidget({
    super.key,
    required this.itemWidget,
    required this.dividerWidget,
    required this.currentIndex,
    required this.listLength,
  });

  @override
  Widget build(BuildContext context) {
    final bool showDivider = Helper.showDividerWidget(
        listCurrentIndex: currentIndex, listLength: listLength);
    return showDivider
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [itemWidget, if (showDivider) dividerWidget],
          )
        : itemWidget;
  }
}

class LabelWithRightTextButtonWidget extends StatelessWidget {
  final bool isRequired;
  final String labelText;
  final String buttonText;
  final void Function()? onButtonTap;
  const LabelWithRightTextButtonWidget(
      {super.key,
      this.isRequired = false,
      required this.labelText,
      required this.buttonText,
      this.onButtonTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: isRequired
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        labelText,
                        style: AppTextStyles.labelTextStyle,
                      ),
                      AppGaps.wGap5,
                      Text(
                        '*',
                        style: AppTextStyles.labelTextStyle
                            .copyWith(color: AppColors.alertColor),
                      ),
                    ],
                  )
                : Text(
                    labelText,
                    style: AppTextStyles.labelTextStyle,
                  )),
        TextButton(
            onPressed: onButtonTap,
            child: Text(
              buttonText,
              style: AppTextStyles.bodyLargeSemiboldTextStyle,
            ))
      ],
    );
  }
}

class DropdownButtonFormFieldWidget<T> extends StatelessWidget {
  final T? value;
  final String hintText;
  final Widget? prefixIcon;
  final bool isRequired;
  final bool isLoading;
  final String textButton;
  final String? labelText;
  final BoxConstraints prefixIconConstraints;
  final List<T>? items;
  final String Function(T) getItemText;
  final void Function(T?)? onChanged;
  final void Function()? onAddButtonTap;
  final String? Function(T?)? validator;
  const DropdownButtonFormFieldWidget(
      {super.key,
      this.value,
      this.onAddButtonTap,
      required this.hintText,
      this.prefixIcon,
      this.textButton = '',
      this.items,
      required this.getItemText,
      this.prefixIconConstraints =
          const BoxConstraints(maxHeight: 48, maxWidth: 48),
      required this.onChanged,
      this.labelText,
      this.validator,
      this.isLoading = false,
      this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: isRequired
                      ? Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              labelText!,
                              style: AppTextStyles.labelTextStyle,
                            ),
                            AppGaps.wGap5,
                            Text(
                              '*',
                              style: AppTextStyles.labelTextStyle
                                  .copyWith(color: AppColors.alertColor),
                            ),
                          ],
                        )
                      : Text(
                          labelText!,
                          style: AppTextStyles.labelTextStyle,
                        )),
              TextButton(
                  onPressed: onAddButtonTap,
                  child: Text(
                    textButton,
                    style: AppTextStyles.bodyLargeSemiboldTextStyle,
                  ))
            ],
          ),
        if (labelText != null) AppGaps.hGap8,
        Builder(builder: (context) {
          if (isLoading) {
            return const DropdownButtonFormFieldLoadingWidget();
          }
          try {
            return DropdownButtonFormField<T>(
              isExpanded: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              value: value,
              borderRadius: AppComponents.defaultBorder,
              hint: Text(hintText),
              disabledHint: Text(hintText,
                  style: AppTextStyles.labelTextStyle.copyWith(
                      color: AppColors.bodyTextColor.withOpacity(0.5))),
              icon: LocalAssetSVGIcon(AppAssetImages.dropdownArrow,
                  color: isDisabled()
                      ? AppColors.bodyTextColor.withOpacity(0.5)
                      : AppColors.bodyTextColor),
              // iconEnabledColor: AppColors.bodyTextColor,
              // iconDisabledColor: AppColors.lineShapeColor,
              decoration: InputDecoration(
                  prefixIconConstraints: prefixIconConstraints,
                  prefixIcon: prefixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: prefixIcon,
                        )
                      : null,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20)),
              items: items
                  ?.map((e) =>
                      DropdownMenuItem(value: e, child: Text(getItemText(e))))
                  .toList(),
              onChanged: onChanged,
            );
          } catch (e) {
            log('Caught exception on ${runtimeType.toString()}');
            log(e.toString());
            return DropdownButtonFormField<T>(
              isExpanded: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              value: null,
              borderRadius: AppComponents.defaultBorder,
              hint: Text(hintText),
              disabledHint: Text(hintText,
                  style: AppTextStyles.labelTextStyle.copyWith(
                      color: AppColors.bodyTextColor.withOpacity(0.5))),
              icon: LocalAssetSVGIcon(AppAssetImages.dropdownArrow,
                  color: isDisabled()
                      ? AppColors.bodyTextColor.withOpacity(0.5)
                      : AppColors.bodyTextColor),
              // iconEnabledColor: AppColors.bodyTextColor,
              // iconDisabledColor: AppColors.lineShapeColor,
              decoration: InputDecoration(
                  prefixIconConstraints: prefixIconConstraints,
                  prefixIcon: prefixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: prefixIcon,
                        )
                      : null,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20)),
              items: items
                  ?.map((e) =>
                      DropdownMenuItem(value: e, child: Text(getItemText(e))))
                  .toList(),
              onChanged: onChanged,
            );
          }
        }),
      ],
    );
  }

  bool isDisabled() =>
      onChanged == null || (items == null || (items?.isEmpty ?? true));
}

class LocalAssetSVGIcon extends StatelessWidget {
  final String iconLocalAssetLocation;
  final Color color;
  final double height;
  final double? width;
  const LocalAssetSVGIcon(this.iconLocalAssetLocation,
      {super.key, required, required this.color, this.height = 24, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(iconLocalAssetLocation,
        height: height,
        width: width ?? height,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  }
}

class CustomRadioWidget extends StatelessWidget {
  final Object value;
  final Object? groupValue;
  final Function(Object?) onChanged;
  const CustomRadioWidget(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Radio<Object>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}

/// Custom IconButton widget various attributes
class CustomIconButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final Border? border;
  final Widget child;
  final Color backgroundColor;
  final Size fixedSize;
  final Radius borderRadiusRadiusValue;
  final bool isCircleShape;
  final bool hasShadow;
  const CustomIconButtonWidget(
      {super.key,
      this.onTap,
      required this.child,
      this.backgroundColor = Colors.white,
      this.fixedSize = const Size(40, 40),
      this.borderRadiusRadiusValue = const Radius.circular(14),
      this.border,
      this.isCircleShape = false,
      this.hasShadow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fixedSize.height,
      width: fixedSize.width,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          shape: isCircleShape ? BoxShape.circle : BoxShape.rectangle,
          borderRadius:
              isCircleShape ? null : BorderRadius.all(borderRadiusRadiusValue),
          border: border),
      child: Material(
        color: backgroundColor,
        shape: isCircleShape ? const CircleBorder() : null,
        shadowColor: hasShadow ? Colors.black.withOpacity(0.4) : null,
        elevation: hasShadow ? 8 : 0,
        borderRadius:
            isCircleShape ? null : BorderRadius.all(borderRadiusRadiusValue),
        child: InkWell(
          onTap: onTap,
          customBorder: isCircleShape ? const CircleBorder() : null,
          borderRadius: BorderRadius.all(borderRadiusRadiusValue),
          child: Center(child: child),
        ),
      ),
    );
  }
}

/// Custom large text button widget
class CustomLargeTextButtonWidget extends StatelessWidget {
  final bool isSmallScreen;
  final void Function()? onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  const CustomLargeTextButtonWidget({
    super.key,
    this.onTap,
    required this.text,
    this.backgroundColor = AppColors.secondaryColor,
    this.textColor = Colors.white,
    this.isSmallScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
            foregroundColor: textColor,
            fixedSize:
                isSmallScreen ? const Size(140, 55) : const Size(175, 65),
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            backgroundColor: backgroundColor,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(AppComponents.defaultBorderRadius))),
        child: Text(text));
  }
}

/// Raw list tile does not have a background color
class CustomRawListTileWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final Radius? borderRadiusRadiusValue;
  const CustomRawListTileWidget({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadiusRadiusValue,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadiusRadiusValue != null
          ? BorderRadius.all(borderRadiusRadiusValue!)
          : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadiusRadiusValue != null
            ? BorderRadius.all(borderRadiusRadiusValue!)
            : null,
        child: child,
      ),
    );
  }
}

/// Raw button widget
class RawButtonWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final double? borderRadiusValue;
  const RawButtonWidget({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadiusValue,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadiusValue != null
          ? BorderRadius.all(Radius.circular(borderRadiusValue!))
          : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadiusValue != null
            ? BorderRadius.all(Radius.circular(borderRadiusValue!))
            : null,
        child: child,
      ),
    );
  }
}

class CustomListTileWidget extends StatelessWidget {
  final bool hasShadow;
  final bool darkerShadow;
  final double elevation;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget child;
  final EdgeInsets paddingValue;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  const CustomListTileWidget(
      {super.key,
      required this.child,
      this.onTap,
      this.paddingValue = const EdgeInsets.all(AppGaps.screenPaddingValue),
      this.onLongPress,
      this.borderRadius =
          const BorderRadius.all(AppComponents.defaultBorderRadius),
      this.hasShadow = false,
      this.elevation = 10,
      this.darkerShadow = false,
      this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: hasShadow ? elevation : 0,
      shadowColor: darkerShadow
          ? Colors.black.withOpacity(0.3)
          : Colors.black.withOpacity(0.05),
      borderRadius: borderRadius,
      child: Material(
        color: backgroundColor,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          onLongPress: onLongPress,
          child: Container(
            alignment: Alignment.topLeft,
            padding: paddingValue,
            decoration: BoxDecoration(borderRadius: borderRadius),
            child: child,
          ),
        ),
      ),
    );
  }
}

class CustomHorizontalDashedLineWidget extends StatelessWidget {
  const CustomHorizontalDashedLineWidget({
    super.key,
    this.height = 1,
    this.color = Colors.black,
  });
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

class CustomVerticalDashedLineWidget extends StatelessWidget {
  const CustomVerticalDashedLineWidget({
    super.key,
    this.width = 1,
    this.color = Colors.black,
  });
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxHeight = constraints.constrainWidth();
        const dashHeight = 4.0;
        final dashWidth = width;
        final dashCount = (boxHeight / (2 * dashHeight)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

/// Credit card widget with 3 shadows towards bottom
class PaymentCardWidget extends StatelessWidget {
  final Widget child;
  const PaymentCardWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232,
      alignment: Alignment.topCenter,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(child: Container(alignment: Alignment.topCenter)),
          Container(
            height: 208,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(left: 32, right: 32, top: 24),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Container(
            height: 208,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor.withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Container(
            height: 208,
            decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: Image.asset(AppAssetImages.paymentCardAbstractShape,
                            cacheHeight: 163,
                            cacheWidth: 163,
                            height: 163,
                            width: 163)
                        .image,
                    alignment: Alignment.topRight)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class HighlightAndDetailTextWidget extends StatelessWidget {
  final String slogan;
  final String subtitle;
  final bool isSpaceShorter;
  const HighlightAndDetailTextWidget({
    super.key,
    required this.slogan,
    required this.subtitle,
    this.isSpaceShorter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(slogan,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall),
        isSpaceShorter ? AppGaps.hGap8 : AppGaps.hGap16,
        Text(subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.bodyTextColor, overflow: TextOverflow.clip)),
      ],
    );
  }
}

class WishlistItemButtonWidget extends StatelessWidget {
  final bool isWishListed;
  final void Function()? onTap;
  const WishlistItemButtonWidget({
    super.key,
    required this.isWishListed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
      icon: SvgPicture.asset(
        AppAssetImages.heartSVGLogoSolid,
        color: isWishListed
            ? AppColors.secondaryColor
            : AppColors.darkColor.withOpacity(0.15),
      ),
    );
  }
}

/// Custom TextButton widget which is very tight to child text
class CustomTightTextButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const CustomTightTextButtonWidget({
    super.key,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity)),
        child: child);
  }
}

class CustomGridSingleItemWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color? borderColor;
  final BorderRadius borderRadius;
  final void Function()? onTap;
  const CustomGridSingleItemWidget({
    super.key,
    this.onTap,
    this.backgroundColor = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.padding = const EdgeInsets.all(7.5),
    required this.child,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 13,
            spreadRadius: 1,
            offset: const Offset(0, 5),
            color: Colors.black.withOpacity(0.05))
      ], border: Border.all(color: Colors.white), borderRadius: borderRadius),
      child: Material(
        color: Colors.white.withOpacity(0.5),
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: borderColor != null
                    ? Border.all(color: borderColor!, width: 2)
                    : null),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class AlertDialogWidget extends StatelessWidget {
  final List<Widget>? actionWidgets;
  final Widget? contentWidget;
  final Widget? titleWidget;
  final Color? backgroundColor;
  const AlertDialogWidget({
    super.key,
    this.actionWidgets,
    this.contentWidget,
    this.titleWidget,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      titlePadding: AppComponents.dialogTitlePadding,
      contentPadding: AppComponents.dialogContentPadding,
      shape: const RoundedRectangleBorder(
          borderRadius: AppComponents.dialogBorderRadius),
      title: titleWidget,
      content: contentWidget,
      actions: actionWidgets,
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: AppComponents.dialogActionPadding,
      buttonPadding: EdgeInsets.zero,
    );
  }
}

class LoadingPlaceholderWidget extends StatelessWidget {
  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  const LoadingPlaceholderWidget({
    super.key,
    required this.child,
    this.baseColor = AppColors.shimmerBaseColor,
    this.highlightColor = AppColors.shimmerHighlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: baseColor, highlightColor: highlightColor, child: child);
  }
}

class LoadingImagePlaceholderWidget extends StatelessWidget {
  final double? height;
  final double? width;
  const LoadingImagePlaceholderWidget({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: LoadingPlaceholderWidget(
          child: Image.asset(AppAssetImages.imagePlaceholderIconImage)),
    );
  }
}

class LoadingTextWidget extends StatelessWidget {
  const LoadingTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white, borderRadius: AppComponents.smallBorderRadius),
      ),
    );
  }
}

class DropdownButtonFormFieldLoadingWidget extends StatelessWidget {
  const DropdownButtonFormFieldLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingPlaceholderWidget(
      child: Container(
        height: 60,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: AppComponents.defaultBorder,
            border: Border.all(width: 2)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 120, child: LoadingTextWidget()),
              Spacer(),
              LocalAssetSVGIcon(AppAssetImages.dropdownArrow,
                  color: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorLoadedIconWidget extends StatelessWidget {
  final bool isLargeIcon;
  const ErrorLoadedIconWidget({
    super.key,
    this.isLargeIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Icon(Icons.error_outline,
            size: isLargeIcon ? 40 : null, color: AppColors.alertColor));
  }
}

/// This icon button does not have any padding, margin around it
class TightIconButtonWidget extends StatelessWidget {
  final Widget icon;
  final Function()? onTap;
  const TightIconButtonWidget({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity),
        onPressed: onTap,
        icon: icon);
  }
}

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageURL;
  final BoxFit boxFit;
  final int? cacheHeight;
  final int? cacheWidth;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  const CachedNetworkImageWidget({
    super.key,
    required this.imageURL,
    this.boxFit = BoxFit.cover,
    this.cacheHeight,
    this.cacheWidth,
    this.imageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return imageURL.isEmpty
        ? Image.asset(AppAssetImages.imagePlaceholderIconImage,
            fit: BoxFit.contain)
        : CachedNetworkImage(
            imageUrl: imageURL,
            placeholder: (context, url) =>
                const LoadingImagePlaceholderWidget(),
            errorWidget: (context, url, error) => const ErrorLoadedIconWidget(),
            imageBuilder: imageBuilder,
            memCacheHeight: cacheHeight,
            memCacheWidth: cacheWidth,
            fit: boxFit,
            cacheManager: CacheManager(Config('zero_one_supplies_store_cache',
                stalePeriod: const Duration(days: 2))));
  }
}

class SelectImageButton extends StatelessWidget {
  final void Function()? onTap;
  const SelectImageButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RawButtonWidget(
        borderRadiusValue: Constants.uploadImageButtonBorderRadiusValue,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: const BorderRadius.all(Radius.circular(
                  Constants.uploadImageButtonBorderRadiusValue))),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset(AppAssetImages.uploadSVGLogoLine,
                  color: AppColors.primaryColor, height: 40),
              AppGaps.hGap2,
              const Text('Tap here to upload image',
                  style: AppTextStyles.bodySemiboldTextStyle,
                  textAlign: TextAlign.center),
            ]),
          ),
        ));
  }
}

class SelectedImageWidget extends StatelessWidget {
  final Uint8List selectedImageByte;
  final bool showEditButton;
  final void Function()? onTap;
  final void Function()? onCrossButtonTap;
  final void Function()? onEditButtonTap;

  const SelectedImageWidget({
    super.key,
    required this.selectedImageByte,
    this.onCrossButtonTap,
    this.onTap,
    this.showEditButton = false,
    this.onEditButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 140,
      child: RawButtonWidget(
        borderRadiusValue: Constants.defaultBorderRadiusValue,
        onTap: onTap,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: AppComponents.defaultBorder,
                    image: DecorationImage(
                        image: Image.memory(
                          selectedImageByte,
                        ).image,
                        fit: BoxFit.cover)),
              ),
            ),
            showEditButton
                ? Positioned(
                    top: 5,
                    right: 5,
                    child: TightIconButtonWidget(
                        icon: SvgPicture.asset(
                            AppAssetImages.editOrangeBorderedSVGLogoSolid,
                            height: 24),
                        onTap: onEditButtonTap),
                  )
                : Positioned(
                    top: 5,
                    right: 5,
                    child: TightIconButtonWidget(
                        icon: const LocalAssetSVGIcon(
                            AppAssetImages.crossIconSVG,
                            color: AppColors.alertColor),
                        onTap: onCrossButtonTap),
                  ),
          ],
        ),
      ),
    );
  }
}

class SelectedNetworkImageWidget extends StatelessWidget {
  final String imageURL;
  final void Function()? onTap;
  final void Function()? onEditButtonTap;
  final bool showDeleteButton;
  final void Function()? onDeleteButtonTap;

  const SelectedNetworkImageWidget({
    super.key,
    required this.imageURL,
    this.onTap,
    this.onEditButtonTap,
    this.onDeleteButtonTap,
    this.showDeleteButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 140,
      child: RawButtonWidget(
        borderRadiusValue: Constants.defaultBorderRadiusValue,
        onTap: onTap,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned.fill(
              child: CachedNetworkImageWidget(
                imageURL: imageURL,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: AppComponents.defaultBorder,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Builder(
                builder: (context) {
                  if (showDeleteButton) {
                    return Row(
                      children: [
                        TightIconButtonWidget(
                            icon: SvgPicture.asset(
                                AppAssetImages.editOrangeBorderedSVGLogoSolid,
                                height: 24),
                            onTap: onEditButtonTap),
                        AppGaps.wGap8,
                        TightIconButtonWidget(
                            icon: const LocalAssetSVGIcon(
                                AppAssetImages.deleteSVGLogoLine,
                                color: AppColors.alertColor),
                            onTap: onDeleteButtonTap),
                      ],
                    );
                  }
                  return TightIconButtonWidget(
                      icon: SvgPicture.asset(
                          AppAssetImages.editOrangeBorderedSVGLogoSolid,
                          height: 24),
                      onTap: onEditButtonTap);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFormDatePickerWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final String labelText;
  final String hintText;
  final void Function(DateTime?) onAfterPickDate;
  final void Function()? onDeleteButtonTap;
  final void Function(dynamic)? onError;
  final bool showDeleteButton;
  const TextFormDatePickerWidget({
    super.key,
    required this.textEditingController,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.labelText,
    required this.hintText,
    required this.onAfterPickDate,
    this.onDeleteButtonTap,
    this.showDeleteButton = false,
    this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: textEditingController,
      isReadOnly: true,
      labelText: labelText,
      hintText: hintText,
      textInputType: TextInputType.none,
      suffixIcon: showDeleteButton
          ? TightIconButtonWidget(
              icon: SvgPicture.asset(AppAssetImages.deleteSVGLogoLine,
                  color: AppColors.alertColor),
              onTap: onDeleteButtonTap)
          : null,
      onTap: () async {
        try {
          final DateTime? selectedDateTime = await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: firstDate,
              lastDate: lastDate);
          if (selectedDateTime != null) {
            textEditingController.text =
                Helper.ddMMMyyyyFormattedDateTime(selectedDateTime);
          }
          onAfterPickDate(selectedDateTime);
        } catch (e) {
          AppDialogs.showErrorDialog(
              messageText: 'Something went wrong when selecting a date');
          if (onError != null) {
            onError!(e);
          }
        }
      },
    );
  }
}

class DottedHorizontalLine extends StatelessWidget {
  final Color? dashColor;
  final double dashLength;
  final double dashGapLength;
  const DottedHorizontalLine({
    super.key,
    this.dashColor,
    this.dashLength = 4,
    this.dashGapLength = 4,
  });

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      lineThickness: 1.5,
      dashColor: dashColor ?? AppColors.primaryColor.withOpacity(0.5),
      dashLength: dashLength,
      dashGapLength: dashGapLength,
      dashRadius: 50,
    );
  }
}

class MultiItemedDropdownButtonWidget<T> extends StatelessWidget {
  final T? value;
  final String hintText;
  final Widget? prefixIcon;
  final bool isLoading;
  final String? labelText;
  final String textButton;
  final BoxConstraints prefixIconConstraints;
  final List<T>? items;
  final List<T> selectedItems;
  final bool Function(T, T) isEqual;
  final String Function(T) getItemText;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final void Function()? onAddButtonTap;

  final void Function(int, T) onItemDeleteButtonTap;
  const MultiItemedDropdownButtonWidget({
    super.key,
    this.value,
    required this.hintText,
    this.prefixIcon,
    this.isLoading = false,
    this.labelText,
    this.textButton = '',
    this.prefixIconConstraints =
        const BoxConstraints(maxHeight: 48, maxWidth: 48),
    this.items,
    required this.selectedItems,
    required this.getItemText,
    this.onChanged,
    this.onAddButtonTap,
    this.validator,
    required this.isEqual,
    required this.onItemDeleteButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormFieldWidget<T>(
          onAddButtonTap: onAddButtonTap,
          textButton: textButton,
          labelText: labelText,
          hintText: hintText,
          isLoading: isLoading,
          // items: items,
          items: remainingItems,
          value: value,
          getItemText: getItemText,
          onChanged: onChanged,
          prefixIcon: prefixIcon,
          prefixIconConstraints: prefixIconConstraints,
          validator: validator,
        ),
        AppGaps.hGap8,
        Wrap(
            spacing: 10,
            children: selectedItems
                .mapIndexed((index, selectedItem) => ActionChip(
                      padding: EdgeInsets.zero,
                      // labelPadding: EdgeInsets.zero,
                      label: Text(getItemText(selectedItem)),

                      labelStyle: AppTextStyles.bodySemiboldTextStyle
                          .copyWith(color: Colors.white),
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      onPressed: () =>
                          onItemDeleteButtonTap(index, selectedItem),
                    ))
                .toList()),
      ],
    );
  }

  List<T>? get remainingItems {
/*     return items
        ?.where((item) =>
            selectedItems.any((selectedItem) => !isEqual(item, selectedItem)))
        .toList(); */
    return items;
  }
}

class ToggleRowWidget extends StatelessWidget {
  final String label;
  final bool value;
  final void Function(bool) onToggle;
  const ToggleRowWidget({
    super.key,
    required this.label,
    required this.value,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: GestureDetector(
        onTap: () => onToggle(!value),
        child: Text(
          label,
          style: AppTextStyles.labelTextStyle,
        ),
      )),
      SwitchWidget(
        value: value,
        onToggle: onToggle,
      ),
    ]);
  }
}

class SwitchWidget extends StatelessWidget {
  final bool value;
  final void Function(bool) onToggle;
  const SwitchWidget({super.key, required this.value, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      value: value,
      width: 35,
      height: 20,
      toggleSize: 12,
      activeColor: AppColors.primaryColor,
      onToggle: onToggle,
    );
  }
}

class SingleImageUploadWidget extends StatelessWidget {
  final String imageURL;
  final void Function()? onImageUploadTap;
  const SingleImageUploadWidget(
      {super.key, required this.imageURL, this.onImageUploadTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(18))),
      child: Builder(
          builder: (context) => imageURL.isEmpty
              ? SelectImageButton(onTap: onImageUploadTap)
              : SelectedNetworkImageWidget(
                  imageURL: imageURL,
                  onEditButtonTap: onImageUploadTap,
                )),
    );
  }
}

class MultiImageUploadWidget extends StatelessWidget {
  final List<String> imageURLs;
  final void Function()? onImageUploadTap;
  final void Function(int)? onImageTap;
  final void Function(int)? onImageEditTap;
  final void Function(int)? onImageDeleteTap;
  const MultiImageUploadWidget(
      {super.key,
      required this.imageURLs,
      this.onImageUploadTap,
      this.onImageEditTap,
      this.onImageDeleteTap,
      this.onImageTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(18))),
      child: Builder(
          builder: (context) => imageURLs.isEmpty
              ? SelectImageButton(onTap: onImageUploadTap)
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == imageURLs.length) {
                      return SizedBox(
                          width: 180,
                          child: SelectImageButton(onTap: onImageUploadTap));
                    }
                    final imageURL = imageURLs[index];
                    return SizedBox(
                      width: 180,
                      child: SelectedNetworkImageWidget(
                        imageURL: imageURL,
                        onTap: onImageTap != null
                            ? () => onImageTap!(index)
                            : null,
                        onEditButtonTap: onImageEditTap != null
                            ? () => onImageEditTap!(index)
                            : null,
                        showDeleteButton: true,
                        onDeleteButtonTap: onImageDeleteTap != null
                            ? () => onImageDeleteTap!(index)
                            : null,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => AppGaps.wGap12,
                  itemCount: imageURLs.length + 1)),
    );
  }
}

class NoImageAvatarWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  const NoImageAvatarWidget({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: AppColors.primaryColor, shape: BoxShape.circle),
      child: Text(
        Helper.avatar2LetterUsername(firstName, lastName),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class TightTextIconButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Widget iconWidget;
  final void Function()? onTap;
  const TightTextIconButtonWidget(
      {super.key,
      required this.text,
      required this.iconWidget,
      this.onTap,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTightTextButtonWidget(
          onTap: onTap,
          child: Row(
            children: [
              AppGaps.wGap10,
              Text(
                text,
                style: textStyle,
              ),
              AppGaps.wGap10,
              iconWidget,
            ],
          ),
        )
      ],
    );
  }
}

/// Custom padded body widget for scaffold
class BottomModalBodyWidget extends StatelessWidget {
  final Widget child;
  const BottomModalBodyWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          Constants.screenPaddingValue,
          Constants.bottomSheetTopPaddingValue,
          Constants.screenPaddingValue,
          0),
      child: child,
    );
  }
}
