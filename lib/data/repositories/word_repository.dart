import 'package:dartz/dartz.dart';

import '../../global/export/export.dart';

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
