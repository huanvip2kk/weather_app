import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../generated/l10n.dart';
import '../../common/widget/back_app_bar_icon_button.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/account_list_bloc.dart';
import 'widget/account_list_widget.dart';

class AccountListScreen extends StatelessWidget {
  const AccountListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackAppBarIconButton(),
        title: Text(
          S.current.accountManagement,
          style: AppTextStyle.fontSize20.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: BlocBuilder<AccountListBloc, AccountListState>(
        builder: (context, state) {
          if (state is AccountListLoadingState) {
            return const Loading();
          } else if (state is AccountListLoadedState) {
            return AccountListWidget(
              accountListLoadedState: state,
              blocContext: context,
            );
          } else if (state is AccountListFailureState) {
            return Center(
              child: Text(
                S.current.fail(state.message),
              ),
            );
          }
          return const Loading();
        },
      ),
    );
  }
}
