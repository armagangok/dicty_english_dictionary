import '../../../../global/export/export.dart';

class DummyApiService {
  Future<WordModel> fetchWord(String? text) async {
    await Future.delayed(const Duration(seconds: 2));
    return WordModel();
  }
}
