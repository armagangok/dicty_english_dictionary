import 'package:flutter_tts/flutter_tts.dart';
import 'package:wordmind/database/hive_helper_object.dart';


final FlutterTts flutterTts = FlutterTts();

Future<void> speak(String data) async {
  String language = await hiveHelper.getLanguage();

  await setLanguage(language);
  await flutterTts.setPitch(1);
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.speak("Word is ready!");
  await flutterTts.speak(data);
}

Future<void> pause() async {
  await flutterTts.pause();
}

Future<void> setLanguage(String language) async {
  switch (language) {
    case 'English-UK':
      await flutterTts.setLanguage("en-GB");
      break;

    case 'English-US':
      await flutterTts.setLanguage("en-US");
      break;

    case 'English-IN':
      await flutterTts.setLanguage("en-IN");
      break;

    case 'English-AU':
      await flutterTts.setLanguage("en-AU");
      break;

    case 'English-IE':
      await flutterTts.setLanguage("en-IE");
      break;

    case 'Deutch':
      await flutterTts.setLanguage("de-DE");
      break;

    case 'Turkish':
      await flutterTts.setLanguage("tr-TR");
      break;

    case 'Arabic':
      await flutterTts.setLanguage("ar-SA");
      break;

    case 'French':
      await flutterTts.setLanguage("fr-FR");
      break;

    default:
      await flutterTts.setLanguage("en-GB");
      break;
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
