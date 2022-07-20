// ignore_for_file: avoid_print

import '../../../../feature/export/export.dart';
import '../../../locator/locator.dart';
import '../models/word_model.dart';
import '../services/word_service.dart';

class WordController {
  final WordService _wordService = locator<WordService>();
  final WordViewModel _wordViewModel = WordViewModel();

  Rx<WordModel?> word = Rx(null);

  Future<WordModel?> fetchDailyWord(String word) async {
    return await _wordService.fetchWord(word);
  }

  Future<dynamic> fetchWord(String text) async {
    int checker = 0;

    if (text.isEmpty) {
      return null;
    } else {
      word.value = await _wordService.fetchWord(text);

      if (word.value != null) {
        for (var element in _wordViewModel.getAll()) {
          if (element.word == word.value!.word) {
            checker++;
          }
        }

        checker == 0
            ? {
                // await _wordViewModel.addData(
                //   HiveWord(
                //     word: word.value!.word,
                //     origin: word.value!.origin,
                //     meaning1: word.value!.meaning1,
                //     meaning2: word.value!.meaning2,
                //     example: word.value!.example,
                //   ),
                // )
              }
            : {};
      }

      return word.value;
    }
  }

  // Future<void> getWord(String word) async {
  //   var a = await NetworkManager.instance!.dioGet(
  //     'https://api.dictionaryapi.dev/api/v2/entries/en/$word',
  //     MyWordModel(),
  //   );
  // }
}
