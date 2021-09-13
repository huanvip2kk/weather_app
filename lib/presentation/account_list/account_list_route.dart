import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/account_list_bloc.dart';
import 'ui/account_list_screen.dart';


class AccountListScreenRoute {
  static Widget get route => BlocProvider(
    create: (context) => AccountListBloc(
    )..add(
      AccountListLoadEvent(),
    ),
    child: const AccountListScreen(),
  );
}