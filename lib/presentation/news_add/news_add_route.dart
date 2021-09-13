import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/news_add_bloc.dart';
import 'ui/news_add_screen.dart';


class NewsAddScreenRoute {
  static Widget get route => BlocProvider(
    create: (context) => NewsAddBloc(
    )..add(
      NewsAddLoadEvent(),
    ),
    child: const NewsAddScreen(),
  );
}