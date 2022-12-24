import 'package:english_accent_dictionary/core/theme/contract/theme.dart';

import '../../../global/export/export.dart';

class Initialization {
  static final instance = Initialization._();
  Initialization._();

  Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    initDependencies();

    await HiveHelper.shared.initializeHive();

    await getIt.call<LocalWordUsecase>().setupLanguage();
    await getIt.call<ThemeService>().initTheme();

    await TextToSpeech.instance.initTTS();
  }
}
