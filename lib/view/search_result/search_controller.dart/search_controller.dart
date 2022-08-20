import 'package:english_accent_dictionary/core/remote/api/model/model.dart';

import '../../../feature/export/export.dart';

class SearchController extends GetxController implements BaseWordController {
  SearchController._();
  static final instance = SearchController._();

  final HiveController hiveService = Get.find();
  final WordService _wordService = WordService.instance;

  final Rx<dynamic> _wordModel = Rx(null);

  @override
  RxList<Definition> noun = RxList([]);
  @override
  RxList<Definition> verb = RxList([]);
  @override
  RxList<Definition> interjection = RxList([]);
  @override
  RxList<Definition> pronoun = RxList([]);
  @override
  RxList<Definition> articles = RxList([]);
  @override
  RxList<Definition> adverb = RxList([]);
  @override
  RxList<Definition> preposition = RxList([]);
  @override
  RxList<Definition> adjective = RxList([]);

  get getWord => _wordModel.value;

  // @override
  // void onReady() {
  //   _wordModel.value ??= 0;
  //   super.onReady();
  // }

  Future<dynamic> fetchWord(String text) async {
    int checker = 0;
    _wordModel.value = null;
    _wordModel.value = await _wordService.fetchWord(text);

    clearAllList();

    if (_wordModel.value.runtimeType == WordModel) {
      for (Meaning element in _wordModel.value!.meanings!) {
        switch (element.partOfSpeech) {
          case "noun":
            for (var element in element.definitions!) {
              noun.add(element);
            }
            break;

          case "verb":
            for (var element in element.definitions!) {
              verb.add(element);
            }
            break;

          case "interjection":
            for (var element in element.definitions!) {
              interjection.add(element);
            }
            break;

          case "pronoun":
            for (var element in element.definitions!) {
              pronoun.add(element);
            }
            break;

          case "articles":
            for (var element in element.definitions!) {
              articles.add(element);
            }
            break;

          case "adverb":
            for (var element in element.definitions!) {
              adverb.add(element);
            }
            break;

          case "preposition":
            for (var element in element.definitions!) {
              preposition.add(element);
            }
            break;

          case "adjective":
            for (var element in element.definitions!) {
              adjective.add(element);
            }
            break;

          default:
        }
        await saveToHiveDatabase(checker);
      }
    } else if (_wordModel.value.runtimeType == ErrorModel) {
      return _wordModel.value;
    }

    return _wordModel.value ?? (_wordModel.value = 0);
  }

  void clearAllList() {
    noun.clear();
    verb.clear();
    interjection.clear();
    pronoun.clear();
    articles.clear();
    adverb.clear();
    preposition.clear();
    adjective.clear();
  }

  Future<void> saveToHiveDatabase(checker) async {
    if (_wordModel.value != null) {
      for (var element in hiveService.getAll()) {
        if (element.word == _wordModel.value!.word) {
          checker++;
        }
      }

      if (checker == 0) {
        final WordModel hiveWord = WordModel(
          word: _wordModel.value.word,
          meanings: _wordModel.value.meanings,
          origin: _wordModel.value.origin,
          phonetics: _wordModel.value.phonetics,
          license: _wordModel.value.license,
        );

        await hiveService.addData(hiveWord);
      }
    }
  }
}
