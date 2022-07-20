// class WordModel {
//   String? word;
//   String? origin;
//   String? meaning1;
//   String? meaning2;
//   String? example;

//   WordModel({
//     this.word,
//     this.origin,
//     this.meaning1,
//     this.meaning2,
//     this.example,
//   });

//   // @override
//   // Map<dynamic, dynamic> toJson() {
//   //   return _$TestModelToJson(this);
//   // }

//   // @override
//   // WordModel fromJson(Map<dynamic, dynamic> json) {
//   //   return _$TestModelFromJson(json);
//   // }

//   factory WordModel.fromJson(List<dynamic> json) {
//     return WordModel(
//       word: json[0]["word"],
//       origin: json[0]["origin"] ?? "Origin not found in the search.",
//       meaning1: json[0]["meanings"][0]["definitions"][0]["definition"] ??
//           "Meaning not found.",
//       meaning2: json[0]["meanings"][0]["definitions"].length > 1
//           ? json[0]["meanings"][0]["definitions"][1]["definition"]
//           : "Alternative meaning not found.",
//       example: json[0]["meanings"][0]["definitions"][0]["example"] ??
//           "Example sentence not found in the search.",
//     );
//   }
// }
