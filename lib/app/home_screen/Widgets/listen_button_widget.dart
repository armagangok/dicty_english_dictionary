import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home_screen/Widgets/widgets.dart';
import '../../routes/listening_root/listen.dart';

Widget listenButton(context) {
  return TextButton.icon(
    onPressed: () {
      Get.to(() => ListenPage());
    },
    icon: iconButton(Icon(Icons.timer)),
    label: text("Listen"),
  );
}
