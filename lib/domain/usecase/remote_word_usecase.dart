import 'package:dartz/dartz.dart';

import '../../core/error/contract/failure.dart';
import '../../data/model/word_model.dart';
import '../repository/remote_word_repository.dart';

class RemoteWordUsecase {
  RemoteWordUsecase({required this.repository});

  final RemoteWordRepository repository;

  Future<Either<Failure, WordModel>> fetchWord({required String word}) async {
    return await repository.fetchWord(word: word);
  }
}
