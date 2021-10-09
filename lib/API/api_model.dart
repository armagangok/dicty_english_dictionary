import 'dart:convert';
import 'package:http/http.dart' as http;

class WordApi {
  final String? word;
  String? origin = "";
  final String? meaning1;
  final String? meaning2;
  String? example = "";

  WordApi({
    this.word,
    this.origin,
    this.meaning1,
    this.meaning2,
    this.example,
  });

  factory WordApi.fromJson(List<dynamic> json) {
    return WordApi(
      word: json[0]["word"],
      origin: json[0]["origin"],
      meaning1: json[0]?["meanings"]?[0]["definitions"]?[0]["definition"],
      meaning2: json[0]["meanings"][0]["definitions"].length > 1
          ? json[0]["meanings"][0]["definitions"][1]["definition"]
          : "",
      example: json[0]?["meanings"]?[0]["definitions"]?[0]["example"],
    );
  }
}

Future<WordApi> fetchWord(text) async {
  final response = await http
      .get(Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$text'));

  if (response.statusCode == 200) {
    return WordApi.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load. ${response.body}');
  }
}
