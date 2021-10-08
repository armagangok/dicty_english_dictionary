import 'package:hive/hive.dart';
import 'package:wordmind/app/database/words.dart';

class HiveHelper {
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

  Future<void> saveTime(int currentValue) async {
    await Hive.openBox("timeBox");
    final Box box = Hive.box("timeBox");
    await box.clear();
    await box.add(currentValue);
  }

  Future<void> saveLanguage(String countryName) async {
    await Hive.openBox("countryBox");
    final box = Hive.box("countryBox");
    await box.clear();
    await box.add(countryName);
  }

  Future<String> getLanguage() async {
    await Hive.openBox("countryBox");
    final Box box = Hive.box("countryBox");
    final String language = await box.getAt(0);
    return language;
  }

  Future<int> getTime() async {
    await Hive.openBox("timeBox");
    final Box box = Hive.box("timeBox");
    final int timeData = await box.getAt(0);
    return timeData;
  }

  Future<String> getData(int index) async {
    await Hive.openBox("words");
    final wordBox = Hive.box("words");
    final data = wordBox.getAt(index) as Word;
    return data.word;
  }

  Future<void> putData(int index, Word data) async {
    final Box wordBox = Hive.box("words");
    await wordBox.putAt(index, data.word);
  }

  Future<void> setTimeToTimeBox() async {
    await Hive.openBox("timeBox");
    final Box box = Hive.box("timeBox");
    await box.add(10);
  }

  Future<void> setLangToLanguageBox() async {
    await Hive.openBox("countryBox");
    final Box box = Hive.box("countryBox");
    await box.add("English-UK");
  }
}
