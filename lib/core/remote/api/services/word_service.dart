import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../feature/export/export.dart';
import '../../../../feature/model/word_model.dart';


class WordService {
  WordService._();
  static final instance = WordService._();
  Future<WordModel?> fetchWord(String text) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$text'),
      );

      if (response.statusCode == 200) {
        var a = (WordModel.fromMap(jsonDecode(response.body)[0]));

        return a;
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      Get.snackbar(
        "Warning",
        e.message!,
        duration: const Duration(seconds: 5),
      );
    }
    return null;
  }
}
