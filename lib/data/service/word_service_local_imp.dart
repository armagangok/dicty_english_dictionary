import '../../core/helpers/hive/hive_helper.dart';
import '../../core/helpers/hive/hive_keys.dart';
import '../../global/export/export.dart';
import '../contract/word_service.dart';

class WordServiceLocalImp extends WordService {
  final _countryBox = HiveBoxes.countryBox;
  final _wordBox = HiveBoxes.wordBox;

  final _hiveHelper = getIt.call<HiveHelper>();

  @override
  Future fetchWord({required String word}) async {
    await _hiveHelper.getData(_wordBox, word);
  }

  @override
  Future<void> deleteWord(index) async =>
      await _hiveHelper.deleteDataAt<WordModel>(_wordBox, index);

  @override
  Future<String> getLanguage() async {
    String? index = _hiveHelper.getData(_countryBox, 0);

    return index ?? "";
  }

  @override
  Future<void> setupLanguage() async =>
      await _hiveHelper.addData(_countryBox, "English-GB");

  Future<void> saveLanguage(String lang) async {
    await _hiveHelper.clearBox(_countryBox);
    await _hiveHelper.addData(_countryBox, lang);
  }

  @override
  Future<void> deleteByName(WordModel wordModel) async {
    // final Map<dynamic, WordModel> deliveriesMap = _hiveWords.toMap();
    // dynamic desiredKey;
    // deliveriesMap.forEach((key, value) {
    //   if (value.isSelected) {
    //     desiredKey = key;
    //   }
    // });
    // await _hiveHelper.deleteData(_wordBox, desiredKey);
  }

  @override
  Future<void> save(int index, WordModel value) async {
    await _hiveHelper.putDataAt(_wordBox, value, index);
  }

  @override
  Future<void> deleteAllWords() async {
    // final Map<dynamic, WordModel> deliveriesMap = _hiveWords.toMap();
    // dynamic desiredKey;
    // deliveriesMap.forEach((key, value) {
    //   if (value.isSelected) {
    //     desiredKey = key;
    //   }
    // });

    // await _hiveHelper.deleteAll(
    //   _wordBox,
    //   desiredKey,
    // );
  }
}
