import 'package:flutter/material.dart';

Widget text(String text, context) {
  return Text(
    "$text",
    style: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.w800,
    ),
  );
}

Widget iconButton(Icon icon) {
  return Icon(
    icon.icon,
    size: 40,
  );
}
