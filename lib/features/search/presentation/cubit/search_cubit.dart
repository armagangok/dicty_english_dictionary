import 'package:english_accent_dictionary/data/models/response/response_data/meanings/meanings.dart';
import 'package:english_accent_dictionary/features/search/domain/usecases/search_usecase.dart';

import '../../../../data/models/response/response_data/meanings/definitions/definitions.dart';
import '../../../../data/models/response/word_response.dart';
import '../../../../global/export/export.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> implements WordCubitContract {
  SearchCubit() : super(SearchInitial());

  final _searchUsecase = SearchUseCase();

  @override
  late List<Definitions> adjective = [];
  @override
  List<Definitions> adverb = [];
  @override
  List<Definitions> articles = [];
  @override
  List<Definitions> interjection = [];
  @override
  List<Definitions> noun = [];
  @override
  List<Definitions> preposition = [];
  @override
  List<Definitions> pronoun = [];
  @override
  List<Definitions> verb = [];

  List<WordResponse> wordList = [];

  Future<void> fetchWord({required String word}) async {
    // var wordRequest = WordRequest(wordText: word);

    clearAllList();
    emit(SearchingState());
    var response = await _searchUsecase.fetchWord(word);

    response.fold(
      (Failure failure) => emit(
        SearchFailed(
          errorMessage: "failure",
          errorTitle: "SearchFailed.errorMessage",
        ),
      ),
      (WordResponse wordModel) async {
        for (Meaning element in wordModel.meanings!) {
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

        print(wordModel.meanings);

        // await saveSearchedWord(wordModel);

        emit(SearchSucceded(response: wordModel));
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
}



  // Future<void> saveSearchedWord(WordResponseResponse word) async {
  //   var response = await _localUsecase.saveWord(word);
  //   response.fold(
  //     (failure) => emit(SearchSavingFailure()),
  //     (data) => print("Search saved successfuly. $data"),
  //   );
  // }

  // Future<void> getAll() async {
  //   wordList.clear();
  //   var response = await _localUsecase.fetchAllCachedWords();

  //   response.fold(
  //     (failure) => print(failure),
  //     (data) => wordList = data,
  //   );
  // }

  // Future<void> saveWord(WordResponse wordModel) async {
  //   await _localUsecase.saveWord(wordModel);
  // }

  // Future<void> deleteByName(WordResponse wordModel) async {
  //   final Map<dynamic, WordResponse> deliveriesMap = _hiveWords.toMap();
  //   dynamic desiredKey;
  //   deliveriesMap.forEach((key, wordModel) {
  //     if (wordModel.isSelected) {
  //       desiredKey = key;
  //     }
  //   });
  //   await _hiveWords.delete(desiredKey);
  // }

  // Future<void> updateWord(int index, WordResponseResponse wordModel) async =>
  //     await _localUsecase.updateWord(
  //       index: index,
  //       response: wordModel,
  //     );

  // Future<void> deleteAllWords() async => await _hiveWords.clear();