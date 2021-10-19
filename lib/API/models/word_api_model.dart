class WordApi {
  String? word = "";
  String? origin = "";
  String? meaning1 = "";
  String? meaning2 = "";
  String? example = "";

  WordApi({this.word, this.origin, this.meaning1, this.meaning2, this.example});

  factory WordApi.fromJson(List<dynamic> json) {
    return WordApi(
        word: json[0]["word"],
        origin: json[0]["origin"],
        meaning1: json[0]["meanings"][0]["definitions"][0]["definition"],
        meaning2: json[0]["meanings"][0]["definitions"].length > 1
            ? json[0]["meanings"][0]["definitions"][1]["definition"]
            : "None",
        example: json[0]["meanings"][0]["definitions"][0]["example"]);
  }
}
