import '../models/word_model.dart';
import '../services/base_service.dart';
import '../services/current_service.dart';
import '../services/dummy_service.dart';

enum AppMode { debug, release }

class WordRepository implements Base {
  final CurrentService _currentService = CurrentService();
  final DummyService _dummyService = DummyService();
  final AppMode appMode = AppMode.release;
  @override
  Future<WordModel> fetchData(String? text) async {
    print("release mode is active");
    if (appMode == AppMode.release) {
      return await _currentService.fetchData(text);
    } else {
      print("debug mode mode is active");
      return await _dummyService.fetchData(text);
    }
  }
}
