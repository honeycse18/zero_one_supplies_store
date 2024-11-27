import 'package:ecomikstoreapp/models/fake_models/stock_color_model.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_text_styles.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

class StoreManagementWidget extends StatelessWidget {
  final String productImageUrl;
  final String productName;
  final int productCount;
  final double price;

  final List<StockColorModel> colorNames;

  const StoreManagementWidget({
    super.key,
    this.productImageUrl = '',
    this.productName = '',
    this.price = 0,
    this.productCount = 0,
    this.colorNames = const [],
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        hasShadow: true,
        paddingValue: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
                        style: AppTextStyles.bodySemiboldTextStyle,
                      ),
                      AppGaps.hGap8,
                      Text(
                        'price : ${Helper.getCurrencyFormattedAmountText(price)} ',
                        style: AppTextStyles.bodyMediumTextStyle
                            .copyWith(color: AppColors.shadeColor3),
                      ),
                      AppGaps.hGap8,
                      Text(
                        'Quantity : $productCount ',
                        style: AppTextStyles.bodyMediumTextStyle
                            .copyWith(color: AppColors.shadeColor3),
                      ),

                      /* Row(
                          children: [
                            ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: colorNames.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 74,
                                    margin: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(4))),
                                    child: Text(colorNames[index]),
                                  );
                                })
                          ],
                        ) */
                    ],
                  ),
                ),
              ],
            ),
            AppGaps.hGap16,
            if (colorNames.isNotEmpty)
              SizedBox(
                height: 34,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: colorNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      final colorName = colorNames[index];
                      return CustomTightTextButtonWidget(
                        child: Container(
                          width: 74,
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              // color: AppColors.primaryColor,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: const Alignment(0.8, 1),
                                colors: <Color>[
                                  AppColors.primaryColor,
                                  AppColors.primaryColor.withOpacity(0.5)
                                ],
                                tileMode: TileMode.mirror,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          child: Text(
                            '${colorName.colorName} (${colorName.availableItem})',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyLargeMediumTextStyle
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        onTap: () {},
                      );
                    }),
              )
          ],
        ));
  }
}
