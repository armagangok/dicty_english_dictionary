import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/look_up_root/look_up.dart';
import 'widgets.dart';
import 'package:get/get.dart';

Widget lookUpButton(context) {
  return TextButton.icon(
    icon: iconButton(Icon(Icons.text_snippet_outlined)),
    label: text("Look Up"),
    onPressed: () {
      Get.to(() => LookUpPage());
    },
  );
}
