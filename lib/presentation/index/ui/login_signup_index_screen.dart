import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../common/method/toast.dart';
import '../../common/widget/loading_widget.dart';
import '../../main/main_route.dart';
import '../bloc/index_bloc.dart';
import 'widget/index_widget.dart';

class LoginSignupIndexScreen extends StatefulWidget {
  const LoginSignupIndexScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupIndexScreenState createState() => _LoginSignupIndexScreenState();
}

class _LoginSignupIndexScreenState extends State<LoginSignupIndexScreen> {
  User? user;

  onRefresh(userCred) {
    setState(() {
      user = userCred;
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
        body: BlocConsumer<IndexBloc, IndexState>(
          listener: (context, state) {
            switch (state.runtimeType) {
              case IndexLoadingState:
                const Loading();
                break;

              case IndexLoginSuccessState:
                toast(
                  msg: S.current.loginSuccess,
                );
                break;

              case IndexFailureState:
                state as IndexFailureState;
                toast(
                  msg: '${S.current.loginFail}: ${state.message}',
                );
                break;
            }
          },
          buildWhen: (context, state) {
            if (state is IndexLoginSuccessState ||
                state is IndexFailureState ||
                state is IndexLoadingState) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case IndexLoadingState:
                return const Loading();

              case IndexLoginSuccessState:
                return MainScreenRoute.route;

              case IndexFailureState:
                return const IndexWidget();
            }
            return const IndexWidget();
          },
        ),
      );
}
