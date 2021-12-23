import 'package:flutter/material.dart';
import '../../../locator/locator.dart';
import '../models/word_model.dart';
import '../services/base_service.dart';
import '../repository/repository.dart';

enum ViewState { idle, busy }

class WordViewModel with ChangeNotifier implements Base {
  final WordRepository _userRepository = locator<WordRepository>();
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<WordModel> fetchData(String? text) async {
    try {
      state = ViewState.busy;
      return await _userRepository.fetchData(text);
    } catch (e) {
      debugPrint("ERROR IN VIEWMODEL --> $e");
      return WordModel();
    } finally {
      state = ViewState.idle;
    }
  }
}
