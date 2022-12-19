import 'package:http/http.dart' as http;

import '../contract/word_service.dart';

class WordServiceImp implements WordService {
  WordServiceImp._();
  static final instance = WordServiceImp._();

  @override
  Future<dynamic> fetchWord({required String word}) async {
    final response = await http.get(
      Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word'),
    );

    return response;
  }
}
