import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';
import '../../../generated/l10n.dart';
import '../../common/method/common_button.dart';
import '../../common/method/common_text_form_field.dart';
import '../../common/widget/header_curved_container.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/search_bloc.dart';
import 'widgets/search_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(context) => Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomPaint(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 12.h,
                  ),
                  painter: HeaderCurvedContainer(
                    customColor: AppColors.kPrimaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: commonTextFormField(
                    focusedBorderColor: AppColors.kWhite,
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
                    onChanged: (s) {
                      if (_formKey.currentState!.validate()) {
                        context.read<SearchBloc>().add(
                              SearchPressedEvent(cityName: controller.text),
                            );
                      }
                    },
                  ),
                ),
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoadedState ||
                        state is SearchResultState) {
                      return BlocBuilder<SearchBloc, SearchState>(
                        builder: (context, state) {
                          if (state is SearchLoadedState) {
                            return searchLoadedWidget(context);
                          } else if (state is SearchResultState) {
                            return searchResultWidget(context, state);
                          }
                          return Container();
                        },
                      );
                    } else if (state is SearchLoadingState) {
                      return Center(
                        child: loading(),
                      );
                    } else if (state is SearchFailureState) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.message),
                            commonElevatedButton(
                              text: 'Reload',
                              buttonColor: AppColors.kPrimaryColor,
                              onPressed: () {
                                context.read<SearchBloc>().add(
                                      SearchLoadEvent(),
                                    );
                              },
                            ),
                          ],
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

// else if (state is SearchLoadedState) {
//   return Column(
//     children: [
//       CustomPaint(
//         child: SizedBox(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height / 12.h,
//         ),
//         painter: HeaderCurvedContainer(
//           customColor: AppColors.kPrimaryColor,
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: CommonTextFormField(
//           obscureText: false,
//           controller: controller,
//           labelText: 'Search',
//           prefixIcon: const Icon(Icons.search),
//           onEditingComplete: () {
//             print('ok');
//           },
//           textInputAction: TextInputAction.search,
//         ),
//       ),
//     ],
//   );
