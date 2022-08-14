import '../export/export.dart';

class ListController extends GetxController {
  final RxBool _isExtended = false.obs;
  get isExtended => _isExtended.value;

  void exrend() => _isExtended.value = !_isExtended.value;
}
