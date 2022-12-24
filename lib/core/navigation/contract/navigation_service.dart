abstract class NavigationService {
  Future<void> navigateTo({required String path, Object? data});
  Future<void> navigaToClear({required String path, Object? data});
  void getBack();
}
