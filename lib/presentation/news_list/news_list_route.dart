import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/news_list_bloc.dart';
import 'ui/news_list_screen.dart';

class NewsListScreenRoute {
  static Widget get route => BlocProvider(
        create: (context) => NewsListBloc()
          ..add(
            NewsListLoadEvent(),
          ),
        child: NewsListScreen(),
      );
}
