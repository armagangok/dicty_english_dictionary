import '../model/word_model.dart';

abstract class WordService {
  Future fetchWord({required String word});
  Future<void> deleteWord(int index);

  Future<int> getAccent();

  Future<void> setupAccent();

  Future<void> deleteByName(WordModel wordModel);

  // Future<void> save(int index, WordModel value);

  Future<void> deleteAllWords();

  Future<void> saveAccent({required int accent});
}
