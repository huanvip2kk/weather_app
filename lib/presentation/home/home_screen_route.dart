import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/get_weather_api/get_weather_api.dart';
import '../../data/reposistory/api_repo_impl.dart';
import 'bloc/home_bloc.dart';
import 'ui/home_screen.dart';

class HomeScreenRoute {
  static Widget get route => BlocProvider(
        create: (context) => HomeBloc(
          apiRepoImpl: ApiRepoImpl(
            getWeatherApi: GetWeatherApi(
              Dio(),
            ),
          ),
        )..add(
            HomeLoadEvent(),
          ),
        child: const HomeScreen(),
      );
}
