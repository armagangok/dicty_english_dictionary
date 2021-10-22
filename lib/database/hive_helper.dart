import 'package:hive/hive.dart';
import './words.dart';

HiveHelper hiveHelper = HiveHelper();

class HiveHelper {
  static final HiveHelper _singleton = HiveHelper._internal();
  String content = "String";

  factory HiveHelper() {
    return _singleton;
  }

  HiveHelper._internal();

  Future<void> addData(Word word) async {
    await Hive.openBox("words");
    final wordBox = Hive.box('words');
    wordBox.add(word);
  }

  Future<void> deleteData(index) async {
    await Hive.openBox("words");
    final wordBox = Hive.box("words");
    await wordBox.deleteAt(index);
  }

  Future<String> getLanguage() async {
    await Hive.openBox("countryBox");
    final Box box = Hive.box("countryBox");
    final String language = await box.getAt(0);
    return language;
  }

  Future<Word> getData(int index) async {
    await Hive.openBox("words");
    final wordBox = Hive.box("words");
    final data = wordBox.getAt(index) as Word;
    return data;
  }

  Future<void> putData(int index, Word data) async {
    final Box wordBox = Hive.box("words");
    await wordBox.putAt(index, data.word);
  }

  Future<void> setupLanguage() async {
    await Hive.openBox("countryBox");
    final Box box = Hive.box("countryBox");
    await box.add("English-UK");
  }

  Future<void> saveLanguage(String countryName) async {
    await Hive.openBox("countryBox");
    final box = Hive.box("countryBox");
    await box.clear();
    await box.add(countryName);
  }
}
