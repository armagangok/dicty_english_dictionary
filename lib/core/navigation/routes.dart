// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.ABOUT_US;
  static const FIND = _Paths.WORD_OF_DAY;
  static const PERSONAL = _Paths.RECENT;
  static const ZODIAC_DETAIL = _Paths.SEARCH_RESULT;
  static const HOME = _Paths.HOME;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const ABOUT_US = '/aboutUs';
  static const RECENT = '/recent';
  static const SEARCH_RESULT = '/searchResult';
  static const WORD_OF_DAY = '/wordOfTheDay';
}
