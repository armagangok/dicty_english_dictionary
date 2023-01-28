abstract class LocalService {
  Future<void> saveWord(String word);

  Future<dynamic> fetchWord();

  Future<void> updateWord();

  Future<void> deleteWord(int index);
}
