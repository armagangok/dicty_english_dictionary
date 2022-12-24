import '../../global/export/export.dart';

class WordServiceLocalImp extends WordService {
  static final instance = WordServiceLocalImp._();
  WordServiceLocalImp._();

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

  // @override
  // Future<void> save(int index, WordModel value) async {
  //   await _hiveHelper.putDataAt(_wordBox, value, index);
  // }

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

  @override
  Future<void> saveAccent({required int accent}) async {
    await _hiveHelper.putData<int>(_countryBox, _countryBox, accent);
  }

  @override
  Future<int> getAccent() async {
    var accent = _hiveHelper.getData<int>(_countryBox, _countryBox);
    return accent ?? 4;
  }

  @override
  Future<void> setupAccent() async {
    var accent = _hiveHelper.getData<int>(_countryBox, _countryBox);

    if (accent == null) {
      await _hiveHelper.putData<int>(_countryBox, _countryBox, 0);
    }
  }
}
