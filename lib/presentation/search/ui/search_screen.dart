
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import '../../common/widget/common_custom_paint.dart';
import '../../common/widget/common_text_form_field.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/search_bloc.dart';
import 'widgets/search_failure_state.dart';
import 'widgets/search_result_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(context) {
    return Scaffold(
      body: Form(
        key: _formKey,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.current.characterRequire;
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<SearchBloc>().add(
                            SearchPressedEvent(
                              cityName: controller.text,
                            ),
                          );
                    }
                  },
                ),
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchResultState) {
                    if (state.locationModel!.isEmpty) {
                      return Text(S.current.noData);
                    }
                    return SearchResultWidget(
                      context: context,
                      state: state,
                    );
                  } else if (state is SearchLoadingState) {
                    return const Loading();
                  } else if (state is SearchFailureState) {
                    return SearchFailureWidget(state: state);
                  }
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      Assets.svgImages.search.path,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
