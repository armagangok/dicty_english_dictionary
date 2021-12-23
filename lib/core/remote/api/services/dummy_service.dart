import '../models/word_model.dart';
import 'base_service.dart';

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
