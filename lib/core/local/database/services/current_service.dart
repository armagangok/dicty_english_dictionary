import '../../../../feature/export/export.dart';
import 'base_service.dart';

class CurrentDBService implements HiveBaseService {
  String content = "String";


  @override
  Future<void> addData(HiveWord word) async =>
      await Hive.box("words").add(word);

  @override
  Future<void> deleteData(index) async =>
      await Hive.box("words").deleteAt(index);

  @override
  Future<int> getLanguage() async {
    final Box box = Hive.box("countryBox");
    final int index = await box.getAt(0);
    return index;
  }

  

  @override
  HiveWord getData(int index) => Hive.box("words").getAt(index) as HiveWord;

  @override
  Future<void> setupLanguage() async =>
      await Hive.box("countryBox").add("English-GB");

  @override
  Future<void> saveLanguage(int index) async {
    await Hive.box("countryBox").clear();
    await Hive.box("countryBox").add(index);
  }
}
