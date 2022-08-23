part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const wordOfTheDay = _Paths.wordOfTheDay;
  static const recent = _Paths.recent;
  static const zodiacDetail = _Paths.searchResult;
  static const aboutMe = _Paths.aboutMe;
}

abstract class _Paths {
  _Paths._();
  static const home = '/home';
  static const aboutMe = '/aboutMe';
  static const recent = '/recent';
  static const searchResult = '/searchResult';
  static const wordOfTheDay = '/wordOfTheDay';
}
