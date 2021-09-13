import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widget/loading_widget.dart';
import '../bloc/home_bloc.dart';
import 'widgets/home_failure_widget.dart';
import 'widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Loading();
            } else if (state is HomeLoadedState) {
              return HomeWidget(
                homeLoadedState: state,
              );
            } else if (state is HomeFailureState) {
              return HomeFailureWidget(
                homeFailureState: state,
              );
            }
            return const Loading();
          },
        ),
      );
}
