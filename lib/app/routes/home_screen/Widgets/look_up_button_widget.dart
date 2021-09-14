import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/look_up_root/look_up.dart';

import 'widgets.dart';

Widget lookUpButton(context) {
  return TextButton.icon(
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return LookUpPage();
      }));
    },
    icon: iconButton(Icon(Icons.text_snippet_outlined)),
    label: text("Look Up"),
  );
}

