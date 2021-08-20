import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../common/method/toast.dart';
import '../../../common/widget/loading_widget.dart';
import '../../login_with_email/login_bloc/login_bloc.dart';
import '../../login_with_email/ui/login_screen.dart';
import '../signup_bloc/signup_bloc.dart';
import 'signup_widget/signup_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(context) => BlocConsumer<SignupBloc, SignupState>(
        builder: (context, state) {
          if (state is SignupLoadingState) {
            return loading();
          } else if (state is SignupSuccessState) {
            return BlocProvider(
              create: (context) => LoginBloc(),
              child: const LoginScreen(),
            );
          } else if (state is SignupFailureState) {
            return const SignupWidget();
          }
          return const SignupWidget();
        },
        listener: (context, state) {
          if (state is SignupFloatingSuccessState) {
            toast(
              msg: S.current.signupSuccess,
            );
          } else if (state is SignupFloatingFailureState) {
            toast(
              msg: '${S.current.signupFail}: ${state.message}',
            );
          }
        },
        buildWhen: (context, state) {
          if (state is SignupFloatingSuccessState ||
              state is SignupFloatingFailureState) {
            return false;
          }
          return true;
        },
      );
}
