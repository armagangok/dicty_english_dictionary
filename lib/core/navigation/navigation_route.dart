import 'package:flutter/material.dart';


import '../../data/model/word_model.dart';
import '../../feature/about_me/about_me_view.dart';
import '../../feature/home/home_view.dart';
import '../../feature/recent/recent_detail_view.dart';
import '../../feature/recent/recent_view.dart';
import '../../feature/search_result/search_result_view.dart';
import '../../feature/word_of_the_day/word_of_the_day_view.dart';
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
            wordModel: WordModel(),
          ),
        );

      case KRoute.RECENT_PAGE:
        return _getRoute(const RecentView());

      case KRoute.SEARCH_RESULT_PAGE:
        return _getRoute(SearchResultView());

      case KRoute.WORD_OF_THE_DAY_PAGE:
        return _getRoute(WordOfTheDayView());

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
