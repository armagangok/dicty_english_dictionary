import 'package:english_accent_dictionary/core/remote/api/services/word_service.dart';
import 'package:get_it/get_it.dart';

import '../../../feature/controller/hive_controller.dart';
import '../../../feature/controller/tab_controller.dart';
import '../../../view/home/controller/accent_controller.dart';
import '../../../view/home/controller/text_controller.dart';
import '../../../view/home/controller/theme_controller.dart';
import '../../../view/recent/controller/recent_controller.dart';
import '../../../view/search_result/search_controller.dart/search_controller.dart';
import '../../../view/word_of_the_day/controller/word_of_the_day_controller.dart';

class Injection {
  Injection._();
  static final instance = Injection._();

  final locator = GetIt.instance;
  

  void setupLocator() {
    locator.registerLazySingleton<TabBarController>(() => TabBarController());
    locator.registerLazySingleton<AccentController>(() => AccentController());
    locator.registerLazySingleton<WordService>(() => WordService.instance);
    locator
        .registerLazySingleton<TextController>(() => TextController.instance);
    locator.registerLazySingleton<WordOfTheDayController>(
        () => WordOfTheDayController.instance);
    locator.registerLazySingleton<SearchController>(
        () => SearchController.instance);
    locator.registerLazySingleton<ThemeController>(() => ThemeController());
    locator
        .registerLazySingleton<HiveController>(() => HiveController.instance);
    locator.registerLazySingleton<RecentController>(
        () => RecentController.instance);
  }
}
