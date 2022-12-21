import 'package:dartz/dartz.dart';
import 'package:english_accent_dictionary/data/contract/word_service.dart';

import '../../core/error/contract/failure.dart';
import '../../core/error/local_failure.dart';
import '../../global/export/export.dart';

class LocalWordRepository {
  LocalWordRepository({required this.service});

  late final WordService service;
  Future<Either<Failure, WordModel>> fetchWord({required String word}) async {
    try {
      var response = await service.fetchWord(word: word) as WordModel;

      return Right(response);
    } catch (e) {
      return Left(LocalFetchingFailure());
    }
  }

  Future<Either<Failure, bool>> deleteAllWords() async {
    try {
      await service.deleteAllWords();
      return const Right(true);
    } on PlatformException catch (e) {
      return Left(
        LocalSavingFailure(
          errorMessage: e.details ?? "Local saving error.",
          errorTitle: e.message ?? "Warning.",
        ),
      );
    }
  }

  Future<Either<Failure, bool>> deleteByName(WordModel wordModel) async {
    try {
      await service.deleteByName(wordModel);

      return const Right(true);
    } on PlatformException catch (e) {
      return Left(
        LocalSavingFailure(
          errorMessage: e.details ?? "Local saving error.",
          errorTitle: e.details ?? "Warning.",
        ),
      );
    }
  }

  Future<Either<Failure, bool>> deleteWord(int index) async {
    try {
      await service.deleteWord(index);

      return const Right(true);
    } on PlatformException catch (e) {
      return Left(
        LocalSavingFailure(
          errorMessage: e.details ?? "Local saving error.",
          errorTitle: e.details ?? "Warning.",
        ),
      );
    }
  }

  Future<Either<Failure, int>> getLanguage() async {
    try {
      int response = await service.getLanguage();
      return Right(response);
    } on PlatformException catch (e) {
      return Left(
        LocalSavingFailure(
          errorMessage: e.details ?? "Local saving error.",
          errorTitle: e.details ?? "Warning.",
        ),
      );
    }
  }

  Future<Either<Failure, bool>> save(int index, WordModel value) async {
    try {
      await service.save(index, value);
      return const Right(true);
    } on PlatformException catch (e) {
      return Left(
        LocalSavingFailure(
          errorMessage: e.details ?? "Local saving error.",
          errorTitle: e.details ?? "Warning.",
        ),
      );
    }
  }

  Future<Either<Failure, bool>> setupLanguage() async {
    try {
      await service.setupLanguage();
      return const Right(true);
    } on PlatformException catch (e) {
      return Left(
        LocalSavingFailure(
          errorMessage: e.details ?? "Local saving error.",
          errorTitle: e.details ?? "Warning.",
        ),
      );
    }
  }
}
