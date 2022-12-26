import '../../../global/export/export.dart';

class HiveBoxes {
  HiveBoxes._();

  static final Box<WordModel> wordBox = Hive.box(HiveKeys.wordBox);
}

class HiveKeys {
  static const String countryBox = "countryBox";
  static const String wordBox = "hiveWords";
  static const String themeBox = "themeBox";
  HiveKeys._();
}
