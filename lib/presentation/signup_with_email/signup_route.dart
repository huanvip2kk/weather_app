import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_bloc/signup_bloc.dart';
import 'ui/signup_screen.dart';

class SignupScreenRoute {
  static Widget get route => BlocProvider(
        create: (context) => SignupBloc(),
        child: const SignupScreen(),
      );
}
