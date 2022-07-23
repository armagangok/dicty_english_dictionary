// import 'package:english_accent_dictionary/core/local/database/services/hive_service.dart';
// import 'package:get/get_state_manager/src/simple/list_notifier.dart';
// import 'package:english_accent_dictionary/core/remote/api/models/word_model.dart';

// import '../../../../feature/export/export.dart';

// class HiveController extends HiveService {


//   @override
//   RxList<Definition>? adjective;
//   @override
//   RxList<Definition>? adverb;
//   @override
//   RxList<Definition>? articles;
//   @override
//   RxList<Definition>? interjection;
//   @override
//   RxList<Definition>? noun;
//   @override
//   RxList<Definition>? preposition;
//   @override
//   RxList<Definition>? pronoun;
//   @override
//   RxList<Definition>? verb;

//   late final Box _hiveWords;
//   Box get getHiveWords => _hiveWords;

//   Future<void> initializeHive() async {
//     await Hive.initFlutter();
//     Hive.registerAdapter(WordModelAdapter());
//     Hive.registerAdapter(DefinitionAdapter());
//     Hive.registerAdapter(LicenseAdapter());
//     Hive.registerAdapter(MeaningAdapter());
//     Hive.registerAdapter(PhoneticAdapter());

//     _hiveWords = await Hive.openBox<WordModel>("hiveWords");
//     await Hive.openBox("countryBox");
//   }

//   Future<void> addData(WordModel word) async {
//     await _hiveWords.add(word);
//   }

//   List<WordModel> getAll() {
//     List<WordModel> wordList = [];
//     for (WordModel word in _hiveWords.values) {
//       wordList.add(word);
//     }

//     return wordList;
//   }

//   Future<void> deleteData(index) async {
//     await _hiveWords.deleteAt(index);
//   }

//   WordModel getData(int index) {
//     return _hiveWords.getAt(index) as WordModel;
//   }

//   Future<int> getLanguage() async {
//     final Box box = Hive.box("countryBox");
//     final int index = await box.getAt(0);
//     return index;
//   }

//   Future<void> setupLanguage() async =>
//       await Hive.box("countryBox").add("English-GB");

//   Future<void> saveLanguage(int index) async {
//     await Hive.box("countryBox").clear();
//     await Hive.box("countryBox").add(index);
//   }

//   Future<dynamic> fetchWord(String text) async {
//     // int checker = 0;

//     if (text.isEmpty) {
//       return null;
//     } else {
//       wordModel = await HiveService.instance.fetchWord(text);

//       for (Meaning element in wordModel.value!.meanings!) {
//         switch (element.partOfSpeech) {
//           case "noun":
//             for (var element in element.definitions!) {
//               noun!.add(element);
//             }
//             break;

//           case "verb":
//             for (var element in element.definitions!) {
//               verb!.add(element);
//             }
//             break;

//           case "interjection":
//             for (var element in element.definitions!) {
//               interjection!.add(element);
//             }
//             break;

//           case "pronoun":
//             for (var element in element.definitions!) {
//               pronoun!.add(element);
//             }
//             break;

//           case "articles":
//             for (var element in element.definitions!) {
//               articles!.add(element);
//             }
//             break;

//           case "adverb":
//             for (var element in element.definitions!) {
//               adverb!.add(element);
//             }
//             break;

//           case "preposition":
//             for (var element in element.definitions!) {
//               preposition!.add(element);
//             }
//             break;

//           case "adjective":
//             for (var element in element.definitions!) {
//               adjective!.add(element);
//             }
//             break;

//           default:
//         }
//       }

//       return wordModel.value;
//     }
//   }


  
// }
