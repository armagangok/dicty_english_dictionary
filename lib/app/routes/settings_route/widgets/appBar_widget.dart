import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/settings_route/widgets/save_button.dart';

PreferredSizeWidget appBar(currentTime, language) {
  return AppBar(
    backgroundColor: Colors.grey[600],
    title: Text(
      "Settings",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w900,
      ),
    ),
    actions: [
      saveButton(currentTime, language),
    ],
  );
}
