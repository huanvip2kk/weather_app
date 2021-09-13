import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.buttonColor,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.fontSize14,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          buttonColor ?? AppColors.primaryColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}