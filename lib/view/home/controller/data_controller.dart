import 'package:english_accent_dictionary/core/remote/api/controller/x_controller.dart';
import 'package:english_accent_dictionary/core/remote/api/models/meaning.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../core/remote/api/models/definition.dart';
import '../../../core/remote/api/services/word_service.dart';
import '../../../feature/data/data.dart';
import '../../../feature/export/export.dart';

class DataController extends GetxController implements XController {
  final WordService _wordService = WordService();
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
      wordModel.value = await fetchWord(getDatedWord());
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
    // int checker = 0;

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

      print(noun);
      print(verb);
      print(interjection);

      return wordModel.value;
    }
  }

  String getDatedWord() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    return map[formatter.format(now)]!;
  }
}
