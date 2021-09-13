import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';

class CommonTextButton extends StatelessWidget {
  const CommonTextButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyle.fontSize14.copyWith(
          color: AppColors.primaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
