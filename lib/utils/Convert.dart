import 'dart:convert' show json;

AnneData anneDataFromJson(String str) => AnneData.fromJson(json.decode(str));
String anneDataToJson(AnneData data) => json.encode(data.toJson());

class AnneData {
  AnneData({
    required this.word,
  });

  String word;

  factory AnneData.fromJson(Map<String, dynamic> json) => AnneData(
        word: json["word"],
      );

  Map<String, dynamic> toJson() => {
        "words": [],
      };
}
