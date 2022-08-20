import '../../feature/export/export.dart';
import '../../view/about_us/about_us_view.dart';
import '../../view/home/home_view.dart';
import '../../view/recent/recent_view.dart';
import '../../view/search_result/search_result_view.dart';
import '../../view/word_of_the_day/word_of_the_day_view.dart';

part 'routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.RECENT,
      page: () => RecentView(),
    ),
    GetPage(
      name: _Paths.WORD_OF_DAY,
      page: () => const WordOfTheDayView(),
    ),
    GetPage(
      name: _Paths.SEARCH_RESULT,
      page: () => SearchResultView(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => const AboutUsView(),
    ),
  ];
}
