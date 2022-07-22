import '../../../core/local/database/services/hive_service.dart';
import '../../../feature/export/export.dart';

class AccentController extends GetxController {

  Rx<dynamic> accent = Rx(null);

  @override
  void onInit() async {
    accent.value = await HiveService.instance.getLanguage();
    super.onInit();
  }

  @override
  void onReady() {
    accent.value == null ? accent.value = -1 : {};
    super.onReady();
  }

  Future<void> saveAccent(int index) async {
    await HiveService.instance.saveLanguage(index);
  }
}
