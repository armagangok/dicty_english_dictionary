import 'package:english_accent_dictionary/feature/export/export.dart';

class AccentController extends GetxController {
  final WordViewModel _wordViewModel = WordViewModel();

  Rx<dynamic> value = Rx(null);

  @override
  void onInit() async {
    value.value = await _wordViewModel.getLanguage();
    super.onInit();
  }

  @override
  void onReady() {
    value.value == null ? value.value = -1 : {};
    super.onReady();
  }

  Future<void> saveAccent(int index) async {
    await _wordViewModel.saveLanguage(index);
  }
}
