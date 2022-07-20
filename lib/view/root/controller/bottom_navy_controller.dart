import 'package:get/state_manager.dart';

class BottomNavyController extends GetxController {
  RxInt currentIndex = RxInt(0);

  changeIndex(int index) {
    currentIndex.value = index;
  }
}
