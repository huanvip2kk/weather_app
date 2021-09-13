import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_text_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/route/app_routing.dart';
import '../../../common/widget/common_elevated_button_icon.dart';
import '../../../common/widget/header_curved_container.dart';

class AccountNotLoginWidget extends StatelessWidget {
  const AccountNotLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomPaint(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 18.h,
            ),
            painter: HeaderCurvedContainer(
              customColor: AppColors.primaryColor,
            ),
          ),
          Text(
            S.current.youAreNotLogin,
            textAlign: TextAlign.center,
            style: AppTextStyle.fontSize24.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: CommonElevatedButtonIcon(
              icon: Icons.login,
              buttonColor: AppColors.white,
              text: S.current.loginNow,
              textColor: AppColors.black,
              iconColor: AppColors.black,
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  RouteDefine.loginSignupIndexScreen.name,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SvgPicture.asset(
              Assets.svgImages.notLogin.path,
            ),
          ),
        ],
      ),
    );
  }
}
