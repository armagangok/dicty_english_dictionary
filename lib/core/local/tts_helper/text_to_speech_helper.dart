import 'package:flutter_tts/flutter_tts.dart';

import '../database/models/word_hive_model.dart';
import '../database/viewmodels/word_viewmodel.dart';

final FlutterTts flutterTts = FlutterTts();

Future<void> speakWord(HiveWord data, context) async {
  final WordViewModel _wordViewModel = WordViewModel();
  int index = await _wordViewModel.getLanguage();
  await setLanguage(index);
  await flutterTts.speak("Word is ready!");
  await flutterTts.speak(
    "${data.word}. First meaning; ${data.meaning1}. Second meaning is; ${data.meaning2}. Example: ${data.example}",
  );
}

Future<void> speakWordOneTime(String phrase) async {
  final WordViewModel _wordViewModel = WordViewModel();
  int index = await _wordViewModel.getLanguage();
  await setLanguage(index);
  await flutterTts.speak(phrase);
}

Future<void> pause() async {
  await flutterTts.pause();
}

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
