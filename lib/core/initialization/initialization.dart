import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/export/export.dart';
import '../local/database/services/hive_service.dart';

class Initialization {
  Initialization._();
  static final instance = Initialization._();

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
        "497DCF94384BA837362099A7E9BED56E",
      ],
    );

    MobileAds.instance.updateRequestConfiguration(configuration);

    await HiveService.instance.initializeHive();
    await GetStorage.init();

    var _prefs = await SharedPreferences.getInstance();

    if (_prefs.getInt("firstRun") == null) {
      await HiveService.instance.setupLanguage();
      await _prefs.setInt("firstRun", 1);
    }

    await TextToSpeech.instance.initTTS();
  }
}
