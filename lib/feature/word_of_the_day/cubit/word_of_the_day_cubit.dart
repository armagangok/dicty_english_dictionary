import 'package:bloc/bloc.dart';

import '../../../core/error/contract/failure.dart';
import '../../../domain/usecase/remote_word_usecase.dart';
import '../../../global/export/export.dart';

part 'word_of_the_day_state.dart';

class WordOfTheDayCubit extends Cubit<WordOfTheDayState> {
  WordOfTheDayCubit() : super(WordOfTheDayInitial()) {
    _wordUsecase = getIt.call<RemoteWordUsecase>();
  }

  late final RemoteWordUsecase _wordUsecase;

  Future<void> fetchWord({required String word}) async {
    emit(WordOfTheDayFetchingState());
    var response = await _wordUsecase.fetchWord(word: word);
    response.fold(
      (Failure failure) => emit(
        WordOfTheDayFailed(
          errorMessage: WordOfTheDayFailedState.errorMessage,
          errorTitle: WordOfTheDayFailedState.errorMessage,
        ),
      ),
      (WordModel data) {
        emit(WordOfTheDaySucceded(wordModel: data));
      },
    );
  }
}
