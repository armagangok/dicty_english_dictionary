import 'package:english_accent_dictionary/core/api/services/dummy_service.dart';

import '../api/models/word_model.dart';
import '../api/services/base_service.dart';
import '../api/services/current_service.dart';

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
