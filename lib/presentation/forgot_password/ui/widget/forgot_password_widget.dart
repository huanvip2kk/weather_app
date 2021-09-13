import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../common/widget/common_elevated_button.dart';
import '../../../common/widget/common_text_form_field.dart';
import '../../bloc/forgot_password_bloc.dart';

class ForgotPasswordWidget extends StatelessWidget {
  ForgotPasswordWidget({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CommonTextFormField(
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
            SizedBox(
              height: 10.h,
            ),
            CommonElevatedButton(
              buttonColor: AppColors.primaryColor,
              text: S.current.forgotPassword,
              onPressed: () async {
                context.read<ForgotPasswordBloc>().add(
                  ForgotPasswordPressedEvent(
                    emailText: controller.text,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
