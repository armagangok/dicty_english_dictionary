import 'package:flutter/material.dart';
import 'initApp.dart';
import 'theme/theme.dart';
import 'app/screens/home/home_screen/home_screen.dart';

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
