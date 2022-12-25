import '../model/word_model.dart';

abstract class WordService {
  Future fetchWord({required String word});
  Future<void> deleteWord(int index);

  Future<int> getAccent();

  Future<void> setupAccent();

  Future<void> deleteByName(WordModel wordModel);

  Future<void> saveWord(WordModel wordModel);

  Future<void> updateWord({
    required int index,
    required WordModel wordModel,
  });

  Future<void> deleteAllWords();

  Future<void> saveAccent({required int accent});
}
