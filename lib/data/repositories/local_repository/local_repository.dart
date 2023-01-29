import 'package:dartz/dartz.dart';
import 'package:english_accent_dictionary/data/datasources/local/local_service_imp.dart';
import 'package:english_accent_dictionary/global/export/export.dart';

class LocalRepository {
  LocalRepository._();
  static LocalRepository instance = LocalRepository._();

  final localService = LocalServiceImp.instance;

  Future<Either<Failure, bool>> deleteWord(int index) async {
    try {
      await localService.deleteWord(index);
      return const Right(true);
    } catch (e) {
      return left(LocalDeletingFailure());
    }
  }

  Future<Either<Failure, dynamic>> fetchWord() async {
    try {
      var response = await localService.fetchWord();
      return Right(response);
    } catch (e) {
      return left(LocalFetchingFailure());
    }
  }

  Future<Either<Failure, bool>> saveWord(String word) async {
    try {
      await localService.saveWord(word);
      return const Right(true);
    } catch (e) {
      return left(
        LocalSavingFailure(
          errorMessage: "",
          errorTitle: "",
        ),
      );
    }
  }

  Future<void> updateWord(String word, int index) async {
    localService.updateWord(word, index);
  }

  String fetchLanguage(int index) {
    var response = localService.fetchLanguage(index);
    return response;
  }

  Future<Either<Failure, bool>> saveLanguage(String lang) async {
    try {
      await localService.saveLanguage(lang);
      return const Right(true);
    } catch (e) {
      return Left(LocalSavingFailure(
        errorMessage: "",
        errorTitle: "",
      ));
    }
  }
}
