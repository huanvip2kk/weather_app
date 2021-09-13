import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../../utils/route/app_routing.dart';

import 'common_text_button.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${S.current.dontHaveAnAccount} ?',
        ),
        CommonTextButton(
          text: S.current.signUp,
          onPressed: () {
            Navigator.pushNamed(
              context,
              RouteDefine.signupScreen.name,
            );
          },
        )
      ],
    );
  }
}
