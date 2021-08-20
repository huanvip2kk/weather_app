import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/app_colors.dart';

TextFormField commonTextFormField({
  required final TextEditingController controller,
  final AutovalidateMode? autovalidateMode,
  final TextInputType? textInputType,
  required final String labelText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final FormFieldValidator<String>? validator,
  final bool obscureText = false,
  final VoidCallback? onEditingComplete,
  final TextInputAction? textInputAction,
  final GlobalKey? key,
  final ValueChanged<String>? onChanged,
  final Color? focusedBorderColor,
}) =>
    TextFormField(
      onChanged: onChanged,
      key: key,
      textInputAction: textInputAction,
      obscureText: obscureText,
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
            color: focusedBorderColor ?? AppColors.kPrimaryColor,
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
