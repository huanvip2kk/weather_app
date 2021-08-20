import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/api/get_location_api/get_location_api.dart';
import '../../../data/api/get_weather_api/get_weather_api.dart';
import '../../../data/reposistory/api_repo_impl.dart';
import '../../account/bloc/account_bloc.dart';
import '../../home/bloc/home_bloc.dart';
import '../../main/ui/main_bottom_navigation_bar.dart';
import '../../search/bloc/search_bloc.dart';

MultiBlocProvider mainMultiBlocProvider() => MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => HomeBloc(
        apiRepoImpl: ApiRepoImpl(
          getWeatherApi: GetWeatherApi(
            Dio(),
          ),
        ),
      )..add(
        HomeLoadEvent(units: 'metric'),
      ),
    ),
    BlocProvider(
      create: (context) => SearchBloc(
        apiRepoImpl: ApiRepoImpl(
          getLocationApi: GetLocationApi(
            Dio(),
          ),
        ),
      )..add(
        SearchLoadEvent(),
      ),
    ),
    BlocProvider(
      create: (context) => AccountBloc()
        ..add(
          AccountLoadEvent(),
        ),
    ),
  ],
  child: const MainScreen(),
);
