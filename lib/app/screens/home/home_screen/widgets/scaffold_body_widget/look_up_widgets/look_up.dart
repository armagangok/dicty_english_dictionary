import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'widgets/listview_builder_widget/widgets.dart';

class LookUpScreen extends StatelessWidget {
  @override
  build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('words'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError)
            return Text(snapshot.error.toString());
          else
            return Widgets();
        } else {
          return Text("");
        }
      },
    );
  }
}
