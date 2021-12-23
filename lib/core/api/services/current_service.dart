import 'dart:convert';
import 'package:english_accent_dictionary/core/api/services/base_service.dart';
import 'package:http/http.dart' as http;
import '../models/word_model.dart';


class CurrentService implements Base {
  @override
  Future<WordModel> fetchData(String? text) async {
    final response = await http.get(
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$text'));

    if (response.statusCode == 200) {
      return WordModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load. ${response.body}');
    }
  }
}
