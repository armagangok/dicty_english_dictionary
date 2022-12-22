import '../../../domain/usecase/local_word_usecase.dart';
import '../../../global/export/export.dart';

class TextToSpeech {
  TextToSpeech._();
  static final instance = TextToSpeech._();

  final FlutterTts flutterTts = FlutterTts();
  final _localUsecase = getIt.call<LocalWordUsecase>();

  Future<void> initTTS() async {
    var response = await _localUsecase.getLanguage();

    response.fold(
      (l) => print(l),
      (r) => print(r),
    );
  }

  Future<void> speakWordOneTime(String phrase) async {
    await initTTS();
    await flutterTts.speak(phrase);
  }

  Future<void> speak(String phrase) async {
    await flutterTts.speak(phrase);
  }

  Future<void> setLanguage(String language) async {
    switch (language) {
      case "English-GB":
        await flutterTts.setLanguage("en-GB");
        break;

      case "English-US":
        await flutterTts.setLanguage("en-US");
        break;

      case "English-AU":
        await flutterTts.setLanguage("en-AU");
        break;

      case "English-IN":
        await flutterTts.setLanguage("en-IN");
        break;

      case "English-ZA":
        await flutterTts.setLanguage("en-ZA");
        break;

      case "English-IE":
        await flutterTts.setLanguage("en-IE");
        break;

      default:
        await flutterTts.setLanguage("en-GB");
        break;
    }
  }
}
