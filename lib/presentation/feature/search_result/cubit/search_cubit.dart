import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../global/export/export.dart';


part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> implements BaseWordController {
  SearchCubit() : super(SearchInitial());

  late final _remoteUsecase = getIt.call<RemoteWordUsecase>();
  late final _localUsecase = getIt.call<LocalWordUsecase>();

  @override
  late List<WordEntity> adjective = [];
  @override
  List<WordEntity> adverb = [];
  @override
  List<WordEntity> articles = [];
  @override
  List<WordEntity> interjection = [];
  @override
  List<WordEntity> noun = [];
  @override
  List<WordEntity> preposition = [];
  @override
  List<WordEntity> pronoun = [];
  @override
  List<WordEntity> verb = [];

  List<WordModel> wordList = [];
  final Box<WordModel> _hiveWords = Hive.box(HiveBoxes.wordBox);

  Box<WordModel> get getHiveBox => _hiveWords;

  Future<void> addData(WordModel word) async => await _hiveWords.add(word);

  List<WordModel> getAll() {
    wordList.clear();

    for (WordModel word in _hiveWords.values) {
      wordList.add(word);
    }
    return wordList;
  }

  Future<void> deleteData(index) async => await _hiveWords.deleteAt(index);

  WordModel getData(int index) => _hiveWords.getAt(index) as WordModel;

  Future<String> getLanguage() async {
    final Box box = Hive.box("countryBox");
    final String index = await box.getAt(0);
    return index;
  }

  // Future<void> setupLanguage() async =>
  //     await Hive.box("countryBox").add("English-GB");

  Future<void> saveLanguage(String lang) async {
    await Hive.box("countryBox").clear();
    await Hive.box("countryBox").add(lang);
  }

  Future<void> deleteByName(WordModel wordModel) async {
    final Map<dynamic, WordModel> deliveriesMap = _hiveWords.toMap();
    dynamic desiredKey;
    deliveriesMap.forEach((key, value) {
      if (value.isSelected!) {
        desiredKey = key;
      }
    });
    await _hiveWords.delete(desiredKey);
  }

  Future<void> save(int index, WordModel value) async =>
      await _hiveWords.putAt(index, value);

  Future<void> deleteAllWords() async => await _hiveWords.clear();

  Future<void> fetchWord(String word) async {
    clearAllList();
    emit(SearchingState());
    var response = await _remoteUsecase.fetchWord(word: word);
    response.fold(
      (failure) {
        if (failure is NetWork404Failure) {
          emit(SearchFailed(
            errorTitle: failure.errorTitle,
            errorMessage: failure.errorMessage,
          ));
        } else {
          emit(SearchFailed(
            errorTitle: SearchFailedState.errorTitle,
            errorMessage: SearchFailedState.errorMessage,
          ));
        }
      },
      (r) async {
        int checker = 0;

        var response = await _remoteUsecase.fetchWord(word: word);

        response.fold(
          (failure) => LogHelper.shared.debugPrint("$failure"),
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

                // if (checker == 0) {
                //   final WordModel hiveWord = WordModel(
                //     word: _wordModel.word,
                //     phonetics: _wordModel.phonetics,
                //     license: _wordModel.license,
                //   );

                //   await _hiveService.addData(hiveWord);
                // }

                emit(SearchSucceded(wordModel: data));
              }
            }
          },
        );
      },
    );
  }

  // Future<void> fetchWord({required String word}) async {

  // }

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
}
