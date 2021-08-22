import 'package:dio/dio.dart';

// ignore: implementation_imports
import 'package:flutter_bloc/src/bloc_provider.dart';
import '../../../data/api/get_location_api/get_location_api.dart';
import '../../../data/api/get_weather_api/get_weather_api.dart';
import '../../../data/reposistory/api_repo_impl.dart';
import '../../account/bloc/account_bloc.dart';
import '../../home/bloc/home_bloc.dart';
import '../../login_signup/bloc/index_bloc.dart';
import '../../login_signup/login_with_email/login_bloc/login_bloc.dart';
import '../../login_signup/signup_with_email/signup_bloc/signup_bloc.dart';
import '../../search/bloc/search_bloc.dart';

List<BlocProviderSingleChildWidget> listBlocProviders() => [
      BlocProvider(
        create: (context) => IndexBloc(),
      ),
      BlocProvider(
        create: (context) => AccountBloc()
          ..add(
            AccountLoadEvent(),
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
        create: (context) => HomeBloc(
          apiRepoImpl: ApiRepoImpl(
            getWeatherApi: GetWeatherApi(
              Dio(),
            ),
          ),
        )..add(
            HomeLoadEvent(units: 'metric', lang: 'vi'),
          ),
      ),
      BlocProvider(
        create: (context) => SignupBloc(),
      ),
      BlocProvider(
        create: (context) => LoginBloc(),
      ),
    ];
