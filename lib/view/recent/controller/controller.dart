
import '../../../feature/export/export.dart';
import '../../../feature/model/word_model.dart';

class RecentController extends GetxController {
  RxList<WordModel> hiveList = RxList([]);

  fetchHiveWords() async {
    for (var element in Hive.box<WordModel>('hiveWords').values) {
      hiveList.add(element);
    }
  }

  @override
  void onInit() {
    fetchHiveWords();
    super.onInit();
  }
}
