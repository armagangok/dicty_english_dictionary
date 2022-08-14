// import '../../../feature/export/export.dart';

// const int _maxFailedLoadAttempts = 10;

// class AdController extends GetxController {
//   int _interstitialLoadAttempts = 0;
//   InterstitialAd? _interstitialAd;

//   @override
//   void onInit() {
//     createInterstitialAd();
//     super.onInit();
//   }

//   @override
//   InternalFinalCallback<void> get onDelete {
//     _interstitialAd?.dispose();
//     return super.onDelete;
//   }

//   void createInterstitialAd() async {
//     await InterstitialAd.load(
//       adUnitId: AdHelper.interstitialAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           _interstitialAd = ad;
//           _interstitialLoadAttempts = 0;
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           _interstitialLoadAttempts += 1;
//           _interstitialAd = null;
//           if (_interstitialLoadAttempts <= _maxFailedLoadAttempts) {
//             createInterstitialAd();
//           }
//         },
//       ),
//     );
//   }

//   //

//   Future<void> showInterstitialAd() async {
//     if (_interstitialAd != null) {
//       _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//           onAdDismissedFullScreenContent: (InterstitialAd ad) {
//         ad.dispose();
//         createInterstitialAd();
//         Get.back();
//       }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//         ad.dispose();
//         createInterstitialAd();
//         Get.back();
//       });

//       await _interstitialAd!.show();
//     }
//   }
// }
