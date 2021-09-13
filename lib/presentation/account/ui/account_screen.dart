import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';

import '../../common/widget/loading_widget.dart';
import '../bloc/account_bloc.dart';
import 'widget/account_login_widget.dart';
import 'widget/account_not_login_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  User? _user;

  onRefresh(userCred) {
    setState(() {
      _user = userCred;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  @override
  Widget build(context) => Scaffold(
        body: _user != null
            ? BlocBuilder<AccountBloc, AccountState>(
                builder: (context, state) {
                  if (state is AccountLoadingState) {
                    return const Loading();
                  } else if (state is AccountLoadedState) {
                    return AccountLoginWidget(state: state, context: context);
                  } else if (state is AccountFailureState) {
                    return Center(
                      child: Text(
                        S.current.fail(state.message),
                      ),
                    );
                  }
                  return const Loading();
                },
              )
            : const AccountNotLoginWidget(),
      );
}
