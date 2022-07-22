import '../../../../feature/export/export.dart';
import '../../../remote/api/models/license.dart';
import '../../../remote/api/models/phonetic.dart';
import '../../../remote/api/models/word_model.dart';

class HiveService {
  HiveService._();
  static final instance = HiveService._();

  late final Box _hiveWords;
  Box get getHiveWords => _hiveWords;

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
    List<WordModel> wordList = [];
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

  Future<int> getLanguage() async {
    final Box box = Hive.box("countryBox");
    final int index = await box.getAt(0);
    return index;
  }

  Future<void> setupLanguage() async =>
      await Hive.box("countryBox").add("English-GB");

  Future<void> saveLanguage(int index) async {
    await Hive.box("countryBox").clear();
    await Hive.box("countryBox").add(index);
  }
}
