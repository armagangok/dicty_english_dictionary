import 'package:dartz/dartz.dart';

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

  Future<Either<Failure, bool>> saveWord(WordModel wordModel) async {
    try {
      await service.saveWord(wordModel);
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

  Future<Either<Failure, bool>> updateWord({
    required int index,
    required WordModel wordModel,
  }) async {
    try {
      await service.updateWord(
        index: index,
        wordModel: wordModel,
      );
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
      await service.setupAccent();
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

  Future<Either<Failure, int>> getAccent() async {
    try {
      var response = await service.getAccent();
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

  Future<Either<Failure, bool>> saveAccent({required int accent}) async {
    try {
      await service.saveAccent(accent: accent);
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
