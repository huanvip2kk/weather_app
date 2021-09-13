import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/favorites/favorites_model.dart';
import '../../../data/model/location/location_model.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/detail_bloc.dart';
import 'widgets/detail_failure_widget.dart';
import 'widgets/detail_loaded_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.detailArguments})
      : super(key: key);

  final DetailArguments detailArguments;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is DetailLoadingState) {
              return const Loading();
            } else if (state is DetailLoadedState) {
              return DetailLoadedWidget(
                state: state,
                context: context,
                detailArguments: widget.detailArguments,
              );
            } else if (state is DetailFailureState) {
              return DetailFailureWidget(
                state: state,
                locationModel: widget.detailArguments.locationModel!,
              );
            }
            return const Loading();
          },
        ),
      );
}

class DetailArguments {
  final String? docID;
  final LocationModel? locationModel;
  final FavoritesModel? favoritesModel;

  DetailArguments({
    this.locationModel,
    this.docID,
    this.favoritesModel,
  });
}
