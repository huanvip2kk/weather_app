import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';

class CommonFloatingActionButton extends StatelessWidget {
  const CommonFloatingActionButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Icon icon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: icon,
      backgroundColor: backgroundColor ?? AppColors.primaryColor,
    );
  }
}
