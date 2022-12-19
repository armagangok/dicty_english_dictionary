import '../../../../../global/export/export.dart';

class SearchController implements BaseWordController {
  SearchController._();

  static final instance = SearchController._();

  final _hiveService = HiveController.instance;
  final _wordService = WordServiceImp.instance;

  late final WordModel _wordModel;
  WordModel get getWord => _wordModel;

  @override
  List<Definition> noun = [];
  @override
  List<Definition> verb = [];
  @override
  List<Definition> interjection = [];
  @override
  List<Definition> pronoun = [];
  @override
  List<Definition> articles = [];
  @override
  List<Definition> adverb = [];
  @override
  List<Definition> preposition = [];
  @override
  List<Definition> adjective = [];

  Future<dynamic> fetchWord(String word) async {
    clearAllList();
    int checker = 0;

    var response = await _wordService.fetchWord(word: word);

    response.fold(
      (l) => null,
      (data) async {
        if (data.meanings != null) {
          for (var element in data.meanings!) {
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
            }
            await saveToHiveDatabase(checker);
          }
        }
      },
    );
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
    for (var element in _hiveService.getAll()) {
      if (element.word == _wordModel.word) {
        checker++;
      }
    }

    if (checker == 0) {
      final WordModel hiveWord = WordModel(
        word: _wordModel.word,
        phonetics: _wordModel.phonetics,
        license: _wordModel.license,
      );

      await _hiveService.addData(hiveWord);
    }
  }
}
