import 'dart:convert';

import 'package:english_accent_dictionary/core/helpers/log_helper.dart';
import 'package:english_accent_dictionary/data/entity/word_entity.dart';

import 'package:intl/intl.dart';

import '../../../../../global/export/export.dart';
import '../../../domain/usecase/remote_word_usecase.dart';

class WordOfTheDayController implements BaseWordController {
  WordOfTheDayController._() {
    onInit();
  }
  static final instance = WordOfTheDayController._();

  final _wordUsecase = getIt.call<RemoteWordUsecase>();
  dynamic _wordModel;

  @override
  List<WordEntity> noun = [];
  @override
  List<WordEntity> verb = [];
  @override
  List<WordEntity> interjection = [];
  @override
  List<WordEntity> pronoun = [];
  @override
  List<WordEntity> articles = [];
  @override
  List<WordEntity> adverb = [];
  @override
  List<WordEntity> preposition = [];
  @override
  List<WordEntity> adjective = [];

  get wordModel => _wordModel.value;

  Future<void> onInit() async {
    try {
      _wordModel = await _fetchWord(await getDatedWord());
    } on PlatformException catch (e) {
      LogHelper.shared.debugPrint("$e");
    }
  }

  Future<dynamic> _fetchWord(String word) async {
    if (word.isEmpty) {
      return null;
    } else {
      _wordModel = await _wordUsecase.fetchWord(word: word);

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
