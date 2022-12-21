import 'package:english_accent_dictionary/core/error/failure.dart';
import 'package:english_accent_dictionary/feature/data/model/word_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecase/word_usecase.dart';
import '../../../../../injection_container.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  late final wordUsecase = getIt.call<WordUsecase>();

  Future<void> fetchWord({required String word}) async {
    var response = await wordUsecase.fetchWord(word: word);

    response.fold(
      (failure) {
        if (failure is NetWork404Failure) {
          emit(SearchFailed(errorMessage: failure.errorMessage));
        } else {
          SearchFailed(errorMessage: SearchFailedState.errorMessage);
        }
      },
      (r) {
        emit(SearchSucceded(wordModel: r));
      },
    );
  }
}
