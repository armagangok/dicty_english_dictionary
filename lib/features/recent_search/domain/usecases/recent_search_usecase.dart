import 'package:english_accent_dictionary/global/export/export.dart';

import 'package:dartz/dartz.dart';
import '../../../../data/repositories/local_repository/local_repository.dart';

class RecentSearchUsecase {
  final _localRepository = LocalRepository.instance;

  Future<Either<Failure, bool>> deleteWord(int index) async {
    var resposne = await _localRepository.deleteWord(index);

    return resposne;
  }

  Future<Either<Failure, dynamic>> fetchWord() async {
    var resposne = await _localRepository.fetchWord();

    return resposne;
  }

  Future<Either<Failure, bool>> saveWord(String word) async {
    var resposne = await _localRepository.saveWord(word);

    return resposne;
  }

  Future<void> updateWord(String word, int index) async {
    var resposne = await _localRepository.updateWord(word, index);

    return resposne;
  }

  String fetchLanguage(int index) {
    var response = _localRepository.fetchLanguage(index);

    return response;
  }

  Future<Either<Failure, bool>> saveLanguage(String lang) async {
    try {
      await _localRepository.saveLanguage(lang);
      return const Right(true);
    } catch (e) {
      return Left(LocalSavingFailure(
        errorMessage: "errorMessage",
        errorTitle: "errorTitle",
      ));
    }
  }
}
