import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../generated/l10n.dart';
import '../../common/widget/back_app_bar_icon_button.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/news_add_bloc.dart';
import 'widget/news_add_widget.dart';

class NewsAddScreen extends StatelessWidget {
  const NewsAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackAppBarIconButton(),
        title: Text(
          S.current.addNews,
          style: AppTextStyle.fontSize20.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: BlocBuilder<NewsAddBloc, NewsAddState>(
        builder: (context, state) {
          if (state is NewsAddLoadingState) {
            return const Loading();
          } else if (state is NewsAddLoadedState) {
            return const NewsAddWidget();
          } else if (state is NewsAddFailureState) {
            return Center(
              child: Text(
                S.current.fail(state.message),
              ),
            );
          }
          return const NewsAddWidget();
        },
      ),
    );
  }
}
