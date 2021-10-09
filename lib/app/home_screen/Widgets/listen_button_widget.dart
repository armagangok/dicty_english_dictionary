import 'package:flutter/material.dart';
import '../../home_screen/Widgets/widgets.dart';
import '../../screens/listening_root/listen.dart';

Widget listenButton(context) {
  return TextButton.icon(
    onPressed: () {
      	Navigator.push(
						    context,
						    MaterialPageRoute(builder: (context) => ListenPage()),
						  );
    },
    icon: iconButton(Icon(Icons.timer)),
    label: text("Listen", context),
  );
}
