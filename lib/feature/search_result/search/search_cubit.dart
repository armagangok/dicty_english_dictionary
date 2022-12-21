import 'package:english_accent_dictionary/data/entity/word_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../../domain/usecase/word_usecase.dart';
import '../../../core/error/failure.dart';
import '../../../core/helpers/utils/log_helper.dart';
import '../../../data/model/word_model.dart';
import '../../presentation/controller/hive_controller.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  late final _wordUsecase = getIt.call<WordUsecase>();

  late WordModel _wordModel;
  WordModel get getWord => _wordModel;
  final _hiveService = HiveController.instance;

  @override
  List<WordEntity> noun = [];
  @override
  List<WordEntity> verb = [];
  @override
  List<WordEntity> interjection = [];
  @override
  List<WordEntity> pronoun = [];
  @override
  List<WordEntity> articles = [];
  @override
  List<WordEntity> adverb = [];
  @override
  List<WordEntity> preposition = [];
  @override
  List<WordEntity> adjective = [];

  Future<void> fetchWord({required String word}) async {
    emit(SearchingState());
    var response = await _wordUsecase.fetchWord(word: word);

    response.fold((failure) {
      if (failure is NetWork404Failure) {
        emit(SearchFailed(
          errorTitle: failure.errorTitle,
          errorMessage: failure.errorMessage,
        ));
      } else {
        SearchFailed(
          errorTitle: SearchFailedState.errorTitle,
          errorMessage: SearchFailedState.errorMessage,
        );
      }
    }, (r) async {
      clearAllList();
      int checker = 0;

      var response = await _wordUsecase.fetchWord(word: word);

      response.fold(
        (failure) => LogHelper.shared.debugPrint("$failure"),
        (data) async {
          _wordModel = data;
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
              await saveToHiveDatabase(checker, r);
            }
          }
        },
      );
    });
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

  Future<void> saveToHiveDatabase(checker, r) async {
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
    emit(SearchSucceded(wordModel: r));
  }
}
