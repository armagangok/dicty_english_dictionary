import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../feature/export/export.dart';
import '../models/word_model.dart';

class WordService {
  Future<WordModel?> fetchWord(String text) async {
    final response = await http.get(
      Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$text'),
    );
    if (response.statusCode == 200) {
      var a = (WordModel.fromMap(jsonDecode(response.body)[0]));
      // List<Meaning>? meanings = a.meanings;
      // List<Definition>? definitions = [];
      // for (var element in meanings!) {
      //   definitions = element.definitions;
      // }

      // for (var element in definitions!) {
      //   print(element.definition);
      // }

      // MyModel.fromJson(response.body);

      return a;
    } else {
      Get.snackbar(
        "",
        jsonDecode(response.body)["message"],
      );
      return null;
    }
  }
}
