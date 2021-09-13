import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/app_colors.dart';
import '../../../../../../config/app_text_style.dart';
import '../../../../../../generated/l10n.dart';
import '../../common/widget/back_app_bar_icon_button.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/forgot_password_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: const BackAppBarIconButton(),
          title: Text(
            S.current.forgotPassword,
            style: AppTextStyle.fontSize20.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          builder: (context, state) {
            if (state is ForgotPasswordLoadingState) {
              return const Loading();
            } else if (state is ForgotPasswordLoadedState) {
              return const ForgotPasswordScreen();
            } else if (state is ForgotPasswordFailureState) {
              return Center(
                child: Text(
                  'Fail: ${state.message}',
                ),
              );
            }
            return const Loading();
          },
        ),
      );
}
