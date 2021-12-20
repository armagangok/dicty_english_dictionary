import 'package:english_accent_dictionary/core/database/hive_helper.dart';
import 'package:english_accent_dictionary/core/database/word_hive_model.dart';
import 'package:flutter_tts/flutter_tts.dart';


final FlutterTts flutterTts = FlutterTts();

Future<void> speakWord(Word data) async {
  String language = await hiveHelper.getLanguage();
  await setLanguage(language);
  await flutterTts.speak("Word is ready!");
  await flutterTts.speak(
    "${data.word}. First meaning; ${data.meaning1}. Second meaning is; ${data.meaning2}. Example: ${data.example}",
  );
}

Future<void> speakWordOneTime(String phrase) async {
  String language = await hiveHelper.getLanguage();
  await setLanguage(language);
  await flutterTts.speak(phrase);
}

Future<void> pause() async {
  await flutterTts.pause();
}

Future<void> setLanguage(String language) async {
  switch (language) {
    case 'English-GB':
      await flutterTts.setLanguage("en-GB");
      break;

    case 'English-US':
      await flutterTts.setLanguage("en-US");
      break;

    case 'English-AU':
      await flutterTts.setLanguage("en-AU");
      break;

    case 'English-IE':
      await flutterTts.setLanguage("en-IE");
      break;

    case 'English-IN':
      await flutterTts.setLanguage("en-IN");
      break;

    case 'English-ZA':
      await flutterTts.setLanguage("en-ZA");
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
