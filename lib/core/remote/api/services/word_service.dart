import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../feature/export/export.dart';
import '../model/model.dart';

class WordService {
  WordService._();
  static final instance = WordService._();

  Future<dynamic> fetchWord(String text) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$text'),
      );

      if (response.statusCode == 200) {
        var model = (WordModel.fromMap(jsonDecode(response.body)[0]));

        return model;
      } else if (response.statusCode == 404) {
        var decodedErrorMessage = (jsonDecode(response.body));
        final ErrorModel errorModel = ErrorModel(
          title: decodedErrorMessage["title"],
          message: decodedErrorMessage["message"],
        );

        return errorModel;
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
