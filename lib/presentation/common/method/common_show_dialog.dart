import 'package:flutter/material.dart';
import '../../../config/app_text_style.dart';

commonShowDialog({
  required BuildContext context,
  required String title1,
  required Icon icon1,
  required VoidCallback onTap1,
  required String title2,
  required Icon icon2,
  required VoidCallback onTap2,
}) async {
  await showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              title1,
              style: AppTextStyle.fontSize14.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: icon1,
            onTap: onTap1,
          ),
          ListTile(
            title: Text(
              title2,
              style: AppTextStyle.fontSize14.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: icon2,
            onTap: onTap2,
          ),
        ],
      ),
    ),
    barrierDismissible: true,
  );
}