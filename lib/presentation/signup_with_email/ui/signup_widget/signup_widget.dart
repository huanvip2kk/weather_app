import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/app_text_style.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/l10n.dart';
import '../../../common/widget/back_app_bar_icon_button.dart';
import '../../../common/widget/common_elevated_button.dart';
import '../../../common/widget/common_text_form_field.dart';
import '../../signup_bloc/signup_bloc.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _rePassword = TextEditingController();

  final TextEditingController _name = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText = true;

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
            S.current.signUp,
            style: AppTextStyle.fontSize20.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: Form(
          key: formKey,
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
                            Assets.svgImages.signup.path,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          S.current.signUp,
                          style: AppTextStyle.fontSize24.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        S.current.signupQuote,
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
                        controller: _name,
                        labelText: S.current.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.length < 4) {
                            return S.current.nameMustLongerThan4Character;
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextFormField(
                        controller: _email,
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
                        controller: _password,
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
                      CommonTextFormField(
                        obscureText: obscureText,
                        controller: _rePassword,
                        labelText: S.current.rePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.length < 6) {
                            return S.current.passwordMustLongerThan6Character;
                          }
                          if (value != _password.text) {
                            return S.current.notMatch;
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.password_sharp),
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
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CommonElevatedButton(
                          buttonColor: AppColors.primaryColor,
                          text: S.current.signUp,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              context.read<SignupBloc>().add(
                                    SignupPressedEvent(
                                      email: _email.text,
                                      password: _password.text,
                                      //phoneNumber: _phoneNumber.text,
                                      name: _name.text,
                                    ),
                                  );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
