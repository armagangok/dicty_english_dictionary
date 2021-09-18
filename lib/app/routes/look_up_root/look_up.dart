import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'widgets/widgets.dart';

class LookUpPage extends StatefulWidget {
  @override
  _LookUpPageState createState() => _LookUpPageState();
}

class _LookUpPageState extends State<LookUpPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('words'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError)
            return Text(snapshot.error.toString());
          else
            return Widgets();
        } else
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
      },
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
