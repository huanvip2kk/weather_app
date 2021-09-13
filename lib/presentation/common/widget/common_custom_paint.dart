import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';
import 'header_curved_container.dart';

class CommonCustomPaint extends StatelessWidget {
  const CommonCustomPaint({
    Key? key,
    this.color,
    this.height,
  }) : super(key: key);

  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: SizedBox(
        width: double.infinity,
        height: height ?? MediaQuery.of(context).size.height / 12.h,
      ),
      painter: HeaderCurvedContainer(
        customColor: color ?? AppColors.primaryColor,
      ),
    );
  }
}
