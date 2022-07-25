import 'package:flutter_tts/flutter_tts.dart';

import '../../core/local/database/services/hive_service.dart';
import '../../core/remote/api/models/word_model.dart';

class TextToSpeech {
  TextToSpeech._();
  static final instance = TextToSpeech._();

  final FlutterTts flutterTts = FlutterTts();
  final HiveService _hiveService = HiveService.instance;

  Future<void> initTTS() async {
    int index = await _hiveService.getLanguage();
    await setLanguage(index);
  }

  Future<void> speakWord(WordModel data) async {
    await initTTS();
    String willBeSpoken = "";
    await flutterTts.speak("Word is ready!");
    for (var element in data.meanings!) {
      for (var definition in element.definitions!) {
        willBeSpoken += "." + definition.definition!;
      }
    }
    await flutterTts.speak(
      "${data.word}.  $willBeSpoken",
    );
  }

  Future<void> speakWordOneTime(String phrase) async {
    await initTTS();
    await flutterTts.speak(phrase);
  }

  // Future<void> pause() async {
  //   await flutterTts.pause();
  // }

  Future<void> setLanguage(int index) async {
    switch (index) {
      case 0:
        await flutterTts.setLanguage("en-GB");
        break;

      case 1:
        await flutterTts.setLanguage("en-US");
        break;

      case 2:
        await flutterTts.setLanguage("en-AU");
        break;

      case 3:
        await flutterTts.setLanguage("en-IE");
        break;

      case 4:
        await flutterTts.setLanguage("en-IN");
        break;

      case 5:
        await flutterTts.setLanguage("en-ZA");
        break;

      default:
        await flutterTts.setLanguage("en-US");
        break;
    }
  }
}


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
