// ignore_for_file: prefer_final_fields, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import '../../../../../global/export/export.dart';

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

  List<WordResponse> _wordList = [];
  List<WordResponse> get wordList => _wordList;
  set wordList(List<WordResponse> list) => _wordList = list;
  set setWordList(List<WordResponse> wordList) => _wordList = wordList;

  final Box<String> _hiveWords = HiveBoxes.wordBox;

  Box<String> get getHiveBox => _hiveWords;

  // Future<void> deleteIfSelected(WordResponse wordModel) async {
  //   await _localUsecase.deleteWord(wordModel);
  // }

  Future<void> updateWord(int index, WordResponse wordModel) async {
    String jsonWordData = jsonEncode(wordModel.toJson());
    await _localUsecase.updateWord(
      jsonWordData,
      index,
    );
  }

  Future<void> deleteAllWords() async => await _hiveWords.clear();

  Future<void> fetchWord({required WordResponse word}) async {
    clearAllList();

    if (word.meanings != null) {
      for (Meaning element in word.meanings!) {
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

  int index = 0;
  Future<void> deleteIfSelected() async {
    print(wordList);
    wordList.forEach((word) async {
      if (word.isSelected) {
        await _localUsecase.deleteWord(index);

        index++;
      }
    });
  }
}


  // Future<void> addData(Meaning word) async => await _hiveWords.add(word);
  // List<Meaning> getAll() {
  //   _wordList.clear();
  //   for (Meaning word in _hiveWords.values) {
  //     _wordList.add(word);
  //   }
  //   return _wordList;
  // }


  // final Map<dynamic, Meaning> deliveriesMap = _hiveWords.toMap();
  // dynamic desiredKey;
  // deliveriesMap.forEach((key, wordModel) {
  //   if (wordModel.isSelected) {
  //     desiredKey = key;
  //   }
  // });