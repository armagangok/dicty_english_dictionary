import 'package:dartz/dartz.dart';
import 'package:english_accent_dictionary/data/models/request/word_request.dart';
import 'package:english_accent_dictionary/data/repositories/word_repository.dart';

import '../../../../core/error/contract/failure.dart';
import '../../../../data/models/response/word_response.dart';

class HomeUseCase {
  final _wordRepository = WordRepository();

  Future<Either<Failure, WordResponse>> fetchWord(WordRequest request) async {
    var response = await _wordRepository.fetchWord(request);

    return response;
  }
}
