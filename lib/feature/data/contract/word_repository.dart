import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../model/word_model.dart';

abstract class WordRepository {
  Future<Either<Failure, WordModel>> fetchWord({required String word});
}
