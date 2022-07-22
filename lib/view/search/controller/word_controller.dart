// ignore_for_file: avoid_print

import '../../../feature/export/export.dart';


class WordController extends GetxController implements BaseWordController {
  Rx<dynamic> wordModel = Rx(null);

  final WordService _wordService = locator<WordService>();

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

  Future<dynamic> fetchWord(String text) async {
    // int checker = 0;

    if (text.isEmpty) {
      return null;
    } else {
      try {
        wordModel.value = await _wordService.fetchWord(text);

        if (wordModel.value != null) {
          for (Meaning element in wordModel.value!.meanings!) {
            switch (element.partOfSpeech) {
              case "noun":
                for (var element in element.definitions!) {
                  noun!.value.add(element);
                }
                break;

              case "verb":
                for (var element in element.definitions!) {
                  verb!.value.add(element);
                }
                break;

              case "interjection":
                for (var element in element.definitions!) {
                  interjection!.value.add(element);
                }
                break;

              case "pronoun":
                for (var element in element.definitions!) {
                  pronoun!.value.add(element);
                }
                break;

              case "articles":
                for (var element in element.definitions!) {
                  articles!.value.add(element);
                }
                break;

              case "adverb":
                for (var element in element.definitions!) {
                  adverb!.value.add(element);
                }
                break;

              case "preposition":
                for (var element in element.definitions!) {
                  preposition!.value.add(element);
                }
                break;

              case "adjective":
                for (var element in element.definitions!) {
                  adjective!.value.add(element);
                }
                break;

              default:
            }
          }
        }
      } catch (e) {
        print(e);
      }

      return wordModel.value;
    }
  }
}



      // if (word.value != null) {
      //   for (var element in _wordViewModel.getAll()) {
      //     if (element.word == word.value!.word) {
      //       checker++;
      //     }
      //   }

      //   checker == 0
      //       ? {
      //           // await _wordViewModel.addData(
      //           //   HiveWord(
      //           //     word: word.value!.word,
      //           //     origin: word.value!.origin,
      //           //     meaning1: word.value!.meaning1,
      //           //     meaning2: word.value!.meaning2,
      //           //     example: word.value!.example,
      //           //   ),
      //           // )
      //         }
      //       : {};
      // }