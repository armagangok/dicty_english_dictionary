import 'package:english_accent_dictionary/core/local/database/models/word_hive_model.dart';
import 'package:english_accent_dictionary/core/local/database/viewmodels/word_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../locator/locator.dart';
import '../models/word_model.dart';
import '../services/base_service.dart';
import '../services/current_service.dart';

class DictController implements Base {
  final WordService _wordService = locator<WordService>();
  final WordViewModel _wordViewModel = WordViewModel();

  Rx<WordModel?> word = Rx(null);

  @override
  Future<dynamic> fetchData(String text) async {
    try {
      if (text.isEmpty) {
        return null;
      } else {
        word.value = await _wordService.fetchData(text);

        if (word.value == null) {
          return 0;
        } else {
          _wordViewModel.addData(
            Word(
              word: word.value!.word,
              origin: word.value!.origin,
              meaning1: word.value!.meaning1,
              meaning2: word.value!.meaning2,
              example: word.value!.example,
            ),
          );
          return word.value;
        }
      }
    } catch (e) {
      debugPrint("ERROR IN VIEWMODEL --> $e");
      return word.value;
    }
  }
}
