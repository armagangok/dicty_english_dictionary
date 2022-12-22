import 'package:english_accent_dictionary/data/model/word_model.dart';
import 'package:http/http.dart' as http;

import '../contract/word_service.dart';

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
  Future<String> getLanguage() {
    // TODO: implement getLanguage
    throw UnimplementedError();
  }

  @override
  Future<void> save(int index, WordModel value) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<void> setupLanguage() {
    // TODO: implement setupLanguage
    throw UnimplementedError();
  }
}
