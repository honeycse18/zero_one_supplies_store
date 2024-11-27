import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/constants/app_text_styles.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

class BrandListWidget extends StatelessWidget {
  final String image;
  final bool label;
  final String brandName;
  final bool value;
  final bool isAdded;
  final void Function(bool) onToggle;
  final void Function()? onEditTap;

  const BrandListWidget({
    super.key,
    required this.image,
    required this.brandName,
    this.onEditTap,
    required this.onToggle,
    required this.value,
    required this.label,
    required this.isAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 85,
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: Row(
            children: [
              SizedBox(
                height: 63,
                width: 63,
                child: CachedNetworkImageWidget(
                  imageURL: image,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  ),
                ),
              ),
              AppGaps.wGap19,
              Expanded(
                child: Text(
                  brandName,
                  style: AppTextStyles.bodyLargeTextStyle,
                ),
              ),
              if (isAdded)
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            LanguageHelper.currentLanguageText(
                                LanguageHelper.activeTransKey),
                            style: AppTextStyles.bodySmallMediumTextStyle),
                        AppGaps.wGap8,
                        SwitchWidget(onToggle: onToggle, value: value),
                      ],
                    ),
                    TextButton(
                        onPressed: onEditTap,
                        child: Text(
                          AppLanguageTranslation.editTransKey.toCurrentLanguage,
                          textAlign: TextAlign.end,
                          style: AppTextStyles.bodySmallMediumTextStyle
                              .copyWith(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.primaryColor),
                        )),
                  ],
                )
            ],
          ),
        )),
      ],
    );
  }
}
