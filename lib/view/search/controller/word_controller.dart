// ignore_for_file: avoid_print

import '../../../core/local/database/services/hive_service.dart';
import '../../../core/remote/api/models/word_model.dart';
import '../../../feature/export/export.dart';

class WordController extends GetxController implements BaseWordController {
  WordController._();
  static final instance = WordController._();

  Rx<dynamic> wordModel = Rx(null);

  final WordService _wordService = WordService();

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
    int checker = 0;

    if (text.isEmpty) {
      return null;
    } else {
      try {
        wordModel.value = await _wordService.fetchWord(text);

        if (wordModel.value != null) {
          for (Meaning element in wordModel.value!.meanings!) {
            switch (element.partOfSpeech) {
              case "noun":
                noun!.clear();
                for (var element in element.definitions!) {
                  noun!.add(element);
                }
                break;

              case "verb":
                verb!.clear();
                for (var element in element.definitions!) {
                  verb!.add(element);
                }
                break;

              case "interjection":
                interjection!.clear();
                for (var element in element.definitions!) {
                  interjection!.add(element);
                }
                break;

              case "pronoun":
                pronoun!.clear();
                for (var element in element.definitions!) {
                  pronoun!.add(element);
                }
                break;

              case "articles":
                articles!.clear();
                for (var element in element.definitions!) {
                  articles!.add(element);
                }
                break;

              case "adverb":
                adverb!.clear();
                for (var element in element.definitions!) {
                  adverb!.add(element);
                }
                break;

              case "preposition":
                preposition!.clear();
                for (var element in element.definitions!) {
                  preposition!.value.add(element);
                }
                break;

              case "adjective":
                adjective!.clear();
                for (var element in element.definitions!) {
                  adjective!.value.add(element);
                }
                break;

              default:
            }
          }
        }

        if (wordModel.value != null) {
          for (var element in HiveService.instance.getAll()) {
            print("hiveWord.license");
            print("hiveWord.license");
            if (element.word == wordModel.value!.word) {
              checker++;
            }
          }

          if (checker == 0) {
            final WordModel hiveWord = WordModel(
              word: wordModel.value.word,
              meanings: wordModel.value.meanings,
              origin: wordModel.value.origin,
              phonetics: wordModel.value.phonetics,
              license: wordModel.value.license,
            );

            await HiveService.instance.addData(hiveWord);
          } else {}
        }
      } catch (e) {
        print(e);
      }

      return wordModel.value;
    }
  }
}
