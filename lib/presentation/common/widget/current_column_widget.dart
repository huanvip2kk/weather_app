import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_text_style.dart';


class CurrentColumnWidget extends StatelessWidget {
  const CurrentColumnWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
  }) : super(key: key);

  final String title, unit,value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          value.toString(),
          style: AppTextStyle.fontSize14.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          unit,
        ),
      ],
    );
  }
}
