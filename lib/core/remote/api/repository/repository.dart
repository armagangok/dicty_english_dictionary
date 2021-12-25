import '../models/word_model.dart';
import '../services/base_service.dart';
import '../services/current_service.dart';
import '../services/dummy_service.dart';

enum AppMode { debug, release }

class WordRepository implements Base {
  final CurrentApiService _currentService = CurrentApiService();
  final DummyApiService _dummyService = DummyApiService();
  final AppMode appMode = AppMode.release;
  @override
  Future<WordModel> fetchData(String? text) async {
    if (appMode == AppMode.release) {
      return await _currentService.fetchData(text);
    } else {
      return await _dummyService.fetchData(text);
    }
  }
}
