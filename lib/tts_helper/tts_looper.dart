// import 'package:hive/hive.dart';
// import 'package:wordmind/database/words.dart';
// import 'text_to_speech_helper.dart';

// void loop(int minute) async {
//   await Hive.openBox("words");
//   final box = Hive.box("words");

//   for (var i = 0; i < box.length; i++) {
//     final data = box.getAt(i) as Word;
//     await Future.delayed(
//       Duration(seconds: minute),
//       () {
//         // speak(
//         //   "words is ready. ${data.word} means that; ${data.meaning1}. Another meaning is; ${data.meaning2}",
//         // );
//       },
//     );
//   }
// }
