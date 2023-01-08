import 'dart:convert';

import '../../../../global/export/export.dart';

import 'package:intl/intl.dart';

part 'word_of_the_day_state.dart';

class WordOfTheDayCubit extends Cubit<WordOfTheDayState>
    implements WordCubitContract {
  WordOfTheDayCubit() : super(WordOfTheDayInitial()) {
    _wordUsecase = getIt.call<RemoteWordUsecase>();
    fetchWord();
  }

  late final RemoteWordUsecase _wordUsecase;

  Future<void> fetchWord() async {
    emit(WordOfTheDayFetchingState());
    var response = await _wordUsecase.fetchWord(word: await getDatedWord());
    response.fold(
      (Failure failure) => emit(
        WordOfTheDayFailed(
          errorMessage: WordOfTheDayFailedState.errorMessage,
          errorTitle: WordOfTheDayFailedState.errorMessage,
        ),
      ),
      (WordModel data) {
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
        } else {}

        emit(WordOfTheDaySucceded(wordModel: data));
      },
    );
  }

  @override
  List<WordEntity> adjective = [];

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

  Future<String> getDatedWord() async {
    final String response =
        await rootBundle.loadString('assets/data/data.json');
    final data = await json.decode(response);

    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');

    return data[formatter.format(now)];
  }
}
