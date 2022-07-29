import '../../../feature/export/export.dart';

class RecentController extends GetxController {
  RxList<WordModel> hiveList = RxList([]);

  _fetchHiveWords() async {
    for (var element in Hive.box<WordModel>('hiveWords').values) {
      hiveList.add(element);
    }
  }

  @override
  void onInit() {
    _fetchHiveWords();
    super.onInit();
  }
}
