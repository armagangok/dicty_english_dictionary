// ignore_for_file: avoid_print

import 'package:get/state_manager.dart';

import '../../../../feature/export/export.dart';
import '../../../locator/locator.dart';
import '../services/base_service.dart';
import '../services/word_service.dart';

class WordController implements Base {
  final WordService _wordService = locator<WordService>();
  final WordViewModel _wordViewModel = WordViewModel();

  Rx<WordModel?> word = Rx(null);

  Future<WordModel?> fetchDaiyWord(String word) async {
    return await _wordService.fetchWord(word);
  }

  @override
  Future<dynamic> fetchWord(String text) async {
    int checker = 0;
    try {
      if (text.isEmpty) {
        return null;
      } else {
        word.value = await _wordService.fetchWord(text);

        if (word.value == null) {
          return 0.obs;
        } else {
          for (var element in _wordViewModel.getAll()) {
            if (element.word == word.value!.word) {
              print("${element.word}  ${word.value!.word} ");
              checker++;
            }

            print("${element.word}  ${word.value!.word} ");
          }
          print(checker);

          checker == 0
              ? await _wordViewModel.addData(
                  HiveWord(
                    word: word.value!.word,
                    origin: word.value!.origin,
                    meaning1: word.value!.meaning1,
                    meaning2: word.value!.meaning2,
                    example: word.value!.example,
                  ),
                )
              : {};

          return word.value;
        }
      }
    } catch (e) {
      debugPrint("ERROR IN VIEWMODEL --> $e");
      return word.value;
    }
  }
}
