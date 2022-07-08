import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../locator/locator.dart';
import '../models/word_model.dart';
import '../repository/repository.dart';
import '../services/base_service.dart';

class WordViewModelAPI extends GetxController implements Base {
  final WordRepository _userRepository = locator<WordRepository>();

  Rx  wordModel = Rx(WordModel());

  @override
  Future<void> fetchData(String text) async {
    try {
      wordModel.value = await _userRepository.fetchData(text);
      // print(wordModel!.meaning1);
      notifyChildrens();
    } catch (e) {
      debugPrint("ERROR IN VIEWMODEL --> $e");
    } finally {}
  }
}
