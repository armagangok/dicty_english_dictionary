
import 'package:english_accent_dictionary/core/local/database/models/word_hive_model.dart';

import 'base_service.dart';

class DatabaseDummyService implements HiveBaseService {
  @override
  Future<void> addData(Word word) {
    // TODO: implement addData
    throw UnimplementedError();
  }

  @override
  Future<void> deleteData(index) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<Word> getData(int index) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<int> getLanguage() {
    // TODO: implement getLanguage
    throw UnimplementedError();
  }

  @override
  Future<void> saveLanguage(int index) {
    // TODO: implement saveLanguage
    throw UnimplementedError();
  }

  @override
  Future<void> setupLanguage() {
    // TODO: implement setupLanguage
    throw UnimplementedError();
  }
}
