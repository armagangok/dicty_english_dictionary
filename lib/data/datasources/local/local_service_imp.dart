import '../../../global/export/export.dart';
import '../../contract/local_service.dart';

class LocalServiceImp implements LocalService {
  LocalServiceImp._();
  static final instance = LocalServiceImp._();

  final _hiveHelper = HiveHelper.shared;

  @override
  Future<void> saveWord(String word) async {
    await _hiveHelper.addData<String>(
      HiveKeys.wordBox,
      word,
    );
  }

  @override
  Future<dynamic> fetchWord() async {
    var response = _hiveHelper.getData<String>(
      HiveKeys.wordBox,
      HiveKeys.wordBox,
    );
    return response;
  }

  @override
  Future<void> updateWord() async {}

  @override
  Future<void> deleteWord(int index) async {
    await _hiveHelper.deleteDataAt<String>(
      HiveKeys.wordBox,
      index,
    );
  }

  String fetchLanguage(int index) {
    var response = _hiveHelper.getAt(
      index,
      HiveKeys.countryBox,
    );

    return response;
  }

  Future<void> saveLanguage(String lang) async {
    await _hiveHelper.clearBox(HiveKeys.countryBox);
    await _hiveHelper.addData(HiveKeys.countryBox, lang);
  }
}
