// import '../../../../../global/export/export.dart';

// class AccentController {
//   AccentController._() {
//     onInit();
//     onReady();
//   }
//   static final instance = AccentController._();

//   final _hiveService = getIt.call<SearchCubit>();

//   dynamic accent;

//   void onInit() async {
//     accent.value = await _hiveService.getLanguage();
//   }

//   void onReady() {
//     accent == null ? accent = -1 : {};
//   }

//   Future<void> saveAccent(String lang) async {
//     await _hiveService.saveLanguage(lang);
//   }
// }
