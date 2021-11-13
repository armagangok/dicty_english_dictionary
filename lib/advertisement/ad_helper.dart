import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3284743895748498/9480559801";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3284743895748498/9448770217";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
