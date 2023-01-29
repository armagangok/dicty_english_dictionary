// ignore_for_file: prefer_final_fields

import '../../../../../global/export/export.dart';
import '../../../domain/usecases/recent_search_usecase.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> implements WordCubitContract {
  LocalCubit() : super(LocalInitial());

  late final _localUsecase = getIt.call<RecentSearchUsecase>();

  @override
  late List<Definition> adjective = [];
  @override
  List<Definition> adverb = [];
  @override
  List<Definition> articles = [];
  @override
  List<Definition> interjection = [];
  @override
  List<Definition> noun = [];
  @override
  List<Definition> preposition = [];
  @override
  List<Definition> pronoun = [];
  @override
  List<Definition> verb = [];

  List<Meaning> _wordList = [];

  List<Meaning> get wordList => _wordList;

  final Box<String> _hiveWords = HiveBoxes.wordBox;

  Box<String> get getHiveBox => _hiveWords;

  // Future<void> addData(Meaning word) async => await _hiveWords.add(word);

  // List<Meaning> getAll() {
  //   _wordList.clear();

  //   for (Meaning word in _hiveWords.values) {
  //     _wordList.add(word);
  //   }
  //   return _wordList;
  // }

  Future<void> deleteData(index) async => await _hiveWords.deleteAt(index);

  Meaning getData(int index) => _hiveWords.getAt(index) as Meaning;

  Future<void> deleteByName(Meaning wordModel) async {
    // final Map<dynamic, Meaning> deliveriesMap = _hiveWords.toMap();
    // dynamic desiredKey;
    // deliveriesMap.forEach((key, wordModel) {
    //   if (wordModel.isSelected) {
    //     desiredKey = key;
    //   }
    // });
    await _hiveWords.delete(wordModel);
  }

  Future<void> updateWord(int index, Meaning wordModel) async =>
      await _localUsecase.updateWord();

  Future<void> deleteAllWords() async => await _hiveWords.clear();



  Future<void> fetchWord({required String word}) async {
    clearAllList();
    emit(LocalingState());
    var response = await _localUsecase.fetchWord();

    response.fold(
      (Failure failure) {
        emit(
          LocalFailed(
            errorMessage: LocalFailedState.errorMessage,
            errorTitle: LocalFailedState.errorTitle,
          ),
        );
      },
      (data) {
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

        emit(LocalSucceded(wordModel: data));
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
