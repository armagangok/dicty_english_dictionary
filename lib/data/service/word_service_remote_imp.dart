import 'package:http/http.dart' as http;

import '../contract/word_service.dart';
import '../model/word_model.dart';

class WordServiceRemoteImp implements WordService {
  @override
  Future<dynamic> fetchWord({required String word}) async {
    final response = await http.get(
      Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word'),
    );

    return response;
  }

  @override
  Future<void> deleteAllWords() {
    // TODO: implement deleteAllWords
    throw UnimplementedError();
  }

  @override
  Future<void> deleteByName(WordModel wordModel) {
    // TODO: implement deleteByName
    throw UnimplementedError();
  }

  @override
  Future<void> deleteWord(int index) {
    // TODO: implement deleteWord
    throw UnimplementedError();
  }

  @override
  Future<int> getAccent() {
    // TODO: implement getLanguage
    throw UnimplementedError();
  }

  @override
  Future<void> saveWord(WordModel value) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<void> setupAccent() {
    // TODO: implement setupLanguage
    throw UnimplementedError();
  }

  @override
  Future<void> saveAccent({required int accent}) {
    // TODO: implement saveAccent
    throw UnimplementedError();
  }

  @override
  Future<void> updateWord({
    required int index,
    required WordModel wordModel,
  }) {
    // TODO: implement updateWord
    throw UnimplementedError();
  }
}
