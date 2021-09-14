import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/home_screen/Widgets/widgets.dart';
import 'package:wordmind/app/routes/listening_root/listen.dart';

Widget listenButton(context) {
  return TextButton.icon(
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ListenPage();
      }));
    },
    icon: iconButton(Icon(Icons.timer)),
    label: text("Listen"),
  );
}
