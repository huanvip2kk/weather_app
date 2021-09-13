import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/get_weather_api/get_weather_api.dart';
import '../../data/reposistory/api_repo_impl.dart';
import 'bloc/favorites_list_bloc.dart';
import 'ui/favorites_list_screen.dart';

class FavoritesListScreenRoute {
  static Widget get route => BlocProvider(
        create: (context) => FavoritesListBloc(
          apiRepoImpl: ApiRepoImpl(
            getWeatherApi: GetWeatherApi(
              Dio(),
            ),
          ),
        )..add(
            FavoritesListLoadEvent(),
          ),
        child: const FavoritesListScreen(),
      );
}
