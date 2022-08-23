


import '../../../global/export/export.dart';


class Injection {
  Injection._();
  static final instance = Injection._();

  final locator = GetIt.instance;

  void setupLocator() {
    locator.registerLazySingleton<TabBarController>(() => TabBarController());
    locator.registerLazySingleton<AccentController>(() => AccentController());
    locator.registerLazySingleton<WordService>(() => WordService.instance);
    locator.registerLazySingleton<TextController>(() => TextController.instance);
    locator.registerLazySingleton<WordOfTheDayController>(() => WordOfTheDayController.instance);
    locator.registerLazySingleton<SearchController>(() => SearchController.instance);
    locator.registerLazySingleton<ThemeController>(() => ThemeController());
    locator.registerLazySingleton<HiveController>(() => HiveController.instance);
    locator.registerLazySingleton<RecentController>(() => RecentController.instance);
  }
}
