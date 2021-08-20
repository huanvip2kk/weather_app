import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/account_bloc.dart';
import 'ui/account_screen.dart';

class AccountScreenRoute {
  static Widget get route => BlocProvider(
        create: (context) => AccountBloc()
          ..add(
            AccountLoadEvent(),
          ),
        child: const AccountScreen(),
      );
}
