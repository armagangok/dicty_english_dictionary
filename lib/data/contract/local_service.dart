abstract class LocalService {
  Future<void> saveWord(String word);

  Future<dynamic> fetchWord();

  Future<void> updateWord(String word, int index);

  Future<void> deleteWord(int index);
}
