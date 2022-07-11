import '../../../../feature/export/export.dart';
import '../../../locator/locator.dart';
import '../repository/repository.dart';
import '../services/base_service.dart';

class WordViewModel implements HiveBaseService {
  final WordDBRepository _dbRepository = locator<WordDBRepository>();

  List<HiveWord> wordList = [];

  @override
  Future<void> addData(HiveWord word) async {
    try {
      await _dbRepository.addData(word);
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  Future<void> deleteData(int index) async {
    try {
      await _dbRepository.deleteData(index);
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  HiveWord getData(int index) {
    try {
      return _dbRepository.getData(index);
    } catch (e) {
      debugPrint("$e");
      return HiveWord(
        word: "word",
        origin: "origin",
        meaning1: "meaning1",
        meaning2: " meaning2",
        example: "example",
      );
    }
  }

  @override
  Future<int> getLanguage() async {
    try {
      return await _dbRepository.getLanguage();
    } catch (e) {
      debugPrint("$e");
      return 1;
    }
  }

  @override
  Future<void> saveLanguage(int index) async {
    try {
      await _dbRepository.saveLanguage(index);
      await setLanguage(index);
    } catch (e) {
      debugPrint("$e");
    }
  }

  List<HiveWord> getAll() {
    for (HiveWord word in Hive.box("words").values) {
      wordList.add(word);
    }

    return wordList;
  }

  @override
  Future<void> setupLanguage() async {
    try {
      await _dbRepository.setupLanguage();
    } catch (e) {
      debugPrint("$e");
    }
  }
}
