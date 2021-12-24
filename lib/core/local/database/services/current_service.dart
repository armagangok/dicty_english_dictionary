import 'package:english_accent_dictionary/core/local/database/models/word_hive_model.dart';
import 'package:hive/hive.dart';

import 'base_service.dart';

class CurrentDatabaseService implements HiveBaseService {
  String content = "String";

  @override
  Future<void> addData(Word word) async => await Hive.box("words").add(word);

  @override
  Future<void> deleteData(index) async =>
      await Hive.box("words").deleteAt(index);

  @override
  Future<int> getLanguage() async {
    final Box box = Hive.box("countryBox");
    final int index = await box.getAt(0);
    return index;
  }

  @override
  Future<Word> getData(int index) async =>
      await Hive.box("words").getAt(index) as Word;

  @override
  Future<void> setupLanguage() async =>
      await Hive.box("countryBox").add("English-GB");

  @override
  Future<void> saveLanguage(int index) async {
    await Hive.box("countryBox").clear();
    await Hive.box("countryBox").add(index);
  }
}
