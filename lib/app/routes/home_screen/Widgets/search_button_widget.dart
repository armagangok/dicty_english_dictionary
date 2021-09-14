import 'package:flutter/material.dart';
import 'package:wordmind/app/routes/home_screen/Widgets/listen_button_widget.dart';
import 'package:wordmind/app/routes/search_screen/search.dart';

import 'widgets.dart';

Widget searchButton(
  context,
) {
  return TextButton.icon(
    label: text("Search"),
    icon: iconButton(Icon(Icons.search)),
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Search();
      }));
    },
  );
}
