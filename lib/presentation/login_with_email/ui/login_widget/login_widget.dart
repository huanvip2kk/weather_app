import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/app_text_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/route/app_routing.dart';
import '../../../common/widget/back_app_bar_icon_button.dart';
import '../../../common/widget/common_elevated_button.dart';
import '../../../common/widget/common_text_button.dart';
import '../../../common/widget/common_text_form_field.dart';
import '../../../common/widget/dont_have_an_account_widget.dart';
import '../../login_bloc/login_bloc.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: const BackAppBarIconButton(),
          title: Text(
            S.current.login,
            style: AppTextStyle.fontSize20.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: double.infinity,
                          height: 250.h,
                          child: SvgPicture.asset(
                            Assets.svgImages.login.path,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          S.current.continueWithEmail,
                          style: AppTextStyle.fontSize24.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        S.current.loginQuote,
                        style: AppTextStyle.fontSize14.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextFormField(
                        controller: _emailController,
                        labelText: S.current.email,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value ?? '');
                          if (!emailValid) return S.current.invalidEmail;
                          return null;
                        },
                        prefixIcon: const Icon(Icons.email),
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextFormField(
                        obscureText: obscureText,
                        controller: _passwordController,
                        labelText: S.current.password,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.length < 6) {
                            return S.current.passwordMustLongerThan6Character;
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.password_outlined),
                        suffixIcon: TextButton(
                          onPressed: _toggle,
                          child: Icon(obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextButton(
                        text: S.current.forgotPassword,
                        onPressed: () => Navigator.pushNamed(
                          context,
                          RouteDefine.forgotPasswordScreen.name,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CommonElevatedButton(
                          buttonColor: AppColors.primaryColor,
                          text: S.current.login,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(
                                    LoginPressedEvent(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const DontHaveAnAccount(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
