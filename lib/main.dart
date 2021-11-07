import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordmind/theme/theme.dart';
import 'package:wordmind/theme/theme_service.dart';
import 'app/screens/home_screen/home_screen.dart';
import 'initApp.dart';

void main() async {
  await initApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: CustomTheme().lightTheme,
      darkTheme: CustomTheme().darkTheme,
      themeMode: ThemeService().getThemeMode(),
    );
  }
}
