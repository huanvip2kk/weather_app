import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../data/model/detail/detail_model.dart';
import '../../../generated/l10n.dart';

class SyncFunctionChart extends StatelessWidget {
  SyncFunctionChart({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<ConsolidatedWeather> list;

  final TooltipBehavior _tooltipBehavior = TooltipBehavior(
    enable: true,
    format: 'point.x - point.y',
  );

  final Legend _legend = Legend(
    isVisible: true,
    isResponsive: true,
    position: LegendPosition.bottom,
  );

  @override
  Widget build(BuildContext context) => SfCartesianChart(
        title: ChartTitle(
          text: S.current.weatherAnalysis,
          textStyle: AppTextStyle.fontSize14.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        plotAreaBorderWidth: 5.w,
        plotAreaBorderColor: AppColors.kPrimaryColor,
        tooltipBehavior: _tooltipBehavior,
        legend: _legend,
        series: <LineSeries<ConsolidatedWeather, String>>[
          LineSeries<ConsolidatedWeather, String>(
            // Bind data source
            dataSource: list,
            xValueMapper: (detail, _) => detail.applicable_date.substring(6),
            yValueMapper: (detail, _) => detail.the_temp,
            name: S.current.temp,
          )
        ],

        primaryXAxis: CategoryAxis(
          title: AxisTitle(
            text: S.current.date,
            textStyle: AppTextStyle.fontSize14.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        primaryYAxis: NumericAxis(
          labelFormat: '{value}°C',
          title: AxisTitle(
              text: S.current.temp,
              textStyle: AppTextStyle.fontSize14.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              )),
        ),
      );
}
