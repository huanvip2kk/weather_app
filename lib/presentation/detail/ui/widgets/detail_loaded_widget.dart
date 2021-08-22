import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/app_text_style.dart';
import '../../../../generated/l10n.dart';
import '../../../common/method/back_icon_button.dart';
import '../../../common/method/sized_box_10h.dart';
import '../../../common/widget/current_column_widget.dart';
import '../../../common/widget/sync_function_chart.dart';
import '../../bloc/detail_bloc.dart';

class DetailLoadedWidget extends StatefulWidget {
  const DetailLoadedWidget({
    Key? key,
    required this.state,
    required this.context,
  }) : super(key: key);
  final BuildContext context;
  final DetailLoadedState state;

  @override
  _DetailLoadedWidgetState createState() => _DetailLoadedWidgetState();
}

class _DetailLoadedWidgetState extends State<DetailLoadedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: backIconButton(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.state.detailModel.title} - ${widget.state.detailModel.parent.title}',
                style: AppTextStyle.fontSize40.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizedBox10h(),
              Text(
                DateFormat('hh:mm a ---  E,dd MM yyyy').format(
                  DateTime.now(),
                ),
                style: AppTextStyle.fontSize14.copyWith(),
              ),
              sizedBox10h(),
              SyncFunctionChart(
                list: widget.state.detailModel.consolidated_weather,
              ),
              Text(
                '${widget.state.detailModel.consolidated_weather.elementAt(0).the_temp.toStringAsFixed(2)}\u2103',
                style: AppTextStyle.fontSize40.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBox10h(),
              Text(
                widget.state.detailModel.consolidated_weather
                    .elementAt(0)
                    .weather_state_name,
                style: AppTextStyle.fontSize24.copyWith(),
              ),
              Text(
                '${widget.state.detailModel.consolidated_weather.elementAt(0).min_temp.toStringAsFixed(2).toString()}\u2103 - ${widget.state.detailModel.consolidated_weather.elementAt(0).max_temp.toStringAsFixed(2).toString()}\u2103',
                style: AppTextStyle.fontSize14.copyWith(),
              ),
              SizedBox(
                height: 30.h,
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    currentColumnWidget(
                      title: S.current.wind,
                      value: widget.state.detailModel.consolidated_weather
                          .elementAt(0)
                          .wind_speed
                          .toStringAsFixed(
                            2,
                          )
                          .toString(),
                      unit: 'Km/h',
                    ),
                    currentColumnWidget(
                        value: widget.state.detailModel.consolidated_weather
                            .elementAt(0)
                            .air_pressure
                            .toString(),
                        title: S.current.pressure,
                        unit: 'Pa'),
                    currentColumnWidget(
                        value: widget.state.detailModel.consolidated_weather
                            .elementAt(0)
                            .humidity
                            .toString(),
                        title: S.current.humidity,
                        unit: '%')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
