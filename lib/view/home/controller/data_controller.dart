import 'dart:convert';

import 'package:intl/intl.dart';

import '../../../feature/export/export.dart';

class DataController extends GetxController implements BaseWordController {
  final WordService _wordService = WordService.instance;
  Rx<dynamic> wordModel = Rx(null);

  @override
  RxList<Definition>? noun = RxList([]);
  @override
  RxList<Definition>? verb = RxList([]);
  @override
  RxList<Definition>? interjection = RxList([]);
  @override
  RxList<Definition>? pronoun = RxList([]);
  @override
  RxList<Definition>? articles = RxList([]);
  @override
  RxList<Definition>? adverb = RxList([]);
  @override
  RxList<Definition>? preposition = RxList([]);
  @override
  RxList<Definition>? adjective = RxList([]);

  @override
  void onInit() async {
    try {
      wordModel.value = await fetchWord(await getDatedWord());
    } on PlatformException catch (e) {
      Get.showSnackbar(GetSnackBar(messageText: Text("${e.message}")));
    }

    super.onInit();
  }

  @override
  void onReady() {
    wordModel.value ??= 0;
    super.onReady();
  }

  Future<dynamic> fetchWord(String text) async {
    if (text.isEmpty) {
      return null;
    } else {
      wordModel.value = await _wordService.fetchWord(text);

      for (Meaning element in wordModel.value!.meanings!) {
        switch (element.partOfSpeech) {
          case "noun":
            for (var element in element.definitions!) {
              noun!.add(element);
            }
            break;

          case "verb":
            for (var element in element.definitions!) {
              verb!.add(element);
            }
            break;

          case "interjection":
            for (var element in element.definitions!) {
              interjection!.add(element);
            }
            break;

          case "pronoun":
            for (var element in element.definitions!) {
              pronoun!.add(element);
            }
            break;

          case "articles":
            for (var element in element.definitions!) {
              articles!.add(element);
            }
            break;

          case "adverb":
            for (var element in element.definitions!) {
              adverb!.add(element);
            }
            break;

          case "preposition":
            for (var element in element.definitions!) {
              preposition!.add(element);
            }
            break;

          case "adjective":
            for (var element in element.definitions!) {
              adjective!.add(element);
            }
            break;

          default:
        }
      }

      return wordModel.value;
    }
  }

  // String getDatedWord() {
  //   var now = DateTime.now();
  //   var formatter = DateFormat('yyyy-MM-dd');
  //   return map[formatter.format(now)]!;
  // }

  Future<String> getDatedWord() async {
    final String response =
        await rootBundle.loadString('assets/data/data.json');
    final data = await json.decode(response);

    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');

    return data[formatter.format(now)];
  }
}
