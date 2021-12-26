import 'package:flutter/material.dart';
import '../../../locator/locator.dart';
import '../models/word_hive_model.dart';
import '../repository/repository.dart';
import '../services/base_service.dart';

enum ViewState { idle, busy }

class WordViewModel implements HiveBaseService {
  final WordDBRepository _dbRepository = locator<WordDBRepository>();

  @override
  Future<void> addData(Word word) async {
    try {
      await _dbRepository.addData(word);
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  Future<void> deleteData(int index) async {
    try {
      await _dbRepository.deleteData(index);
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  Word getData(int index)  {
    try {
      return _dbRepository.getData(index);
    } catch (e) {
      debugPrint("$e");
      return Word(
        word: "word",
        origin: "origin",
        meaning1: "meaning1",
        meaning2: " meaning2",
        example: "example",
      );
    }
  }

  @override
  Future<int> getLanguage() async {
    try {
      return await _dbRepository.getLanguage();
    } catch (e) {
      debugPrint("$e");
      return 1;
    }
  }

  @override
  Future<void> saveLanguage(int index) async {
    try {
      await _dbRepository.saveLanguage(index);
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  Future<void> setupLanguage() async {
    try {
      await _dbRepository.setupLanguage();
    } catch (e) {
      debugPrint("$e");
    }
  }
}
