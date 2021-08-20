import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';

Widget loading() => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCubeGrid(
              color: AppColors.kPrimaryColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Loading...',
              style: AppTextStyle.fontSize14.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
