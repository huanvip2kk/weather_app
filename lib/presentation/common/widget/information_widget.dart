import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';

import '../../../config/app_text_style.dart';
import '../../../generated/l10n.dart';
import 'current_column_widget.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({
    Key? key,
    required this.cityName,
    required this.countryName,
    required this.humidity,
    required this.pressure,
    required this.temperature,
    required this.weatherState,
    required this.windSpeed,
    this.widget,
    this.iconButton,
    required this.isMetric,
  }) : super(key: key);

  final String cityName, countryName, weatherState;

  final double temperature, windSpeed, humidity, pressure;
  final Widget? widget, iconButton;
  final bool isMetric;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 42.h,
            child: Marquee(
              text: '$cityName - $countryName',
              style: AppTextStyle.fontSize40.copyWith(
                fontWeight: FontWeight.bold,
              ),
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 100.0,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('hh:mm a --- E,dd MM yyyy').format(
                  DateTime.now(),
                ),
                style: AppTextStyle.fontSize14.copyWith(),
              ),
              iconButton ?? const SizedBox(),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          widget ?? widget!,
          SizedBox(
            height: 10.h,
          ),
          Text(
            isMetric
                ? '${temperature.toStringAsFixed(2)}\u2103'
                : '${((temperature * 9 / 5) + 32).toStringAsFixed(2)}\u2109',
            style: AppTextStyle.fontSize40.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            weatherState,
            style: AppTextStyle.fontSize24.copyWith(),
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
                CurrentColumnWidget(
                  title: S.current.wind,
                  value: isMetric
                      ? windSpeed.toStringAsFixed(2)
                      : (windSpeed / 1.609344).toStringAsFixed(2),
                  unit: isMetric ? 'Km/h' : 'M/s',
                ),
                CurrentColumnWidget(
                    value: pressure.toStringAsFixed(2),
                    title: S.current.pressure,
                    unit: 'Pa'),
                CurrentColumnWidget(
                    value: humidity.toStringAsFixed(2),
                    title: S.current.humidity,
                    unit: '%')
              ],
            ),
          )
        ],
      ),
    );
  }
}
