import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../data/model/news/news_model.dart';
import '../../../generated/l10n.dart';
import '../../common/widget/back_app_bar_icon_button.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/news_update_bloc.dart';
import 'widget/news_update_widget.dart';

class NewsUpdateScreen extends StatelessWidget {
  const NewsUpdateScreen({
    Key? key,
    required this.newsModel,
  }) : super(key: key);
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackAppBarIconButton(),
        title: Text(
          S.current.updateNews,
          style: AppTextStyle.fontSize20.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: BlocBuilder<NewsUpdateBloc, NewsUpdateState>(
        builder: (context, state) {
          if (state is NewsUpdateLoadingState) {
            return const Loading();
          } else if (state is NewsUpdateLoadedState) {
            return NewsUpdateWidget(
              newsModel: newsModel,
            );
          } else if (state is NewsUpdateFailureState) {
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
