import 'dart:convert';

import 'package:english_accent_dictionary/features/home/domain/usecases/home_usecase.dart';

import '../../../../data/models/response/response_data/meanings/definitions/definitions.dart';
import '../../../../data/models/response/response_data/meanings/meanings.dart';
import '../../../../data/models/response/word_response.dart';
import '../../../../global/export/export.dart';

import 'package:intl/intl.dart';

part 'word_of_the_day_state.dart';

class WordOfTheDayCubit extends Cubit<WordOfTheDayState>
    implements WordCubitContract {
  WordOfTheDayCubit() : super(WordOfTheDayInitial()) {
    _wordUsecase = HomeUseCase();
    fetchWord();
  }

  late final HomeUseCase _wordUsecase;

  Future<void> fetchWord() async {
    emit(WordOfTheDayFetchingState());
    var response = await _wordUsecase.fetchWord(await getDatedWord());
    response.fold(
      (Failure failure) => emit(
        WordOfTheDayFailed(
          errorMessage: WordOfTheDayFailedState.errorMessage,
          errorTitle: WordOfTheDayFailedState.errorMessage,
        ),
      ),
      (WordResponse data) {
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
  List<Definition> adjective = [];

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

  Future<String> getDatedWord() async {
    final String response =
        await rootBundle.loadString('assets/data/data.json');
    final data = await json.decode(response);

    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');

    return data[formatter.format(now)];
  }
}
