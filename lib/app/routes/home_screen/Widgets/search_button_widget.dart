import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/search_screen/search.dart';
import 'package:get/get.dart';
import 'widgets.dart';

Widget searchButton(
  context,
) {
  return TextButton.icon(
    label: text("Search"),
    icon: iconButton(Icon(Icons.search)),
    onPressed: () {
      Get.to(() => Search());
    },
  );
}
