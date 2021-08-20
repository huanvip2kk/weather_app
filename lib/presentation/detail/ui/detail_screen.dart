import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../data/api/get_detail_api/get_detail_api.dart';
import '../../../data/model/location/location_model.dart';
import '../../../data/reposistory/api_repo_impl.dart';
import '../../../generated/l10n.dart';
import '../../common/method/back_icon_button.dart';
import '../../common/method/common_button.dart';
import '../../common/method/sized_box_10h.dart';
import '../../common/widget/loading_widget.dart';
import '../../common/widget/sync_function_chart.dart';
import '../../home/ui/home_screen.dart';
import '../bloc/detail_bloc.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.locationModel}) : super(key: key);

  final LocationModel locationModel;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => DetailBloc(
          apiRepoImpl: ApiRepoImpl(
            getDetailApi: GetDetailApi(
              Dio(),
            ),
          ),
        )..add(
            DetailLoadEvent(
              woeid: locationModel.woeid.toString(),
            ),
          ),
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is DetailLoadingState) {
              return Center(
                child: loading(),
              );
            } else if (state is DetailLoadedState) {
              return detailLoadedWidget(state, context);
            } else if (state is DetailFailureState) {
              return detailFailureWidget(state, context);
            }
            return loading();
          },
        ),
      );

  Center detailFailureWidget(DetailFailureState state, BuildContext context) =>
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.message),
              sizedBox10h(),
              commonElevatedButton(
                buttonColor: AppColors.kPrimaryColor,
                text: S.current.reload,
                onPressed: () {
                  context.read<DetailBloc>().add(
                        DetailLoadEvent(
                          woeid: locationModel.woeid.toString(),
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      );

  Scaffold detailLoadedWidget(DetailLoadedState state, context) => Scaffold(
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
                '${state.detailModel.title} - ${state.detailModel.parent.title}',
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
                list: state.detailModel.consolidated_weather,
              ),
              Text(
                '${state.detailModel.consolidated_weather.elementAt(0).the_temp.toStringAsFixed(2)}\u2103',
                style: AppTextStyle.fontSize40.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBox10h(),
              Text(
                state.detailModel.consolidated_weather
                    .elementAt(0)
                    .weather_state_name,
                style: AppTextStyle.fontSize24.copyWith(),
              ),
              Text(
                '${state.detailModel.consolidated_weather.elementAt(0).min_temp.toStringAsFixed(2).toString()}\u2103 - ${state.detailModel.consolidated_weather.elementAt(0).max_temp.toStringAsFixed(2).toString()}\u2103',
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
                    CurrentColumnWidget(
                      title: S.current.wind,
                      value: state.detailModel.consolidated_weather
                          .elementAt(0)
                          .wind_speed
                          .toStringAsFixed(
                        2,
                      )
                          .toString(),
                      unit: 'Km/h',
                    ),
                    CurrentColumnWidget(
                        value: state.detailModel.consolidated_weather
                            .elementAt(0)
                            .air_pressure
                            .toString(),
                        title: S.current.pressure,
                        unit: 'Pa'),
                    CurrentColumnWidget(
                        value: state.detailModel.consolidated_weather
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
