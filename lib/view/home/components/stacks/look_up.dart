import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'look_up_widgets.dart';

class LookUpScreen extends StatelessWidget {
  const LookUpScreen({Key? key}) : super(key: key);
  @override
  build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('words'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const LookUpWidget();
          }
        } else {
          return const LookUpWidget();
        }
      },
    );
  }
}
