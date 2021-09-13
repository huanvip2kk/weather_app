import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/news/news_model.dart';

import 'bloc/news_update_bloc.dart';
import 'ui/news_update_screen.dart';

class NewsUpdateScreenRoute {
  static Widget route({required NewsModel newsModel}) => BlocProvider(
        create: (context) => NewsUpdateBloc()
          ..add(
            NewsUpdateLoadEvent(),
          ),
        child: NewsUpdateScreen(
          newsModel: newsModel,
        ),
      );
}
