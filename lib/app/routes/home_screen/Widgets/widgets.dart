import 'package:flutter/material.dart';

Widget text(String text) {
  return Text(
    "$text",
    style: TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontWeight: FontWeight.w800,
    ),
  );
}

Widget iconButton(Icon icon) {
  return Icon(
    icon.icon,
    color: Colors.amber[900],
    size: 35,
  );
}
