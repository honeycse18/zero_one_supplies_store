import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Line graph widget for insight screen.
class InsightLineGraphWidget extends StatefulWidget {
  final List<FlSpot> spots;
  final Widget Function(double, TitleMeta) bottomTitleWidgets;
  final Widget Function(double, TitleMeta) leftTitleWidgets;
  const InsightLineGraphWidget(
      {super.key,
      required this.spots,
      required this.bottomTitleWidgets,
      required this.leftTitleWidgets});

  @override
  InsightLineGraphWidgetState createState() => InsightLineGraphWidgetState();
}

class InsightLineGraphWidgetState extends State<InsightLineGraphWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: AspectRatio(
        aspectRatio: 1.70,
        child: LineChart(LineChartData(
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: false,
            // drawVerticalLine: true,
            horizontalInterval: 50,
            verticalInterval: 20,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                  color: AppColors.lineShapeColor,
                  strokeWidth: 1,
                  dashArray: [4, 4]);
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: widget.bottomTitleWidgets,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: widget.leftTitleWidgets,
                reservedSize: 42,
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          // maxX: 220,
          minY: 0,
          // maxY: 200,
          lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              return touchedSpots
                  .map((touchSpot) => LineTooltipItem(
                      touchSpot.y.toString(),
                      Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white) ??
                          const TextStyle(color: Colors.white)))
                  .toList();
            },
            tooltipBgColor: AppColors.primaryColor,
          )),
          lineBarsData: [
            LineChartBarData(
              spots: widget.spots,
              isCurved: true,
              color: AppColors.primaryColor,
              barWidth: 2.5,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryColor.withOpacity(0.15),
                    AppColors.primaryColor.withOpacity(0)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
