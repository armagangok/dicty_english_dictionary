import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/database/hive.dart';
import 'app/database/words.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final helper = HiveHelper();

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.initFlutter(directory.path);
  Hive.registerAdapter(WordAdapter());
  
  var _prefs = await SharedPreferences.getInstance();
  if (_prefs.getInt("firstRun") == null) {
    helper.setLangToLanguageBox();
    helper.setTimeToTimeBox();
    await _prefs.setInt("firstRun", 1);
  }
}
