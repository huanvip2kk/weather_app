import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';

ElevatedButton commonElevatedButtonIcon({
  final VoidCallback? onPressed,
  required final String text,
  final Color? buttonColor,
  required final IconData icon,
  final Color? textColor,
  final Color? iconColor,
}) =>
    ElevatedButton.icon(
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

ElevatedButton commonElevatedButton({
  final VoidCallback? onPressed,
  required final String text,
  final Color? buttonColor,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.fontSize14,
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

TextButton commonTextButton({
  final VoidCallback? onPressed,
  required final String text,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.fontSize14.copyWith(
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
