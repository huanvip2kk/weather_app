import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../utils/route/app_routing.dart';
import 'common_button.dart';

Row dontHaveAnAccount(context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '${S.current.dontHaveAnAccount} ?',
      ),
      commonTextButton(
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