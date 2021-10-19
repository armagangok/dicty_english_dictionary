import 'package:flutter/material.dart';
import '../widgets.dart';
import '../../../listening_screen/listen.dart';

Widget listenButton(context) {
  return TextButton.icon(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListenPage(),
        ),
      );
    },
    icon: iconButton(Icon(Icons.timer)),
    label: text("Listen", context),
  );
}
