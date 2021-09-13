import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_text_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/route/app_routing.dart';
import '../../../common/widget/common_elevated_button_icon.dart';
import '../../../common/widget/common_text_button.dart';
import '../../../common/widget/dont_have_an_account_widget.dart';
import '../../bloc/index_bloc.dart';

class IndexWidget extends StatelessWidget {
  const IndexWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 50.h,
                  child: CommonElevatedButtonIcon(
                    icon: FontAwesomeIcons.google,
                    text: S.current.continueWithGoogle,
                    buttonColor: AppColors.primaryColor,
                    onPressed: () async {
                      context.read<IndexBloc>().add(
                            IndexGoogleLoginPressedEvent(),
                          );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: CommonElevatedButtonIcon(
                  icon: FontAwesomeIcons.facebook,
                  text: S.current.continueWithFaceBook,
                  buttonColor: AppColors.primaryColor,
                  onPressed: () async {
                    context.read<IndexBloc>().add(
                          IndexFacebookLoginPressedEvent(),
                        );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: CommonElevatedButtonIcon(
                    icon: Icons.email,
                    text: S.current.continueWithEmail,
                    buttonColor: AppColors.primaryColor,
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
              CommonTextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteDefine.mainScreen.name,
                  );
                },
                text: S.current.skipForNow,
              ),
              const DontHaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

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
