import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/theme/theme.dart';
import 'app/theme/theme_service.dart';
import 'app/views/home/view_home.dart';
import 'core/init.dart';
import 'package:provider/provider.dart';
import 'core/providers/provider_helper.dart';

void main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiProvider(context),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
        theme: CustomTheme().ligthTheme,
        darkTheme: CustomTheme().darkTheme,
        themeMode: ThemeService().getThemeMode(),
      ),
    );
  }
}
