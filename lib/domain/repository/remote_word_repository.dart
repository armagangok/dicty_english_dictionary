import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../core/error/contract/failure.dart';
import '../../core/error/network_failure.dart';
import '../../../global/export/export.dart';
import '../../data/contract/word_service.dart';

class RemoteWordRepository {
  RemoteWordRepository({required this.service});

  late final WordService service;

  Future<Either<Failure, WordModel>> fetchWord({required String word}) async {
    try {
      var response = await service.fetchWord(word: word);
      if (response.statusCode == 200) {
        var model = (WordModel.fromMap(jsonDecode(response.body)[0]));

        return Right(model);
      } else if (response.statusCode == 404) {
        var decodedErrorMessage = jsonDecode(response.body);

        return Left(
          NetWork404Failure(
            errorTitle: decodedErrorMessage["title"],
            errorMessage: decodedErrorMessage["message"],
          ),
        );
      } else {
        return Left(NetWorkUnknownFailure());
      }
    } on PlatformException {
      return Left(NetworkFetchFailure());
    }
  }
}
