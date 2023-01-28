
import '../../global/injection.dart';

import '../../../global/export/export.dart';

class Initialization {
  static final instance = Initialization._();
  Initialization._();

  Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    initDependencies();

    await HiveHelper.shared.initializeHive();

    // await localWordUsecase.setupLanguage();
    await themeService.initTheme();

    // await TextToSpeech.instance.initTTS();
  }
}
