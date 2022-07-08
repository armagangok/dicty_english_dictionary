import 'feature/export/export.dart';

void main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntAdWidget(),
      theme: CustomTheme().ligthTheme,
      darkTheme: CustomTheme().darkTheme,
      themeMode: ThemeService().getThemeMode(),
    );
  }
}
