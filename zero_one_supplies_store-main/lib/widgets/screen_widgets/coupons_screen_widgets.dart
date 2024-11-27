import 'package:ecomikstoreapp/models/enums.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_text_styles.dart';
import 'package:ecomikstoreapp/utils/extensions/datetime.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

class CouponListTileWidget extends StatelessWidget {
  const CouponListTileWidget({
    super.key,
    required this.name,
    required this.value,
    required this.type,
    required this.endDate,
    required this.status,
    this.isActive = false,
    this.code = '',
    this.onTap,
    this.onDeleteTap,
  });

  final String name;
  final double value;
  final DiscountType type;
  final DateTime endDate;
  final String code;
  final String status;
  final bool isActive;
  final void Function()? onTap;
  final void Function()? onDeleteTap;

  String get valueText {
    switch (type) {
      case DiscountType.percentage:
        return '${value.toInt()}% discount';
      case DiscountType.flat:
        return '${Helper.getCurrencyFormattedAmountText(value)} discount';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        onTap: onTap,
        hasShadow: true,
        paddingValue: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActiveInactiveChipWidget(isActive: isActive),
            AppGaps.wGap10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodySemiboldTextStyle,
                      ),
                    ],
                  ),
                  if (code.isNotEmpty) AppGaps.hGap5,
                  if (code.isNotEmpty)
                    Text(
                      'Code: $code',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodySmallTextStyle,
                    ),
                  AppGaps.hGap8,
                  Text(
                    valueText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySemiboldTextStyle,
                  ),
                  AppGaps.hGap8,
                  Text(
                    'End in: ${endDate.formatted('dd MMM, yyyy')}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyTextStyle,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TightIconButtonWidget(
                  onTap: onDeleteTap,
                  icon: const Icon(Icons.delete_outline,
                      color: AppColors.alertColor),
                )
              ],
            )
          ],
        ));
  }
}

class ActiveInactiveChipWidget extends StatelessWidget {
  final bool isActive;
  const ActiveInactiveChipWidget({
    super.key,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 62,
      child: Chip(
          label: Text(isActive ? 'Active' : 'Inactive'),
          padding: EdgeInsets.zero,
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          labelStyle: AppTextStyles.bodyTextStyle.copyWith(color: Colors.white),
          backgroundColor:
              isActive ? AppColors.pendingColor : AppColors.alertColor),
    );
  }
}
