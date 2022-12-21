import '../model/word_model.dart';

abstract class WordService {
  Future fetchWord({required String word});
  Future<void> deleteWord(int index);

  Future<int> getLanguage();

  Future<void> setupLanguage();

  Future<void> deleteByName(WordModel wordModel);

  Future<void> save(int index, WordModel value);

  Future<void> deleteAllWords();
}
