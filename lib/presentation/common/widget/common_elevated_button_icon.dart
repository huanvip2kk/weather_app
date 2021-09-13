import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_text_style.dart';

class CommonElevatedButtonIcon extends StatelessWidget {
  const CommonElevatedButtonIcon({
    Key? key,
    required this.text,
    required this.icon,
    this.onPressed,
    this.iconColor,
    this.textColor,
    this.buttonColor,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final Color? buttonColor;
  final IconData icon;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: iconColor,
      ),
      onPressed: onPressed,
      label: Text(
        text,
        style: AppTextStyle.fontSize14.copyWith(
          color: textColor,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          buttonColor,
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