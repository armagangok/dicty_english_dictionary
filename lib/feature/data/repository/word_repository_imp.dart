// import 'package:dartz/dartz.dart';

// import '../../../core/error/failure.dart';
// import '../../../core/network/layers/network_executer.dart';
// import '../../../core/network/request_options.dart/request_options.dart';
// import '../contract/word_repository.dart';
// import '../model/word_model.dart';

// class WordRepositoryImp extends WordRepository {
//   @override
//   Future<Either<Failure, dynamic>> fetchWord({required String word}) async {
//     try {
//       dynamic data = await NetworkExecuter.request(
//         options: MyRequestOptions.instance.requestOptions(
//           text: word,
//         ),
//         responseType: WordModel(),
//       );
//       return Right(data);
//     } catch (e) {
//       return Left(NetworkFetchFailure());
//     }
//   }
// }
