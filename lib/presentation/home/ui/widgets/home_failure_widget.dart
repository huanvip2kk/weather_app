import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../common/widget/common_elevated_button_icon.dart';
import '../../bloc/home_bloc.dart';

class HomeFailureWidget extends StatelessWidget {
  const HomeFailureWidget({
    Key? key,
    required this.homeFailureState,
  }) : super(key: key);

  final HomeFailureState homeFailureState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(homeFailureState.message),
            SizedBox(
              height: 10.h,
            ),
            CommonElevatedButtonIcon(
              icon: Icons.refresh,
              buttonColor: AppColors.primaryColor,
              text: S.current.reload,
              onPressed: () {
                context.read<HomeBloc>().add(
                      HomeLoadEvent(),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
