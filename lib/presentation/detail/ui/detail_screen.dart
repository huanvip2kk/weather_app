import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/location/location_model.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/detail_bloc.dart';
import 'widgets/detail_failure_widget.dart';
import 'widgets/detail_loaded_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.locationModel}) : super(key: key);

  final LocationModel locationModel;

  @override
  Widget build(BuildContext context) => BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is DetailLoadingState) {
            return Center(
              child: loading(),
            );
          } else if (state is DetailLoadedState) {
            return DetailLoadedWidget(
              state: state,
              context: context,
            );
          } else if (state is DetailFailureState) {
            return detailFailureWidget(
              state,
              context,
              locationModel,
            );
          }
          return loading();
        },
      );
}
