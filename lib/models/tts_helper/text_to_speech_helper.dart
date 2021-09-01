import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();

void speak(String data) async {
  print(await flutterTts.getLanguages);

  await flutterTts.setPitch(1);
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.speak(data);
}

languageController(language) async {
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
