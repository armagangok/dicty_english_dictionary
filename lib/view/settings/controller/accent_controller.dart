import 'package:english_accent_dictionary/feature/export/export.dart';

class AccentController extends GetxController {
  final WordViewModel _wordViewModel = WordViewModel();

  Rx<dynamic> accent = Rx(null);

  @override
  void onInit() async {
    accent.value = await _wordViewModel.getLanguage();
    super.onInit();
  }

  @override
  void onReady() {
    accent.value == null ? accent.value = -1 : {};
    super.onReady();
  }

  Future<void> saveAccent(int index) async {
    await _wordViewModel.saveLanguage(index);
  }
}
