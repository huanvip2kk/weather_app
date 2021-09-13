import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/users/users_model.dart';

import 'bloc/account_update_bloc.dart';
import 'ui/account_update_screen.dart';

class AccountUpdateScreenRoute {
  static Widget route({required UsersModel usersModel}) => BlocProvider(
        create: (context) => AccountUpdateBloc()
          ..add(
            AccountUpdateLoadEvent(),
          ),
        child: AccountUpdateScreen(
          usersModel: usersModel,
        ),
      );
}
