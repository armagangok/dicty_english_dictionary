import 'package:english_accent_dictionary/core/local/database/services/current_service.dart';
import 'package:english_accent_dictionary/core/local/database/services/dummy_service.dart';

import '../models/word_hive_model.dart';
import '../services/base_service.dart';

enum AppMode { debug, release }

class WordDBRepository implements HiveBaseService {
  AppMode appMode = AppMode.release;

  final CurrentDatabaseService _currentDBService = CurrentDatabaseService();
  final DatabaseDummyService _dbDummyService = DatabaseDummyService();

  @override
  Future<void> addData(Word word) async {
    if (appMode == AppMode.debug) {
      await _dbDummyService.addData(word);
    } else {
      await _currentDBService.addData(word);
    }
  }

  @override
  Future<void> deleteData(int index) async {
    if (appMode == AppMode.debug) {
      await _dbDummyService.deleteData(index);
    } else {
      await _currentDBService.deleteData(index);
    }
  }

  @override
  Future<Word> getData(int index) async {
    if (appMode == AppMode.debug) {
      return await _dbDummyService.getData(index);
    } else {
      return await _currentDBService.getData(index);
    }
  }

  @override
  Future<int> getLanguage() async {
    if (appMode == AppMode.debug) {
      return await _dbDummyService.getLanguage();
    } else {
      return await _currentDBService.getLanguage();
    }
  }

  @override
  Future<void> saveLanguage(int index) async {
    if (appMode == AppMode.debug) {
      await _dbDummyService.saveLanguage(index);
    } else {
      await _currentDBService.saveLanguage(index);
    }
  }

  @override
  Future<void> setupLanguage() async {
    if (appMode == AppMode.debug) {
      await _dbDummyService.setupLanguage();
    } else {
      await _currentDBService.setupLanguage();
    }
  }
}
