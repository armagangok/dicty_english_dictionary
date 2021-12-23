import '../models/word_model.dart';

abstract class Base {
  Future<WordModel> fetchData(String? text);
}
