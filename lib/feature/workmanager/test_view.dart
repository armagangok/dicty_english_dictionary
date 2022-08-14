// import 'package:english_accent_dictionary/feature/workmanager/task_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/instance_manager.dart';

// class TestView extends StatelessWidget {
//   TestView({Key? key}) : super(key: key);

//   final TaskController _taskController = Get.put(TaskController.instance);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           TextButton(
//             onPressed: () async {
//               await _taskController.myTask();
//             },
//             child: const Text("Execute The Task"),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           TextButton(
//             onPressed: () async {
//               await _taskController.cancelAllTasks();
//             },
//             child: const Text("Stop The Task"),
//           ),
//         ],
//       ),
//     );
//   }
// }
