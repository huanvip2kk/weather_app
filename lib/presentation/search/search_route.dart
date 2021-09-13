import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/get_location_api/get_location_api.dart';
import '../../data/reposistory/api_repo_impl.dart';
import 'bloc/search_bloc.dart';
import 'ui/search_screen.dart';

class SearchScreenRoute {
  static Widget get route => BlocProvider(
        create: (context) => SearchBloc(
          apiRepoImpl: ApiRepoImpl(
            getLocationApi: GetLocationApi(
              Dio(),
            ),
          ),
        )..add(
            SearchLoadEvent(),
          ),
    child: SearchScreen(),
      );
}
