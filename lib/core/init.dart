import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shared_preferences/shared_preferences.dart';

import './local/database/models/word_hive_model.dart';
import './local/database/viewmodels/word_viewmodel.dart';
import './locator/locator.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  MobileAds.instance.initialize();

  RequestConfiguration configuration = RequestConfiguration(
    testDeviceIds: [
      "49C421EF0449459DA67361C9563651B6",
      "EB2D89543F0CE7C461E8D872A428078D",
      "05b9dcde265d903d49fbf7c74fb6dd75",
      "da067b253b37e1af91e82c50e34b74bb",
      "31E74826447186709EC324B30C8E83C8",
    ],
  );
  MobileAds.instance.updateRequestConfiguration(configuration);

  final directory = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(WordAdapter());
  await Hive.openBox("countryBox");
  await Hive.openBox("words");
  await Hive.openBox("theme");

  setupLocator();

  await GetStorage.init();
  var _prefs = await SharedPreferences.getInstance();

  final WordViewModel _wordViewModel = WordViewModel();

  if (_prefs.getInt("firstRun") == null) {
    await _wordViewModel.setupLanguage();
    await _prefs.setInt("firstRun", 1);
  }
}
