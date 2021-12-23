import 'package:english_accent_dictionary/core/api/models/word_model.dart';
import 'package:english_accent_dictionary/core/api/services/base_service.dart';

class DummyService implements Base {
  @override
  Future<WordModel> fetchData(String? text) async {
    await Future.delayed(const Duration(seconds: 2));
    return WordModel(
      word: "test",
      meaning1: "test",
      meaning2: "test",
      origin: "test",
      example: "test",
    );
  }
}
