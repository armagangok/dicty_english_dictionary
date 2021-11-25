import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shared_preferences/shared_preferences.dart';

import 'database/hive_helper.dart';
import 'database/word_hive_model.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  MobileAds.instance.initialize();


  final directory = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(WordAdapter());
  await Hive.openBox("countryBox");
  await Hive.openBox("words");
  await Hive.openBox("theme");

  await GetStorage.init();
  var _prefs = await SharedPreferences.getInstance();

  if (_prefs.getInt("firstRun") == null) {
    await hiveHelper.setupLanguage();
    await _prefs.setInt("firstRun", 1);
  }
}
