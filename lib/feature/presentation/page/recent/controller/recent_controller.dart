import '../../../../../global/export/export.dart';


class RecentController extends GetxController {
  RecentController._();
  static final instance = RecentController._();

  final RxBool _isEditting = RxBool(false);
  final RxBool _isExtended = true.obs;
  final RxList<bool> _choosenItemList = RxList();

  bool get isEditting => _isEditting.value;
  bool get isExtended => _isExtended.value;
  List<bool> get choosenItemList => _choosenItemList;

  void edit() => _isEditting.value = !_isEditting.value;
  void extend() => _isExtended.value = !_isExtended.value;
}
