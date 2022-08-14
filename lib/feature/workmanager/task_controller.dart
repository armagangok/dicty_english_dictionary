// import 'package:english_accent_dictionary/core/utils/log_helper.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// import 'package:workmanager/workmanager.dart';

// class TaskController extends GetxController {
//   TaskController._();
//   static final instance = TaskController._();

//   final Workmanager _workmanager = Workmanager();
//   static const task = "repeatSpeaking";

//   myTask() {
//     final String uniqeID = "${DateTime.now().second}";
//     _workmanager.registerPeriodicTask(
//       uniqeID,
//       task,
//       frequency: const Duration(minutes: 15),
//       initialDelay: const Duration(seconds: 3),
//     );
//     Future.value(true);
//   }

//   initWorkmanager() {
//     _workmanager.initialize(
//       callbackDispatcher,
//       isInDebugMode: true,
//     );
//   }

//   Future<void> cancelAllTasks() async {
//     await _workmanager.cancelAll();
//   }
// }

// void callbackDispatcher() {
//   Workmanager().executeTask(
//     (a, inputData) {
//       LogHelper.shared.debugPrint(a);

//       sayHello();

//       return Future.value(true);
//     },
//   );
// }

// void sayHello() {
//   LogHelper.shared.debugPrint("helloooooooooo!");
// }
