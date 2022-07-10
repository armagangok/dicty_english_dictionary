import 'package:english_accent_dictionary/feature/export/export.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

import '../../../feature/data/data.dart';

class DataController extends GetxController {
  Rx<WordModel?> wordModel = Rx(null);
  final WordController wordController = WordController();

  @override
  void onInit() async {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');

    wordModel.value =
        await wordController.fetchDaiyWord(map[formatter.format(now)]);

    super.onInit();
  }
}
