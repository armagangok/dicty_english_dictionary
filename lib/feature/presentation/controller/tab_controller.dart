import '../../../../global/export/export.dart';

class TabBarController extends GetxController {
  TabBarController._();
  static final instance = TabBarController._();
  final RxInt currentIndex = RxInt(0);

  changeIndex(newIndex) {
    currentIndex.value = newIndex;
    notifyChildrens();
  }
}
