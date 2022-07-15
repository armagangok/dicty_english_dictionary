import 'dart:convert';

import 'package:english_accent_dictionary/feature/export/export.dart';
import 'package:http/http.dart' as http;

import 'base_service.dart';

class WordService implements Base {
  @override
  Future<WordModel?> fetchWord(String text) async {
    final response = await http.get(
      Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$text'),
    );
    if (response.statusCode == 200) {
      return WordModel.fromJson(jsonDecode(response.body));
    } else {
      Get.snackbar(
        "",
        jsonDecode(response.body)["message"],
      );
      return null;
    }
  }
}
