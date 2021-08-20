import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../config/app_colors.dart';

void toast({
  final String? msg,
  final Color? bgColor,
  final Color? textColor,
  final ToastGravity? toastGravity,
  final Toast? toastLength,
}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: msg.toString(),
    toastLength: toastLength ?? Toast.LENGTH_LONG,
    gravity: toastGravity ?? ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: bgColor ?? AppColors.kPrimaryColor,
    textColor: textColor ?? AppColors.kWhite,
    fontSize: 16.0,
  );
}
