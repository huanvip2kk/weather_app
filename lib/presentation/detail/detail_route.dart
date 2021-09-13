import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/api/get_detail_api/get_detail_api.dart';
import '../../data/reposistory/api_repo_impl.dart';

import 'bloc/detail_bloc.dart';
import 'ui/detail_screen.dart';

class DetailScreenRoute {
  static Widget route(DetailArguments detailArguments) => BlocProvider(
        create: (context) => DetailBloc(
          apiRepoImpl: ApiRepoImpl(
            getDetailApi: GetDetailApi(
              Dio(),
            ),
          ),
        )..add(
            DetailLoadEvent(
              woeid: detailArguments.locationModel?.woeid ??
                  detailArguments.favoritesModel!.woeid,
            ),
          ),
        child: DetailScreen(
          detailArguments: detailArguments,
        ),
      );
}
