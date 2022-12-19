class TabBarController {
  TabBarController._();
  static final instance = TabBarController._();

  int currentIndex = 0;

  changeIndex(newIndex) {
    currentIndex = newIndex;
  }
}
