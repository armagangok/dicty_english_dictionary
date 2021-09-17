import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/word_adding_root/add_word.dart';
import 'widgets.dart';
import 'package:get/get.dart';

Widget typeWordButton(context) {
  return TextButton.icon(
    onPressed: () {
      Get.to(() => AddingPage());
    },
    icon: iconButton(Icon(Icons.text_fields)),
    label: text("Type Word"),
  );
}
