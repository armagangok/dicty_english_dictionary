import 'package:english_accent_dictionary/core/local/database/services/hive_service.dart';
import 'package:english_accent_dictionary/core/remote/api/models/word_model.dart';
import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts flutterTts = FlutterTts();

Future<void> speakWord(WordModel data, context) async {
  // int index = await HiveService.instance.getLanguage();
  // await setLanguage(index);
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
  int index = await HiveService.instance.getLanguage();
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
