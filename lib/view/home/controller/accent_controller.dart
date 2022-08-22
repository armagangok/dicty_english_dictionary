import 'package:english_accent_dictionary/core/initialization/injection/injection.dart';

import '../../../feature/export/export.dart';

class AccentController extends GetxController {
  final _hiveService = Injection.instance.locator.get<HiveController>();

  final Rx<dynamic> accent = Rx(null);

  @override
  void onInit() async {
    accent.value = await _hiveService.getLanguage();
    super.onInit();
  }

  @override
  void onReady() {
    accent.value == null ? accent.value = -1 : {};
    super.onReady();
  }

  Future<void> saveAccent(String lang) async {
    await _hiveService.saveLanguage(lang);
  }
}
