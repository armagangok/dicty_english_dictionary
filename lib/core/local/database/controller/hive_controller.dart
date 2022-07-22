// import 'package:english_accent_dictionary/core/local/database/services/hive_service.dart';
// import 'package:english_accent_dictionary/core/remote/api/models/word_model.dart';

// import '../../../../feature/export/export.dart';

// class HiveController {
//   HiveController._();
//   static final instance = HiveController._();

//   List<WordModel> get wordList => [];

//   Future<void> addData(WordModel word) async {
//     await HiveService.instance.addData(word);
//   }

//   Future<void> deleteData(int index) async {
//     await HiveService.instance.deleteData(index);
//   }

//   WordModel? getData(int index) {
//     return HiveService.instance.getData(index);
//   }

//   Future<int> getLanguage() async {
//     try {
//       return await HiveService.instance.getLanguage();
//     } catch (e) {
//       debugPrint("$e");
//       return 1;
//     }
//   }

//   Future<void> saveLanguage(int index) async {
//     try {
//       await HiveService.instance.saveLanguage(index);
//       await setLanguage(index);
//     } catch (e) {
//       debugPrint("$e");
//     }
//   }

  // List<WordModel> getAll() {
  //   for (WordModel word in Hive.box("words").values) {
  //     wordList.add(word);
  //   }

//     return wordList;
//   }
// }
