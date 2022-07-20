import 'package:english_accent_dictionary/core/remote/api/models/word_model.dart';

class DummyApiService {
  Future<WordModel> fetchWord(String? text) async {
    await Future.delayed(const Duration(seconds: 2));
    return WordModel();
  }
}
