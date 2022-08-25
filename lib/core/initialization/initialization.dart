

import '../../global/export/export.dart';

class Initialization {
  Initialization._();
  static final instance = Initialization._();

  Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    

    await HiveController.instance.initializeHive();
    await GetStorage.init();

    var _prefs = await SharedPreferences.getInstance();

    if (_prefs.getInt("firstRun") == null) {
      await HiveController.instance.setupLanguage();
      await _prefs.setInt("firstRun", 1);
    }

    await TextToSpeech.instance.initTTS();
  }
}
