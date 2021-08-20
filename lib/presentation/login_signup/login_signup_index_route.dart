import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/index_bloc.dart';
import 'ui/login_signup_index_screen.dart';

class LoginSignupIndexScreenRoute {
  static Widget get route => BlocProvider(
        create: (context) => IndexBloc(),
        child: const LoginSignupIndexScreen(),
      );
}
