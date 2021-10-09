import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wordmind/database/hive_helper_object.dart';
import './database/words.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.initFlutter(directory.path);
  Hive.registerAdapter(WordAdapter());

  var _prefs = await SharedPreferences.getInstance();
  if (_prefs.getInt("firstRun") == null) {
    hiveHelper.setLangToLanguageBox();
    hiveHelper.setTimeToTimeBox();
    await _prefs.setInt("firstRun", 1);
  }
}
