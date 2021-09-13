import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../generated/l10n.dart';
import '../../../utils/route/app_routing.dart';
import '../../common/widget/back_app_bar_icon_button.dart';
import '../../common/widget/floating_action_button.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/news_management_bloc.dart';
import 'widgets/list_news_widget.dart';

class NewsManagementScreen extends StatefulWidget {
  const NewsManagementScreen({Key? key}) : super(key: key);

  @override
  _NewsManagementScreenState createState() => _NewsManagementScreenState();
}

class _NewsManagementScreenState extends State<NewsManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackAppBarIconButton(),
        title: Text(
          S.current.newsManagement,
          style: AppTextStyle.fontSize20.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: BlocBuilder<NewsManagementBloc, NewsManagementState>(
        builder: (context, state) {
          if (state is NewsManagementLoadingState) {
            return const Loading();
          } else if (state is NewsManagementLoadedState) {
            return ListNewsWidget(
              newsManagementLoadedState: state,
              blocContext: context,
            );
          } else if (state is NewsManagementFailureState) {
            return Center(
              child: Text(
                S.current.fail(state.message),
              ),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: CommonFloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          RouteDefine.newsAddScreen.name,
        ),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
