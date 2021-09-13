import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../common/method/toast.dart';
import '../../common/widget/loading_widget.dart';
import '../../main/main_route.dart';
import '../login_bloc/login_bloc.dart';
import 'login_widget/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) => Scaffold(
    body: BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoginLoadingState:
            const Loading();
            break;

          case LoginSuccessState:
            toast(
              msg: S.current.loginSuccess,
            );
            break;

          case LoginFailureState:
            state as LoginFailureState;
            toast(
              msg: '${S.current.loginFail}: ${state.message}',
            );
            break;
        }
      },
      buildWhen: (context, state) {
        if (state is LoginSuccessState ||
            state is LoginFailureState ||
            state is LoginLoadingState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoginLoadingState:
            return const Loading();

          case LoginSuccessState:
            return MainScreenRoute.route;

          case LoginFailureState:
            return const LoginWidget();
        }
        return const LoginWidget();
      },
    ),
  );
}
