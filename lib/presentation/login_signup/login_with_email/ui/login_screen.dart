import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../common/method/main_multi_bloc_provider.dart';
import '../../../common/method/toast.dart';
import '../../../common/widget/loading_widget.dart';
import '../login_bloc/login_bloc.dart';
import 'login_widget/login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(context) => BlocConsumer<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return loading();
          } else if (state is LoginSuccessState) {
            return mainMultiBlocProvider();
          } else if (state is LoginFailureState) {
            return const LoginWidget();
          }
          return const LoginWidget();
        },
        listener: (context, state) {
          if (state is FloatingSuccessState) {
            toast(
              msg: S.current.loginSuccess,
            );
          } else if (state is FloatingFailureState) {
            toast(
              msg: '${S.current.loginFail}: ${state.message}',
            );
          }
        },
        buildWhen: (context, state) {
          if (state is FloatingSuccessState || state is FloatingFailureState) {
            return false;
          }
          return true;
        },
      );
}
