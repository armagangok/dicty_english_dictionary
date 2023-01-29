import 'package:english_accent_dictionary/features/recent_search/presentation/pages/recent_detail_page.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/recent_search/presentation/pages/recent_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../global/export/export.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._();
  static NavigationRoute get instance => _instance;
  NavigationRoute._();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case KRoute.HOME_PAGE:
        return _getRoute(const HomePage());

      case KRoute.ABOUT_ME_PAGE:
        return _getRoute(const AboutMeView());

      // case KRoute.RECENT_DETAIL_PAGE:
      //   return _getRoute(
      //     RecentDetailPage(
      //       wordModel: WordResponse(word: "word", phonetics: phonetics, meanings: meanings, license: license, sourceUrls: sourceUrls),
      //     ),
      //   );

      case KRoute.RECENT_PAGE:
        return _getRoute(const RecentPage());

      case KRoute.SEARCH_RESULT_PAGE:
        return _getRoute(const SearchPage());

      case KRoute.WORD_OF_THE_DAY_PAGE:
        return _getRoute(const WordOfDayPage());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text("Not Found."),
          ),
        );
    }
  }

  PageRoute _getRoute(Widget page) =>
      MaterialPageRoute(builder: (context) => page);
}
