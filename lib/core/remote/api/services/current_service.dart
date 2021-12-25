import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/word_model.dart';
import 'base_service.dart';

class CurrentApiService implements Base {
  @override
  Future<WordModel?> fetchData(String text) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$text'),
      );
      if (response.statusCode == 200) {
        return WordModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load. ${response.body}');
      }
    } catch (e) {
      print("$e");
      return null;
    }
  }
}
