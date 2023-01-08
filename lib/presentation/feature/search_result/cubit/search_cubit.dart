import '../../../../global/export/export.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> implements WordCubitContract {
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

  Future<void> getAll() async {
    wordList.clear();
    var response = await _localUsecase.fetchAllCachedWords();

    response.fold(
      (failure) => print(failure),
      (data) => wordList = data,
    );
  }

  // Future<void> saveWord(WordModel wordModel) async {
  //   await _localUsecase.saveWord(wordModel);
  // }

  // Future<void> deleteByName(WordModel wordModel) async {
  //   final Map<dynamic, WordModel> deliveriesMap = _hiveWords.toMap();
  //   dynamic desiredKey;
  //   deliveriesMap.forEach((key, wordModel) {
  //     if (wordModel.isSelected) {
  //       desiredKey = key;
  //     }
  //   });
  //   await _hiveWords.delete(desiredKey);
  // }

  Future<void> updateWord(int index, WordModel wordModel) async =>
      await _localUsecase.updateWord(
        index: index,
        wordModel: wordModel,
      );

  // Future<void> deleteAllWords() async => await _hiveWords.clear();

  Future<void> fetchWord({required String word}) async {
    clearAllList();
    emit(SearchingState());
    var response = await _remoteUsecase.fetchWord(word: word);
    response.fold(
      (Failure failure) => emit(
        SearchFailed(
          errorMessage: "failure",
          errorTitle: "SearchFailed.errorMessage",
        ),
      ),
      (WordModel data) async {
        if (data.meanings != null) {
          for (Meaning element in data.meanings!) {
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
          }
        }

        await saveSearchedWord(data);

        emit(SearchSucceded(wordModel: data));
      },
    );
  }

  Future<void> saveSearchedWord(WordModel word) async {
    var response = await _localUsecase.saveWord(word);
    response.fold(
      (failure) => emit(SearchSavingFailure()),
      (data) => print("Search saved successfuly."),
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
}
