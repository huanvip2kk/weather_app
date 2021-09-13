import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../common/method/toast.dart';
import '../../common/widget/loading_widget.dart';
import '../../login_with_email/login_route.dart';
import '../signup_bloc/signup_bloc.dart';
import 'signup_widget/signup_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) => Scaffold(
        body: BlocConsumer<SignupBloc, SignupState>(
          listener: (_, state) {
            switch (state.runtimeType) {
              case SignupLoadingState:
                const Loading();
                break;

              case SignupSuccessState:
                toast(
                  msg: S.current.signupSuccess,
                );
                break;

              case SignupFailureState:
                state as SignupFailureState;
                toast(
                  msg: S.current.signupFail(state.message),
                );
                break;
            }
          },
          buildWhen: (_, state) {
            if (state is SignupSuccessState ||
                state is SignupFailureState ||
                state is SignupLoadingState) {
              return true;
            }
            return false;
          },
          builder: (_, state) {
            switch (state.runtimeType) {
              case SignupLoadingState:
                return const Loading();

              case SignupSuccessState:
                return LoginScreenRoute.route;

              case SignupFailureState:
                return const SignupWidget();
            }
            return const SignupWidget();
          },
        ),
      );
}
