import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../../config/app_colors.dart';
import '../../../../../../config/app_text_style.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../utils/route/app_routing.dart';
import '../../../../../common/method/back_icon_button.dart';
import '../../../../../common/method/common_button.dart';
import '../../../../../common/method/common_text_form_field.dart';
import '../../../../../common/method/sized_box_10h.dart';
import '../../../../../common/method/toast.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: backIconButton(context),
          title: Text(
            S.current.forgotPassword,
            style: AppTextStyle.fontSize20.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                commonTextFormField(
                  controller: controller,
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
                sizedBox10h(),
                commonElevatedButton(
                  buttonColor: AppColors.kPrimaryColor,
                  text: S.current.forgotPassword,
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: controller.text,
                      );
                      toast(
                        msg: S.current.success,
                      );
                      await Navigator.pushReplacementNamed(
                          context, RouteDefine.loginScreen.name);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        toast(
                          msg: S.current.userNotFound,
                        );
                      } else if (e.code == 'Network-request-failed') {
                        toast(
                          msg: S.current.networkError,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
