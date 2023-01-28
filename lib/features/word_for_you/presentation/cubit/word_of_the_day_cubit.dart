import 'dart:convert';

import '../../../home/domain/usecases/home_usecase.dart';

import '../../../../data/models/response/response_data/meaning/definitions/definition.dart';
import '../../../../data/models/response/response_data/meaning/meaning.dart';
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
          for (Meaning meaning in data.meanings!) {
            switch (meaning.partOfSpeech) {
              case "noun":
                for (var definition in meaning.definitions!) {
                  noun.add(definition);
                }
                break;

              case "verb":
                for (var definition in meaning.definitions!) {
                  verb.add(definition);
                }
                break;

              case "interjection":
                for (var definition in meaning.definitions!) {
                  interjection.add(definition);
                }
                break;

              case "pronoun":
                for (var definition in meaning.definitions!) {
                  pronoun.add(definition);
                }
                break;

              case "articles":
                for (var definition in meaning.definitions!) {
                  articles.add(definition);
                }
                break;

              case "adverb":
                for (var definition in meaning.definitions!) {
                  adverb.add(definition);
                }
                break;

              case "preposition":
                for (var definition in meaning.definitions!) {
                  preposition.add(definition);
                }
                break;

              case "adjective":
                for (var definition in meaning.definitions!) {
                  adjective.add(definition);
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
