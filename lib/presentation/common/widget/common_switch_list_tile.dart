import 'package:flutter/material.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';

class CommonSwitchListTile extends StatefulWidget {
  const CommonSwitchListTile({
    Key? key,
    required this.title,
    required this.valueTextOn,
    required this.valueTextOff,
    required this.icon,
    this.activeColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    required this.boolValue,
    required this.onChanged,
  }) : super(key: key);

  final String title, valueTextOn, valueTextOff;
  final Icon icon;
  final Color? activeColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final bool boolValue;
  final ValueChanged onChanged;

  @override
  _SwitchListTileState createState() => _SwitchListTileState();
}

class _SwitchListTileState extends State<CommonSwitchListTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        widget.title,
        style: AppTextStyle.fontSize14.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        widget.boolValue ? widget.valueTextOn : widget.valueTextOff,
        style: AppTextStyle.fontSize14,
      ),
      value: widget.boolValue,
      onChanged: widget.onChanged,
      secondary: widget.icon,
      activeColor: widget.activeColor ?? AppColors.primaryColor,
      inactiveThumbColor:
          widget.inactiveThumbColor ?? AppColors.recoveredColor,
      inactiveTrackColor:
          widget.inactiveTrackColor ?? AppColors.recoveredColorShade300,
    );
  }
}
