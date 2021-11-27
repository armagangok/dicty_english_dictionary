import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wordmind/app/views/view_home/components/scaffold_body_widget/widgets/look_up_widgets.dart';

class LookUpScreen extends StatelessWidget {
  @override
  build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('words'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError)
            return Text(snapshot.error.toString());
          else {
            return LookUpWidget();
          }
        } else {
          return LookUpWidget();
        }
      },
    );
  }
}
