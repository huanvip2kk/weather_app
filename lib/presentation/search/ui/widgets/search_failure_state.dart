import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../common/widget/common_elevated_button.dart';
import '../../bloc/search_bloc.dart';

class SearchFailureWidget extends StatelessWidget {
  const SearchFailureWidget({
    Key? key,
    required this.state
  }) : super(key: key);

  final SearchFailureState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.message),
          CommonElevatedButton(
            text: S.current.reload,
            buttonColor: AppColors.primaryColor,
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
}
