import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';
import 'database/word_hive_model.dart';
import 'database/hive_helper.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(WordAdapter());

  var _prefs = await SharedPreferences.getInstance();

  if (_prefs.getInt("firstRun") == null) {
    await hiveHelper.setupLanguage();
    await _prefs.setInt("firstRun", 1);
  }
}
