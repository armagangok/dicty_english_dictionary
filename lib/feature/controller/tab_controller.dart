import '../export/export.dart';

class TabBarController extends GetxController {
  final RxInt currentIndex = RxInt(0);

  changeIndex(newIndex) {
    currentIndex.value = newIndex;
    notifyChildrens();
  }
}
