import 'package:hive/hive.dart';
import 'package:wordmind/models/words.dart';

void addData(Word word) async {
  await Hive.openBox("words");
  final box = Hive.box('words');
  box.add(word);
}

void deleteAt(index) async {
  final wordBox = Hive.box("words");
  await wordBox.deleteAt(index);
}

void saveTime(int currentValue) async {
  await Hive.openBox("timeBox");
  final Box box = Hive.box("timeBox");
  await box.clear();
  await box.add(currentValue);
}

void saveLanguage(String countryName) async {
  await Hive.openBox("countryBox");
  final box = Hive.box("countryBox");
  await box.clear();
  await box.add(countryName);
}

Future<String> getCountry() async {
  await Hive.openBox("countryBox");
  final Box box = Hive.box("countryBox");
  final String language = box.getAt(0);
  return language;
}

Future<int> getTime() async {
  await Hive.openBox("timeBox");
  final Box box = Hive.box("timeBox");
  final int timeData = box.getAt(0);
  return timeData;
}

String getData(int index) {
  final wordBox = Hive.box("words");
  final data = wordBox.getAt(index) as Word;
  return data.word;
}

Future<void> putData(int index, Word data) async {
  final Box wordBox = Hive.box("words");
  await wordBox.putAt(index, data.word);
}
