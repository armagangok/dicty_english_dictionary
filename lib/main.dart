import 'package:flutter/material.dart';
import 'app/screens/home_screen/home_screen.dart';
import 'initApp.dart';
import 'theme/theme.dart';

void main() async {
  await initApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: HomeScreen(),
    );
  }
}


