import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import '../../../utils/route/app_routing.dart';
import '../../common/method/common_button.dart';
import '../../common/method/dont_have_an_account.dart';
import '../../common/method/main_multi_bloc_provider.dart';
import '../../common/method/toast.dart';
import '../../common/widget/loading_widget.dart';
import '../bloc/index_bloc.dart';

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

  Scaffold loginSignupIndexScreen(BuildContext context) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 250.h,
                  child: SvgPicture.asset(
                    Assets.svgImages.weather3.path,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  S.current.selectYourLoginMethod,
                  style: AppTextStyle.fontSize24.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: commonElevatedButtonIcon(
                      icon: FontAwesomeIcons.google,
                      text: S.current.continueWithGoogle,
                      buttonColor: AppColors.kPrimaryColor,
                      onPressed: () async {
                        context.read<IndexBloc>().add(
                              GoogleLoginPressedEvent(),
                            );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: commonElevatedButtonIcon(
                    icon: FontAwesomeIcons.facebook,
                    text: S.current.continueWithFaceBook,
                    buttonColor: AppColors.kPrimaryColor,
                    onPressed: () async {
                      context.read<IndexBloc>().add(
                            FaceBookLoginPressedEvent(),
                          );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: commonElevatedButtonIcon(
                      icon: Icons.email,
                      text: S.current.continueWithEmail,
                      buttonColor: AppColors.kPrimaryColor,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteDefine.loginScreen.name,
                        );
                      },
                    ),
                  ),
                ),
                divider(),
                commonTextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteDefine.mainScreen.name,
                    );
                  },
                  text: S.current.skipForNow,
                ),
                dontHaveAnAccount(context),
              ],
            ),
          ),
        ),
      );

  Row divider() => Row(
        children: [
          const Expanded(
            child: Divider(
              height: 5,
              thickness: 2,
            ),
          ),
          Text(
            '  ${S.current.or}  ',
            style: AppTextStyle.fontSize14,
          ),
          const Expanded(
            child: Divider(
              height: 5,
              thickness: 2,
            ),
          ),
        ],
      );

}
