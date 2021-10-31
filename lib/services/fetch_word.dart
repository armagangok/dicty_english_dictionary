import 'dart:convert';
import 'package:http/http.dart' as http;
import '../API/models/word_api_model.dart';


Future<WordApi> fetchWord(text) async {
  final response = await http
      .get(Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$text'));

  if (response.statusCode == 200) {
    return WordApi.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load. ${response.body}');
  }
}
