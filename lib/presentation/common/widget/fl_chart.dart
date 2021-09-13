import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../data/model/detail/detail_model.dart';

class FLChart extends StatefulWidget {
  const FLChart({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<ConsolidatedWeather> list;

  @override
  _FLChartState createState() => _FLChartState();
}

class _FLChartState extends State<FLChart> {
  List<Color> gradientColors = [
    AppColors.primaryColor,
    AppColors.recoveredColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18.r),
              ),
              color: AppColors.black54,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
        //
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: flGridData(),
      titlesData: flTitlesData(),
      borderData: flBorderData(),
      maxY: (widget.list.first.maxTemp * 1.2).roundToDouble(),
      minY: (widget.list.first.minTemp / 2).roundToDouble(),
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            widget.list.length,
            (index) => FlSpot(
              index.toDouble(),
              widget.list.elementAt(index).theTemp.roundToDouble(),
            ),
          ),
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors
                .map(
                  (color) => color.withOpacity(0.3),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  FlGridData flGridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: AppColors.primaryColor,
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: AppColors.recoveredColor,
          strokeWidth: 1,
        );
      },
    );
  }

  // TODO Border
  FlBorderData flBorderData() {
    return FlBorderData(
      show: true,
      border: Border.all(
        color: AppColors.black,
        width: 1.w,
      ),
    );
  }

  FlTitlesData flTitlesData() {
    return FlTitlesData(
      show: true,
      rightTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        // TODO x
        interval: 1,
        getTextStyles: (context, value) => AppTextStyle.fontSize14.copyWith(
          color: AppColors.white,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return applicableDate(
                index: 0,
              );

            case 1:
              return applicableDate(
                index: 1,
              );

            case 2:
              return applicableDate(
                index: 2,
              );

            case 3:
              return applicableDate(
                index: 3,
              );

            case 4:
              return applicableDate(
                index: 4,
              );
          }
          return applicableDate(
            index: 5,
          );
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        //TODO y
        interval: 2,
        getTextStyles: (context, value) => AppTextStyle.fontSize14.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }

  String applicableDate({required int index}) =>
      widget.list.elementAt(index).applicableDate.substring(6);
}
