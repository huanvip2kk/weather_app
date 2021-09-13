import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_bloc/login_bloc.dart';
import 'ui/login_screen.dart';

class LoginScreenRoute {
  static Widget get route => BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginScreen(),
      );
}
