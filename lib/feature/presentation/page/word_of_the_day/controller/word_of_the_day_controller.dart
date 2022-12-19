import 'dart:convert';

import 'package:english_accent_dictionary/core/helpers/utils/log_helper.dart';
import 'package:intl/intl.dart';

import '../../../../../global/export/export.dart';

class WordOfTheDayController implements BaseWordController {
  WordOfTheDayController._() {
    onInit();
  }
  static final instance = WordOfTheDayController._();

  final _wordService = WordRepositoryImp.instance;
  final dynamic _wordModel = null;

  @override
  List<Definition> noun = [];
  @override
  List<Definition> verb = [];
  @override
  List<Definition> interjection = [];
  @override
  List<Definition> pronoun = [];
  @override
  List<Definition> articles = [];
  @override
  List<Definition> adverb = [];
  @override
  List<Definition> preposition = [];
  @override
  List<Definition> adjective = [];

  get wordModel => _wordModel.value;

  Future<void> onInit() async {
    try {
      _wordModel.value = await _fetchWord(await getDatedWord());
    } on PlatformException catch (e) {
      LogHelper.shared.debugPrint("$e");
    }
  }

  Future<dynamic> _fetchWord(String word) async {
    if (word.isEmpty) {
      return null;
    } else {
      _wordModel.value = await _wordService.fetchWord(word: word);

      for (Meaning element in _wordModel.value!.meanings!) {
        switch (element.partOfSpeech) {
          case "noun":
            for (var element in element.definitions!) {
              noun.add(element);
            }
            break;

          case "verb":
            for (var element in element.definitions!) {
              verb.add(element);
            }
            break;

          case "interjection":
            for (var element in element.definitions!) {
              interjection.add(element);
            }
            break;

          case "pronoun":
            for (var element in element.definitions!) {
              pronoun.add(element);
            }
            break;

          case "articles":
            for (var element in element.definitions!) {
              articles.add(element);
            }
            break;

          case "adverb":
            for (var element in element.definitions!) {
              adverb.add(element);
            }
            break;

          case "preposition":
            for (var element in element.definitions!) {
              preposition.add(element);
            }
            break;

          case "adjective":
            for (var element in element.definitions!) {
              adjective.add(element);
            }
            break;

          default:
        }
      }

      return _wordModel.value;
    }
  }

  Future<String> getDatedWord() async {
    final String response =
        await rootBundle.loadString('assets/data/data.json');
    final data = await json.decode(response);

    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');

    return data[formatter.format(now)];
  }
}
