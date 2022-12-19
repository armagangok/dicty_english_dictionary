import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/model/word_model.dart';
import '../repository/repository.dart';

class WordUsecase {
  WordUsecase({required this.repository});

  final WordRepository repository;

  Future<Either<Failure, WordModel>> fetchWord({required String word}) async {
    return await repository.fetchWord(word: word);
  }
}
