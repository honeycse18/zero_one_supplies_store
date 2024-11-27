import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// Review star progress bar with text inside review screen.
class ReviewStarTextProgressBar extends StatelessWidget {
  final double starCount;
  final double starProgressValue;
  const ReviewStarTextProgressBar({
    super.key,
    required this.starCount,
    required this.starProgressValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('$starCount star',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.bodyTextColor)),
        AppGaps.wGap8,
        LinearPercentIndicator(
          barRadius: const Radius.circular(4),
          width: 80,
          lineHeight: 8,
          percent: starProgressValue,
          backgroundColor: AppColors.darkColor.withOpacity(0.05),
          progressColor: AppColors.secondaryColor,
        ),
      ],
    );
  }
}
