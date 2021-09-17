import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/home_screen/Widgets/widgets.dart';
import 'package:wordmind/app/routes/listening_root/listen.dart';
import 'package:get/get.dart';

Widget listenButton(context) {
  return TextButton.icon(
    onPressed: () {
      Get.to(() => ListenPage());
    },
    icon: iconButton(Icon(Icons.timer)),
    label: text("Listen"),
  );
}
