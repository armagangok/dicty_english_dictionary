import '../../../global/export/export.dart';

class HiveBoxes {
  HiveBoxes._();

  static final wordBox = Hive.box<String>(HiveKeys.wordBox);
}

class HiveKeys {
  static const String countryBox = "countryBox";
  static const String wordBox = "hiveWords";
  static const String themeBox = "themeBox";
  HiveKeys._();
}
