import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/news_management_bloc.dart';
import 'ui/news_management_screen.dart';

class NewsManagementScreenRoute {
  static Widget get route => BlocProvider(
        create: (context) => NewsManagementBloc()
          ..add(
            NewsManagementLoadEvent(),
          ),
        child: const NewsManagementScreen(),
      );
}
