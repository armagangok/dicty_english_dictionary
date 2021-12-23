class WordModel {
  String? word;
  String? origin;
  String? meaning1;
  String? meaning2;
  String? example;

  WordModel({
    this.word,
    this.origin,
    this.meaning1,
    this.meaning2,
    this.example,
  });

  factory WordModel.fromJson(List<dynamic> json) {
    return WordModel(
      word: json[0]["word"],
      origin: json[0]["origin"] ?? "No Data",
      meaning1: json[0]["meanings"][0]["definitions"][0]["definition"],
      meaning2: json[0]["meanings"][0]["definitions"].length > 1
          ? json[0]["meanings"][0]["definitions"][1]["definition"]
          : "No Data",
      example: json[0]["meanings"][0]["definitions"][0]["example"] ?? "No Data",
    );
  }
}
