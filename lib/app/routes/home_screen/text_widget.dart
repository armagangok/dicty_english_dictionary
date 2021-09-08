import 'package:flutter/material.dart';

Widget homeText({String text = ''}) {
  return Column(
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    ],
  );
}
