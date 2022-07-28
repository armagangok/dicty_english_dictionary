import 'package:flutter_tts/flutter_tts.dart';

import '../controller/hive_controller.dart';

class TextToSpeech {
  TextToSpeech._();
  static final instance = TextToSpeech._();

  final FlutterTts flutterTts = FlutterTts();
  final HiveService _hiveService = HiveService.instance;

  Future<void> initTTS() async {
    String lang = await _hiveService.getLanguage();
    await setLanguage(lang);
  }

  Future<void> speakWordOneTime(String phrase) async {
    await initTTS();
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


    // 'English-GB',
    // 'English-US',
    // 'English-IE',
    // 'English-AU',
    // 'English-IN',
    // 'English-ZA',


// ["fr-FR",
// "no-NO",
// "nl-NL",
// "ja-JP",
// "cs-CZ",
// "zh-CN",
// "de-DE",
// "fi-FI",
// "ko-KR",
// "hu-HU",
// "da-DK",
// "ar-SA",
// "zh-HK",
// "es-ES",
// "nl-BE",
// "th-TH",
// "pt-BR",
// "el-GR",
// "en-GB",
// "pt-PT",
// "tr-TR",
// "sk-SK",
// "he-IL",
// "it-IT",
// "es-MX",
// "id-ID",
// "pl-PL",
// "en-AU",
// "sv-SE",
// "hi-IN",
// "en-IE",
// "en-ZA",
// "fr-CA",
// "en-US",
// "ro-RO",
// "ru-RU",
// "zh-TW",
// "en-IN",]
