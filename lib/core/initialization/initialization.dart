import '../../../global/export/export.dart';
import '../helpers/hive/hive_helper.dart';

class Initialization {
  Initialization._();
  static final instance = Initialization._();

  Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    await HiveHelper.shared.initializeHive();

    var _prefs = await SharedPreferences.getInstance();

    if (_prefs.getInt("firstRun") == null) {
      await HiveController.instance.setupLanguage();
      await _prefs.setInt("firstRun", 1);
    }

    await TextToSpeech.instance.initTTS();
  }
}
