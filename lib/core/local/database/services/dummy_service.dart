import 'package:english_accent_dictionary/core/local/database/models/word_hive_model.dart';

import 'base_service.dart';

class DatabaseDummyService implements HiveBaseService {
  @override
  Future<void> addData(Word word) async {}

  @override
  Future<void> deleteData(index) async {}

  @override
  Word getData(int index) {
    return Word(
      word: "word",
      origin: "origin",
      meaning1: "meaning1",
      meaning2: "meaning2",
      example: "example",
    );
  }

  @override
  Future<int> getLanguage() async {
    return 1;
  }

  @override
  Future<void> saveLanguage(int index) async {}

  @override
  Future<void> setupLanguage() async {}
}
