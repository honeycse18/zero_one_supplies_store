import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_text_styles.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

class ProductListTileWithOutOfStock extends StatelessWidget {
  const ProductListTileWithOutOfStock(
      {super.key,
      required this.isOutOfStock,
      required this.productImageUrl,
      required this.productName,
      required this.productItemNumber,
      this.outOfStockGestureOnTap,
      required this.outOfStockToggleOnTap,
      this.onTap,
      this.onTrashTap,
      this.price = 0,
      this.isDraft = false});

  final bool isOutOfStock;
  final String productImageUrl;
  final String productName;
  final int productItemNumber;
  final double price;
  final bool isDraft;
  final void Function()? onTap;
  final void Function()? outOfStockGestureOnTap;
  final void Function(bool) outOfStockToggleOnTap;
  final void Function()? onTrashTap;

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        onTap: onTap,
        hasShadow: true,
        darkerShadow: isOutOfStock,
        paddingValue: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
              width: 90,
              child: CachedNetworkImageWidget(
                imageURL: productImageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ), /* Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: productImageUrl, fit: BoxFit.cover)),
              ) */
            ),
            AppGaps.wGap16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productName,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      if (isDraft)
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.alertColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Draft',
                            style: TextStyle(
                                color: AppColors.alertColor, fontSize: 12),
                          ),
                        )
                    ],
                  ),
                  AppGaps.hGap8,
                  Text(
                    Helper.getCurrencyFormattedAmountText(price),
                    // '$productItemNumber items',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
/*                   AppGaps.hGap8,
                  GestureDetector(
                    onTap: outOfStockGestureOnTap,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Out of stock',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: AppColors.bodyTextColor,
                                  fontWeight: FontWeight.w500),
                        ),
                        AppGaps.wGap8,
                        /* <---- Remember me toggle button ----> */
                        FlutterSwitch(
                          value: isOutOfStock,
                          width: 35,
                          height: 20,
                          toggleSize: 12,
                          activeColor: AppColors.primaryColor,
                          onToggle: outOfStockToggleOnTap,
                        ),
                      ],
                    ),
                  ), */
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppGaps.hGap5,
                TightTextIconButtonWidget(
                    onTap: onTrashTap,
                    text: 'Trash',
                    iconWidget: const Icon(Icons.delete_outline,
                        color: AppColors.alertColor),
                    textStyle: AppTextStyles.bodyTextStyle
                        .copyWith(color: AppColors.alertColor))
              ],
            )
          ],
        ));
  }
}

class ProductListTileForAuction extends StatelessWidget {
  const ProductListTileForAuction({
    super.key,
    required this.productImageUrl,
    required this.productName,
    this.onTap,
    this.price = 0,
    required this.isSelected,
    this.backgroundColor = Colors.white,
  });

  final String productImageUrl;
  final String productName;
  final double price;
  final bool isSelected;
  final Color backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        onTap: onTap,
        hasShadow: true,
        // darkerShadow: isOutOfStock,
        backgroundColor: backgroundColor,
        paddingValue: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
              width: 90,
              child: CachedNetworkImageWidget(
                imageURL: productImageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ), /* Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: productImageUrl, fit: BoxFit.cover)),
              ) */
            ),
            AppGaps.wGap16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  AppGaps.hGap8,
                  Text(
                    Helper.getCurrencyFormattedAmountText(price),
                    // '$productItemNumber items',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class SingleImageUploadSectionWidget extends StatelessWidget {
  final String label;
  final String imageURL;
  final void Function()? onImageUploadTap;
  const SingleImageUploadSectionWidget({
    super.key,
    required this.label,
    required this.imageURL,
    this.onImageUploadTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelTextStyle,
          textAlign: TextAlign.center,
        ),
        AppGaps.hGap16,
        SingleImageUploadWidget(
            imageURL: imageURL, onImageUploadTap: onImageUploadTap),
      ],
    );
  }
}

class MultiImageUploadSectionWidget extends StatelessWidget {
  final String label;
  final List<String> imageURLs;
  final void Function()? onImageUploadTap;
  final void Function(int)? onImageTap;
  final void Function(int)? onImageEditTap;
  final void Function(int)? onImageDeleteTap;
  const MultiImageUploadSectionWidget({
    super.key,
    required this.label,
    required this.imageURLs,
    this.onImageUploadTap,
    this.onImageEditTap,
    this.onImageDeleteTap,
    this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelTextStyle,
        ),
        AppGaps.hGap16,
        MultiImageUploadWidget(
          imageURLs: imageURLs,
          onImageTap: onImageTap,
          onImageUploadTap: onImageUploadTap,
          onImageEditTap: onImageEditTap,
          onImageDeleteTap: onImageDeleteTap,
        ),
      ],
    );
  }
}

class TrashProductListTileWidget extends StatelessWidget {
  const TrashProductListTileWidget({
    super.key,
    required this.productImageUrl,
    required this.productName,
    this.onTap,
    this.price = 0,
    this.onRecoverTap,
    this.onDeleteTap,
  });

  final String productImageUrl;
  final String productName;
  final double price;
  final void Function()? onTap;
  final void Function()? onRecoverTap;
  final void Function()? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        onTap: onTap,
        hasShadow: true,
        paddingValue: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
              width: 90,
              child: CachedNetworkImageWidget(
                imageURL: productImageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
            ),
            AppGaps.wGap16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productName,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  AppGaps.hGap8,
                  Text(
                    Helper.getCurrencyFormattedAmountText(price),
                    // '$productItemNumber items',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
/*                   AppGaps.hGap8,
                  GestureDetector(
                    onTap: outOfStockGestureOnTap,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Out of stock',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: AppColors.bodyTextColor,
                                  fontWeight: FontWeight.w500),
                        ),
                        AppGaps.wGap8,
                        /* <---- Remember me toggle button ----> */
                        FlutterSwitch(
                          value: isOutOfStock,
                          width: 35,
                          height: 20,
                          toggleSize: 12,
                          activeColor: AppColors.primaryColor,
                          onToggle: outOfStockToggleOnTap,
                        ),
                      ],
                    ),
                  ), */
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TightTextIconButtonWidget(
                    onTap: onRecoverTap,
                    text: 'Recover',
                    iconWidget: const Icon(Icons.replay,
                        color: AppColors.tertiaryColor),
                    textStyle: AppTextStyles.bodyTextStyle
                        .copyWith(color: AppColors.tertiaryColor)),
                AppGaps.hGap5,
                TightTextIconButtonWidget(
                    onTap: onDeleteTap,
                    text: 'Delete',
                    iconWidget: const Icon(Icons.delete_forever,
                        color: AppColors.alertColor),
                    textStyle: AppTextStyles.bodyTextStyle
                        .copyWith(color: AppColors.alertColor))
              ],
            )
          ],
        ));
  }
}
