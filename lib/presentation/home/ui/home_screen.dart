import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../generated/l10n.dart';
import '../../common/method/common_button.dart';
import '../../common/method/sized_box_10h.dart';
import '../../common/method/snack_bar.dart';
import '../../common/widget/current_column_widget.dart';
import '../../common/widget/header_curved_container.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final now = DateTime.now();

  List units = ['C', 'F'];

  String unit = 'C';

  List languages = ['English', 'Tiếng Việt'];

  String lang = 'English';

  bool isC = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: loading(),
              );
            } else if (state is HomeLoadedState) {
              if (state.weatherModel.main.temp < 45) {
                return homeWidget(
                  context: context,
                  state: state,
                  currentLocation:
                      '${state.weatherModel.name} - ${state.weatherModel.sys.country}',
                  currentTemp: state.weatherModel.main.temp,
                  icon: state.weatherModel.weather.elementAt(0).icon,
                  currentWeather: state.weatherModel.weather.elementAt(0).main,
                  currentDetailWeather:
                      state.weatherModel.weather.elementAt(0).description,
                  wind: state.weatherModel.wind.speed,
                  pressure: state.weatherModel.main.pressure,
                  humidity: state.weatherModel.main.humidity,
                  ut: 'metric',
                );
              } else {
                return homeWidget(
                  context: context,
                  state: state,
                  currentLocation:
                      '${state.weatherModel.name} - ${state.weatherModel.sys.country}',
                  currentTemp: state.weatherModel.main.temp,
                  icon: state.weatherModel.weather.elementAt(0).icon,
                  currentWeather: state.weatherModel.weather.elementAt(0).main,
                  currentDetailWeather:
                      state.weatherModel.weather.elementAt(0).description,
                  wind: state.weatherModel.wind.speed,
                  pressure: state.weatherModel.main.pressure,
                  humidity: state.weatherModel.main.humidity,
                  ut: 'imperial',
                );
              }
            } else if (state is HomeFailureState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.message),
                      sizedBox10h(),
                      commonElevatedButtonIcon(
                        icon: Icons.refresh,
                        buttonColor: AppColors.kPrimaryColor,
                        text: "Refresh",
                        onPressed: () {
                          context.read<HomeBloc>().add(
                                HomeLoadEvent(units: "metric"),
                              );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      );

  Stack homeWidget({
    required BuildContext context,
    required HomeLoadedState state,
    required String currentLocation,
    required double currentTemp,
    required String icon,
    required String currentWeather,
    required String currentDetailWeather,
    required double wind,
    required double pressure,
    required double humidity,
    required String ut,
  }) =>
      Stack(
        children: [
          CustomPaint(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 12.h,
            ),
            painter: HeaderCurvedContainer(
              customColor: AppColors.kPrimaryColor,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentLocation,
                    style: AppTextStyle.fontSize40.copyWith(
                      color: AppColors.kWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sizedBox10h(),
                  Text(
                    DateFormat('hh:mm a ---  E,dd MM yyyy').format(now),
                    style: AppTextStyle.fontSize14.copyWith(),
                  ),
                  const Spacer(),
                  isC
                      ? Text(
                          '$currentTemp\u2103',
                          style: AppTextStyle.fontSize40.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : Text(
                          '$currentTemp\u2109',
                          style: AppTextStyle.fontSize40.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  sizedBox10h(),
                  Row(
                    children: [
                      Image.network(
                          "http://openweathermap.org/img/w/$icon.png"),
                      Text(
                        currentWeather,
                        style: AppTextStyle.fontSize24.copyWith(),
                      ),
                    ],
                  ),
                  Text(
                    state.weatherModel.weather.elementAt(0).description,
                    style: AppTextStyle.fontSize14.copyWith(),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ListTile(
                    title: Text(
                      S.current.chooseUnits,
                      style: AppTextStyle.fontSize14.copyWith(),
                    ),
                    leading: const Icon(
                      Icons.ac_unit,
                    ),
                    trailing: DropdownButton(
                      items: units
                          .map((value) => DropdownMenuItem(
                                child: Text(
                                  value,
                                ),
                                value: value,
                              ))
                          .toList(),
                      value: unit,
                      onChanged: (value) async {
                        setState(() {
                          if (value == 'C') {
                            context.read<HomeBloc>().add(
                                  HomeLoadEvent(units: 'metric'),
                                );
                            snackBar(
                              context: context,
                              text: Text(
                                '${S.current.choosed}: C',
                              ),
                            );
                            isC = true;
                          } else {
                            context.read<HomeBloc>().add(
                                  HomeLoadEvent(units: 'imperial'),
                                );
                            snackBar(
                              context: context,
                              text: Text(
                                '${S.current.choosed}: F',
                              ),
                            );

                            isC = false;
                          }
                        });

                        unit = value.toString();
                      },
                    ),
                  ),
                  sizedBox10h(),
                  ListTile(
                    title: Text(
                      S.current.chooseYourLanguages,
                      style: AppTextStyle.fontSize14,
                    ),
                    leading: const Icon(Icons.language),
                    trailing: DropdownButton(
                      items: languages
                          .map(
                            (value) => DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            ),
                          )
                          .toList(),
                      value: lang,
                      onChanged: (value) async {
                        setState(() {
                          if (value == 'Tiếng Việt') {
                            S.load(
                              const Locale('vi', 'VN'),
                            );
                            context.read<HomeBloc>().add(
                                  HomeLoadEvent(units: ut, lang: 'vi'),
                                );
                            snackBar(
                              context: context,
                              text: Text(
                                '${S.current.choosed}: ${S.current.tiengViet}',
                              ),
                            );
                          } else {
                            S.load(
                              const Locale('en', 'US'),
                            );
                            context.read<HomeBloc>().add(
                                  HomeLoadEvent(units: ut, lang: 'en'),
                                );
                            snackBar(
                              context: context,
                              text: Text(
                                '${S.current.choosed}: ${S.current.english}',
                              ),
                            );
                          }
                        });

                        lang = value.toString();
                      },
                    ),
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
                        isC
                            ? currentColumnWidget(
                                title: S.current.wind,
                                value: wind.toString(),
                                unit: 'Km/h',
                              )
                            : currentColumnWidget(
                                title: S.current.wind,
                                value: wind.toString(),
                                unit: 'MPH',
                              ),
                        currentColumnWidget(
                          value: pressure.toString(),
                          title: S.current.pressure,
                          unit: 'Pa',
                        ),
                        currentColumnWidget(
                          value: humidity.toString(),
                          title: S.current.humidity,
                          unit: '%',
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
}
