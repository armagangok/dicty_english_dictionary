import 'package:english_accent_dictionary/feature/export/export.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../feature/data/data.dart';

class DataController extends GetxController {
  Rx<dynamic> wordModel = Rx(null);
  final WordController wordController = WordController();

  @override
  void onInit() async {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');

    try {
      wordModel.value =
          await wordController.fetchDailyWord(map[formatter.format(now)]);
    } on PlatformException catch (e) {
      Get.showSnackbar(GetSnackBar(messageText: Text("${e.message}")));
    }

    super.onInit();
  }

  @override
  void onReady() {
    wordModel.value ??= 0;
    super.onReady();
  }
}
