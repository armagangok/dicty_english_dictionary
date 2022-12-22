import 'package:flutter/material.dart';

import '../../global/export/export.dart';
import 'constant/routes.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case KRoute.HOME_PAGE:
        return _getRoute(const HomeView());

      case KRoute.ABOUT_ME_PAGE:
        return _getRoute(const AboutMeView());

      case KRoute.RECENT_DETAIL_PAGE:
        return _getRoute(
          RecentDetailWiew(
            wordModel: WordModel(
              word: "",
              // origin: "",
              phonetics: [],
              meanings: [],
              license: License(name: "", url: ""),
              sourceUrls: [],
            ),
          ),
        );

      case KRoute.RECENT_PAGE:
        return _getRoute(const RecentView());

      case KRoute.SEARCH_RESULT_PAGE:
        return _getRoute(const SearchResultView());

      case KRoute.WORD_OF_THE_DAY_PAGE:
        return _getRoute(const WordOfDayView());

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
