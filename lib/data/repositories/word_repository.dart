import 'package:dartz/dartz.dart';
import 'package:english_accent_dictionary/core/error/contract/failure.dart';
import 'package:english_accent_dictionary/core/error/network_failure.dart';
import 'package:english_accent_dictionary/data/datasources/api.dart';
import 'package:english_accent_dictionary/data/datasources/home/home_service.dart';

import '../models/response/word_response.dart';

class WordRepository {
  final HomeClient homeClient = Api().homeClient;

  Future<Either<Failure, WordResponse>> fetchWord(String request) async {
    try {
      var response = await homeClient.fetchWord(request);

      print(response);

      return Right(response[0]);
    } catch (e) {
      rethrow;
      // return Left(NetworkFetchFailure());
    }
  }
}
