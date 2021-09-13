import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_colors.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.onChanged,
    this.textFormFieldKey,
    this.textInputAction,
    this.onEditingComplete,
    this.obscureText,
    this.suffixIcon,
    this.validator,
    this.autovalidateMode,
    this.textInputType,
    this.prefixIcon,
    this.focusedBorderColor,
  }) : super(key: key);

  final TextEditingController controller;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? textInputType;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final GlobalKey? textFormFieldKey;
  final ValueChanged<String>? onChanged;
  final Color? focusedBorderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      key: textFormFieldKey,
      textInputAction: textInputAction,
      obscureText: obscureText ?? false,
      controller: controller,
      autovalidateMode: autovalidateMode,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(26.r),
          ),
        ),
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor ?? AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(
            26.0,
          ),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(25.0),
        //   // borderSide: BorderSide(
        //   //   color: Colors.red,
        //   //   width: 2.0,
        //   // ),
        // ),
      ),
      validator: validator,
      onEditingComplete: onEditingComplete,
    );
  }
}
