import 'package:hive/hive.dart';
import 'word_hive_model.dart';

HiveHelper hiveHelper = HiveHelper();

class HiveHelper {
  static final HiveHelper _singleton = HiveHelper._internal();
  String content = "String";

  factory HiveHelper() => _singleton;

  HiveHelper._internal();

  Future<void> addData(Word word) async => await Hive.box("words").add(word);

  Future<void> deleteData(index) async =>
      await Hive.box("words").deleteAt(index);

  Future<String> getLanguage() async {
    final Box box = Hive.box("countryBox");
    final String language = await box.getAt(0);
    return language;
  }

  Future<Word> getData(int index) async =>
      await Hive.box("words").getAt(index) as Word;

  Future<void> setupLanguage() async =>
      await Hive.box("countryBox").add("English-GB");

  Future<void> saveLanguage(String countryName) async {
    await Hive.box("countryBox").clear();
    await Hive.box("countryBox").add(countryName);
  }
}
