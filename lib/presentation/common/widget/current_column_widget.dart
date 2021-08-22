import 'package:flutter/material.dart';
import '../../../config/app_text_style.dart';
import '../method/sized_box_10h.dart';

Column currentColumnWidget({
  required String title,
  value,
  unit,
}) =>
    Column(
      children: [
        Text(
          title,
        ),
        sizedBox10h(),
        Text(
          value,
          style: AppTextStyle.fontSize14.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        sizedBox10h(),
        Text(
          unit,
        ),
      ],
    );
