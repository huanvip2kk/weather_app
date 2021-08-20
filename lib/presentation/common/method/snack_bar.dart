import 'package:flutter/material.dart';

void snackBar({context,required Text text}){
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: text
    ),
  );
}