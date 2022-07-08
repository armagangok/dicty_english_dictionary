import 'package:english_accent_dictionary/core/remote/api/services/current_service.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../locator/locator.dart';
import '../models/word_model.dart';
import '../services/base_service.dart';

class DictController extends GetxController implements Base {
  final WordService _wordService = locator<WordService>();

  @override
  Future<WordModel?> fetchData(String text) async {
    try {
      if (text.isEmpty) {
        return null;
      } else {
        return await _wordService.fetchData(text);
      }
    } catch (e) {
      debugPrint("ERROR IN VIEWMODEL --> $e");
      return null;
    }
  }
}
