import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


IconButton backIconButton(context) => IconButton(
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(),
        ),
        child: const Icon(
          Icons.navigate_before,
          color: Colors.black,
        ),
        width: 48.w,
        height: 48.h,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
