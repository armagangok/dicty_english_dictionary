import 'feature/export/export.dart';
import 'feature/workmanager/test_view.dart';

void main() async {
  await Initialization.instance.initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  RootView(),
      theme: CustomTheme.instance.ligthTheme,
      darkTheme: CustomTheme.instance.darkTheme,
      themeMode: ThemeService.instance.getThemeMode(),
    );
  }
}
