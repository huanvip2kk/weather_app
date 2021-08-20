import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../common/method/main_multi_bloc_provider.dart';
import '../../common/method/toast.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/index_bloc.dart';
import 'widget/index_widget.dart';

class LoginSignupIndexScreen extends StatefulWidget {
  const LoginSignupIndexScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupIndexScreenState createState() => _LoginSignupIndexScreenState();
}

class _LoginSignupIndexScreenState extends State<LoginSignupIndexScreen> {
  List languages = ['English', 'Tiếng Việt'];

  String lang = 'English';

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
          builder: (context, state) {
            if (state is IndexLoadingState) {
              return loading();
            } else if (state is IndexLoginSuccessState) {
              return mainMultiBlocProvider();
            } else if (state is IndexFailureState) {
              return loginSignupIndexScreen(context);
            }
            return loginSignupIndexScreen(context);
          },
          listener: (context, state) {
            if (state is FloatingSuccessState) {
              toast(
                msg: S.current.loginSuccess,
              );
            } else if (state is FloatingFailureState) {
              toast(
                msg: '${S.current.loginFail}: ${state.message.toString()}',
              );
            }
          },
          buildWhen: (context, state) {
            if (state is FloatingSuccessState ||
                state is FloatingFailureState) {
              return false;
            }
            return true;
          },
        ),
      );
}
