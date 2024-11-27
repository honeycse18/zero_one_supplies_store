import 'package:ecomikstoreapp/controller/home_screen-controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/home_screen_widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Graph label text style
    final graphLabelTextStyle = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(color: AppColors.bodyTextColor);
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Appbar --------> */
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context,
                    hasBackButton: false,
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.homeTransKey))),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: CustomScrollView(
                    slivers: [
                      /* <---- Top extra spaces ----> */
                      const SliverToBoxAdapter(child: AppGaps.hGap15),
                      /* <---- Product categories grid list ----> */
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              LanguageHelper.currentLanguageText(
                                  LanguageHelper.analyticsOverviewTransKey),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                      const SliverToBoxAdapter(child: AppGaps.hGap16),
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: AppGaps.screenPaddingValue,
                                mainAxisSpacing: AppGaps.screenPaddingValue,
                                mainAxisExtent: 185,
                                crossAxisCount: 2,
                                childAspectRatio: 1),
                        delegate: SliverChildListDelegate([
                          CustomGridSingleItemWidget(
                            child: HomeSingleStatisticsWidget(
                              iconColor: AppColors.primaryColor,
                              localSVGAssetFileName:
                                  AppAssetImages.walletSVGLogoSolid,
                              valueText: Helper.getCurrencyFormattedAmountText(
                                  controller.homepage.earningSell.totalEarning),
                              subtitleText: LanguageHelper.currentLanguageText(
                                  LanguageHelper.totalSalesTransKey),
                            ),
                          ),
                          CustomGridSingleItemWidget(
                            child: HomeSingleStatisticsWidget(
                              iconColor: AppColors.tertiaryColor,
                              localSVGAssetFileName:
                                  AppAssetImages.groupSVGLogoSolid,
                              valueText:
                                  '${controller.homepage.earningSell.totalProductSell}',
                              subtitleText: LanguageHelper.currentLanguageText(
                                  LanguageHelper.totalCustomersTransKey),
                            ),
                          ),
                          CustomGridSingleItemWidget(
                            child: HomeSingleStatisticsWidget(
                              iconColor: AppColors.secondaryColor,
                              localSVGAssetFileName:
                                  AppAssetImages.boxNoBorderSVGLogoSolid,
                              valueText:
                                  '${controller.homepage.totalProducts.totalProducts}',
                              subtitleText: LanguageHelper.currentLanguageText(
                                  LanguageHelper.totalProductsTransKey),
                            ),
                          ),
                        ]),
                      ),
                      const SliverToBoxAdapter(child: AppGaps.hGap32),
                      /* <---- 'Earnings' text and date dropdown menu row ----> */
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              LanguageHelper.currentLanguageText(
                                  LanguageHelper.earningsTransKey),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            /* <---- Date wise dropdown menu ----> */
/*                             PopupMenuButton<int>(
                                padding: const EdgeInsets.only(right: 1),
                                position: PopupMenuPosition.under,
                                // icon: const Icon(Icons.more_vert_rounded, color: AppColors.darkColor),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Today',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primaryColor),
                                    ),
                                    AppGaps.wGap2,
                                    SvgPicture.asset(
                                        AppAssetImages.arrowDown2SVGLogoSolid,
                                        height: 12,
                                        width: 12,
                                        color: AppColors.primaryColor),
                                  ],
                                ),
                                itemBuilder: (context) => [
                                      const PopupMenuItem<int>(
                                        value: 0,
                                        // padding: EdgeInsets.symmetric(horizontal: 15),
                                        child: Text(
                                          'Yesterday',
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ]), */
                          ],
                        ),
                      ),
                      /* <---- Vertical bar graph ----> */
                      SliverToBoxAdapter(
                        child: HomeBarChartGraphWidget(
                            barChartDataList: (controller
                                            .earningGraphData.length >
                                        10
                                    ? controller.earningGraphData.sublist(0, 10)
                                    : controller.earningGraphData)
                                .map((data) => HomeScreenWidgets.makeGroupData(
                                    data.createdAt.millisecondsSinceEpoch,
                                    data.amount))
                                .toList(),
                            leftTitleWidgets: (double value, TitleMeta meta) {
                              // String text;
                              if (value % 500 == 0) {
                                return Text('${value.toInt()}',
                                    style: graphLabelTextStyle,
                                    textAlign: TextAlign.left);
                              }
                              return AppGaps.emptyGap;
                            },
                            bottomTitleWidgets: (double value, TitleMeta meta) {
                              final dateTime =
                                  DateTime.fromMillisecondsSinceEpoch(
                                      value.toInt());
                              return SideTitleWidget(
                                axisSide: meta.axisSide,
                                space: 8.0,
                                child: Text(
                                  DateFormat('MMM').format(dateTime),
                                  style: graphLabelTextStyle,
                                ),
                              );
                            },
                            toolTips: (group, groupIndex, rod, rodIndex) {
                              return BarTooltipItem(
                                Helper.getCurrencyFormattedAmountText(rod.toY),
                                const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                ),
                              );
                            }),
                      ),

                      /* <---- Bottom extra spaces ----> */
                      const SliverToBoxAdapter(child: AppGaps.hGap30),
                    ],
                  ),
                ),
              ),
            ));
  }
}
