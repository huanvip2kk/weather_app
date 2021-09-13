import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../data/model/users/users_model.dart';
import '../../../generated/l10n.dart';
import '../../common/widget/back_app_bar_icon_button.dart';
import '../bloc/account_update_bloc.dart';
import 'widget/account_update_widget.dart';

class AccountUpdateScreen extends StatelessWidget {
  const AccountUpdateScreen({
    Key? key,
    required this.usersModel,
  }) : super(key: key);
  final UsersModel usersModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackAppBarIconButton(),
        title: Text(
          S.current.changePermission,
          style: AppTextStyle.fontSize20.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: BlocBuilder<AccountUpdateBloc, AccountUpdateState>(
        builder: (context, state) {
          if (state is AccountUpdateLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AccountUpdateLoadedState) {
            return AccountUpdateWidget(
              usersModel: usersModel,
            );
          } else if (state is AccountUpdateFailureState) {
            return Center(
              child: Text(
                'Fail: ${state.message}',
              ),
            );
          }
          return AccountUpdateWidget(
            usersModel: usersModel,
          );
        },
      ),
    );
  }
}
