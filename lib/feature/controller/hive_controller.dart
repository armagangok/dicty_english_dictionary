// ignore_for_file: overridden_fields

import '../../global/export/export.dart';

class HiveController extends BaseWordController {
  HiveController._();
  static final instance = HiveController._();

  @override
  late RxList<Definition> adjective = RxList([]);
  @override
  RxList<Definition> adverb = RxList([]);
  @override
  RxList<Definition> articles = RxList([]);
  @override
  RxList<Definition> interjection = RxList([]);
  @override
  RxList<Definition> noun = RxList([]);
  @override
  RxList<Definition> preposition = RxList([]);
  @override
  RxList<Definition> pronoun = RxList([]);
  @override
  RxList<Definition> verb = RxList([]);

  RxList<WordModel> wordList = RxList([]);
  late final Box<WordModel> _hiveWords;

  Box<WordModel> get getHiveBox => _hiveWords;

  Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(WordModelAdapter());
    Hive.registerAdapter(DefinitionAdapter());
    Hive.registerAdapter(LicenseAdapter());
    Hive.registerAdapter(MeaningAdapter());
    Hive.registerAdapter(PhoneticAdapter());

    _hiveWords = await Hive.openBox<WordModel>("hiveWords");
    await Hive.openBox("countryBox");
  }

  Future<void> addData(WordModel word) async {
    await _hiveWords.add(word);
  }

  List<WordModel> getAll() {
    wordList.clear();

    for (WordModel word in _hiveWords.values) {
      wordList.add(word);
    }
    return wordList;
  }

  Future<void> deleteData(index) async {
    await _hiveWords.deleteAt(index);
  }

  WordModel getData(int index) {
    return _hiveWords.getAt(index) as WordModel;
  }

  Future<String> getLanguage() async {
    final Box box = Hive.box("countryBox");
    final String index = await box.getAt(0);

    return index;
  }

  Future<void> setupLanguage() async =>
      await Hive.box("countryBox").add("English-GB");

  Future<void> saveLanguage(String lang) async {
    await Hive.box("countryBox").clear();
    await Hive.box("countryBox").add(lang);
  }

  Future<void> deleteByName(WordModel wordModel) async {
    final Map<dynamic, WordModel> deliveriesMap = _hiveWords.toMap();
    dynamic desiredKey;
    deliveriesMap.forEach((key, value) {
      if (value.isSelected) {
        desiredKey = key;
      }
    });
    await _hiveWords.delete(desiredKey);
  }

  Future<void> save(int index, WordModel value) async {
    await _hiveWords.putAt(index, value);
  }

  Future<void> deleteAllWords() async {
    await _hiveWords.clear();
  }

  void fetchWord(WordModel wordModel) {
    _clearList();
    for (Meaning element in wordModel.meanings!) {
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
  }

  void _clearList() {
    noun.clear();
    verb.clear();
    interjection.clear();
    pronoun.clear();
    articles.clear();
    adverb.clear();
    preposition.clear();
    adjective.clear();
  }
}
