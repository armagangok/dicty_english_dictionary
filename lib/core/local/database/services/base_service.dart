import '../models/word_hive_model.dart';

abstract class HiveBaseService {
  Future<void> addData(Word word);

  Future<void> deleteData(int index);

  Future<int> getLanguage();

  Word getData(int index);

  Future<void> setupLanguage();

  Future<void> saveLanguage(int index);
}
