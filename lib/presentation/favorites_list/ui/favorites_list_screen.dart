import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../data/model/favorites/favorites_model.dart';
import '../../../generated/l10n.dart';
import '../../common/widget/back_app_bar_icon_button.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/favorites_list_bloc.dart';
import 'widget/favorites_list_widget.dart';

class FavoritesListScreen extends StatelessWidget {
  const FavoritesListScreen({Key? key, this.list}) : super(key: key);

  final List<FavoritesModel>? list;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackAppBarIconButton(),
        title: Text(
          S.current.favoritesList,
          style: AppTextStyle.fontSize20.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: BlocBuilder<FavoritesListBloc, FavoritesListState>(
        builder: (context, state) {
          if (state is FavoritesListLoadingState) {
            return const Loading();
          } else if (state is FavoritesListLoadedState) {
            return FavoritesListWidget(
              favoritesListLoadedState: state,
            );
          } else if (state is FavoritesListFailureState) {
            return Center(
              child: Text(
                'Fail: ${state.message}',
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
