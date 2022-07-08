import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../home/components/look_up_widgets.dart';



class RecentView extends StatelessWidget {
  const RecentView({Key? key}) : super(key: key);
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
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text("Something went wrong...."),
          );
        }
      },
    );
  }
}
