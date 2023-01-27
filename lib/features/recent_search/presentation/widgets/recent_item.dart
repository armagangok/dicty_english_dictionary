// import 'dart:ui';

// import 'package:flutter/material.dart';

// import '../../../../../global/export/export.dart';

// class RecentItem extends StatelessWidget {
//   const RecentItem({
//     Key? key,
//     required this.wordModel,
//     required this.index,
//     required this.searchCubit,
//   }) : super(key: key);

//   final SearchCubit searchCubit;
//   final WordModel wordModel;
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         searchCubit.fetchWord(word: "word");

//         showDialog(
//           context: context,
//           builder: ((context) => buildDialog()),
//         );
//       },
//       child: Row(
//         children: [
//           // RadioWidget(
//           //   radioController: RadioController(),
//           //   index: index,
//           // ),
//           Expanded(
//             child: Text(
//               "${wordModel.word}",
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   //

//   Widget buildDialog() {
//     return Builder(
//       builder: (context) {
//         return BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 0.7, sigmaY: 0.7),
//           child: Dialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16.0),
//             ),
//             child: FittedBox(
//               child: SizedBox(
//                 height: context.height(0.7),
//                 width: context.width(1),
//                 child: ListView(
//                   shrinkWrap: true,
//                   physics: const ClampingScrollPhysics(),
//                   children: [
//                     WordWidget(
//                       controller: searchCubit,
//                       wordModel: wordModel,
//                       tabCubit: getIt.call<TabCubit>(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
