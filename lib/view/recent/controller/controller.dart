import 'package:english_accent_dictionary/feature/export/export.dart';
import 'package:get/state_manager.dart';

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
