import 'package:flutter/material.dart';

commonShowModalBottomSheet({
  required BuildContext context,
  required Icon icon1,
  required Icon icon2,
  required VoidCallback onTap1,
  required VoidCallback onTap2,
  required Text title1,
  required Text title2,
}) async {
  await showModalBottomSheet(
    context: context,
    builder: (builder) => Wrap(
      children: [
        ListTile(
          leading: icon1,
          title: title1,
          onTap: onTap1,
        ),
        ListTile(
          leading: icon2,
          title: title2,
          onTap: onTap2,
        )
      ],
    ),
  );
}