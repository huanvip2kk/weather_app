import 'package:flutter/material.dart';

class CommonDropdownButton extends StatelessWidget {
  const CommonDropdownButton({
    Key? key,
    required this.title,
    required this.string,
    required this.listString,
    required this.leadingIcon,
    required this.onChanged,
  }) : super(key: key);

  final Text title;
  final Icon leadingIcon;
  final List listString;
  final String string;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      leading: leadingIcon,
      trailing: DropdownButton<String>(
        items: listString
            .map((value) => DropdownMenuItem<String>(
                  child: Text(
                    value,
                  ),
                  value: value,
                ))
            .toList(),
        value: string,
        onChanged: onChanged,
      ),
    );
  }
}
