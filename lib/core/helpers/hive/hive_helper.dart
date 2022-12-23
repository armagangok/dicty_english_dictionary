import '../../../global/export/export.dart';

class HiveHelper {
  HiveHelper._();
  static final shared = HiveHelper._();

  Future<void> initializeHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(WordModelAdapter());
    Hive.registerAdapter(DefinitionAdapter());
    Hive.registerAdapter(LicenseAdapter());
    Hive.registerAdapter(MeaningAdapter());
    Hive.registerAdapter(PhoneticAdapter());

    await Hive.openBox<int>(HiveBoxes.countryBox);
    await Hive.openBox<WordModel>(HiveBoxes.wordBox);
  }

  T? getData<T>(String boxName, dynamic key) {
    var box = Hive.box<T>(boxName);
    return box.get(key);
  }

  Future<void> deleteData<T>(String boxName, dynamic key) async {
    var box = Hive.box<T>(boxName);
    await box.delete(key);
  }

  Future<void> deleteDataAt<T>(String boxName, int index) async {
    var box = Hive.box<T>(boxName);
    await box.deleteAt(index);
  }

  Future<void> deleteAll<T>(String boxName, Iterable<dynamic> keys) async {
    var box = Hive.box<T>(boxName);
    await box.deleteAll(keys);
  }

  Future<void> putData<T>(String boxName, dynamic key, T data) async {
    var box = Hive.box<T>(boxName);
    await box.put(key, data);
  }

  Future<void> putAllData<T>(String boxName, Map<dynamic, T> data) async {
    var box = Hive.box<T>(boxName);
    await box.putAll(data);
  }

  Future<List<T>> getAll<T>(String boxName) async {
    var box = Hive.box<T>(boxName);
    return box.values.toList();
  }

  T? getAt<T>(int index, String boxName) {
    var box = Hive.box<T>(boxName);
    var response = box.getAt(index);
    return response;
  }

  Future<int> addData<T>(String boxName, T dataToAdd) async {
    var box = Hive.box<T>(boxName);
    return box.add(dataToAdd);
  }

  Future<void> clearBox<T>(String boxName) async {
    var box = Hive.box<T>(boxName);
    await box.clear();
  }

  Future<void> putDataAt<T>(String boxName, T dataToAdd, int index) async {
    var box = Hive.box<T>(boxName);
    await box.putAt(index, dataToAdd);
  }
}
