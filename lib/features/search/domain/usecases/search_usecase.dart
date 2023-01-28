import 'package:dartz/dartz.dart';
import '../../../../data/repositories/word_repository.dart';

import '../../../../core/error/contract/failure.dart';
import '../../../../data/models/response/word_response.dart';

class SearchUseCase {
  final _wordRepository = WordRepository();

  Future<Either<Failure, WordResponse>> fetchWord(String request) async {
    var response = await _wordRepository.fetchWord(request);

    return response;
  }
}
