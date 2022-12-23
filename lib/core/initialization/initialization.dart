import '../../../global/export/export.dart';
import '../helpers/hive/hive_helper.dart';

class Initialization {
  static final instance = Initialization._();
  Initialization._();

  Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    initDependencies();

    await HiveHelper.shared.initializeHive();

    await getIt.call<LocalWordUsecase>().setupLanguage();

    await TextToSpeech.instance.initTTS();
  }
}
