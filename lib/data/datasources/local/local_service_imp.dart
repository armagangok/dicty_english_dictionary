import '../../../global/export/export.dart';
import '../../contract/local_service.dart';

class LocalServiceImp implements LocalService {
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
}
