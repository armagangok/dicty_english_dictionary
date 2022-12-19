import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../core/error/failure.dart';
import '../../../global/export/export.dart';
import '../contract/word_repository.dart';

class WordRepositoryImp implements WordRepository {
  WordRepositoryImp._();
  static final instance = WordRepositoryImp._();

  @override
  Future<Either<Failure, WordModel>> fetchWord({required String word}) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word'),
      );

      if (response.statusCode == 200) {
        var model = (WordModel.fromMap(jsonDecode(response.body)[0]));

        return Right(model);
      } else if (response.statusCode == 404) {
        var decodedErrorMessage = (jsonDecode(response.body));

        return Left(NetWork404Failure(errorMessage: decodedErrorMessage));
      } else {
        return Left(NetWorkUnknownFailure());
      }
    } on PlatformException {
      return Left(NetworkFetchFailure());
    }
  }
}
