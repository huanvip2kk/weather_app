import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/app_colors.dart';
import '../../../generated/l10n.dart';
import '../../common/widget/common_custom_paint.dart';
import '../../common/widget/common_text_form_field.dart';

import '../../common/widget/loading_widget.dart';
import '../bloc/news_list_bloc.dart';
import 'widget/news_list_screen_widget.dart';

class NewsListScreen extends StatelessWidget {
  NewsListScreen({Key? key}) : super(key: key);

  final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CommonCustomPaint(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CommonTextFormField(
                  focusedBorderColor: AppColors.white,
                  controller: controller,
                  labelText: S.current.search,
                  prefixIcon: const Icon(Icons.search),
                  textInputAction: TextInputAction.search,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              BlocBuilder<NewsListBloc, NewsListState>(
                builder: (context, state) {
                  if (state is NewsListLoadingState) {
                    return const Loading();
                  } else if (state is NewsListLoadedState) {
                    return NewsListScreenWidget(
                      state: state,
                    );
                  } else if (state is NewsListFailureState) {
                    return Center(
                      child: Text(
                        'Fail: ${state.message}',
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
