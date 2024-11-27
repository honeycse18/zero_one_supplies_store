import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsListTileWidget extends StatelessWidget {
  final String titleText;
  final Widget? valueWidget;
  final void Function()? onTap;
  final bool showRightArrow;
  const SettingsListTileWidget({
    super.key,
    required this.titleText,
    this.valueWidget,
    this.onTap,
    this.showRightArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Text(
              titleText,
              style: const TextStyle(fontWeight: FontWeight.w600),
            )),
            valueWidget ?? AppGaps.emptyGap,
            showRightArrow ? AppGaps.wGap8 : AppGaps.emptyGap,
            showRightArrow
                ? Transform.scale(
                    scaleX: -1,
                    child: SvgPicture.asset(AppAssetImages.arrowLeftSVGLogoLine,
                        color: AppColors.primaryColor))
                : AppGaps.emptyGap,
          ],
        ));
  }
}

/// Settings text value widget for settings screen.
class SettingsValueTextWidget extends StatelessWidget {
  final String text;
  const SettingsValueTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: AppColors.bodyTextColor),
    );
  }
}
