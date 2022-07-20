import '../../../feature/export/export.dart';

class RecentController extends GetxController {
  RxList<HiveWord> hiveList = RxList([]);

  fetchHiveWords() async {
    for (var element in Hive.box('words').values) {
      hiveList.add(element);
    }
  }

  @override
  void onInit() {
    fetchHiveWords();
    super.onInit();
  }
}
