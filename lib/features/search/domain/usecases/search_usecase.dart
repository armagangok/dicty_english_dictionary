import 'package:dartz/dartz.dart';
import 'package:english_accent_dictionary/data/repositories/local_repository/local_repository.dart';
import '../../../../data/repositories/word_repository.dart';

import '../../../../core/error/contract/failure.dart';
import '../../../../data/models/response/word_response.dart';

class SearchUseCase {
  final _wordRepository = WordRepository();
  final _localRepository = LocalRepository.instance;

  Future<Either<Failure, WordResponse>> fetchWord(String word) async {
    var response = await _wordRepository.fetchWord(word);

    return response;
  }

  Future<Either<Failure, bool>> saveWord(String word) async {
    var response = await _localRepository.saveWord(word);

    return response;
  }
}
