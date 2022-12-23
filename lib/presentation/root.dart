import 'package:flutter/material.dart';

import '../global/export/export.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      theme: CustomTheme.instance.ligthTheme,
      darkTheme: CustomTheme.instance.darkTheme,
      // themeMode: ThemeService.instance.getThemeMode(),
      // initialRoute: '/onboard',
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
