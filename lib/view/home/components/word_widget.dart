// import 'package:flutter/material.dart';

// import 'package:english_accent_dictionary/core/remote/api/models/definition.dart';

// import '../../../core/remote/api/models/word_model.dart';
// import '../../../feature/export/export.dart';

// class WordWidget extends StatelessWidget {
//   final WordModel wordModel;
//   const WordWidget({
//     Key? key,
//     required this.wordModel,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.symmetric(
//         horizontal: context.width(0.05),
//       ),
//       physics: const ClampingScrollPhysics(),
//       shrinkWrap: true,
//       children: [
//         wordWidgetAndSpeakButton(),
//         const SizedBox001(),
//         Text(
//           "DEFINITIONS",
//           style: context.textTheme.headline6!.copyWith(),
//         ),
//         ListView.separated(
//           separatorBuilder: (context, index) => const SizedBox001(),
//           physics: const ClampingScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: wordModel.meanings!.length,
//           itemBuilder: (context, index) {
//             final List<Definition> definitions =
//                 wordModel.meanings![index].definitions!;
//             final partOfSpeech = wordModel.meanings![index].partOfSpeech;

//             return ListView.separated(
//               separatorBuilder: (context, index) => const SizedBox001(),
//               physics: const ClampingScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: definitions.length,
//               itemBuilder: (context, index) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     definitions[index].definition == null
//                         ? const SizedBox()
//                         : definitionText(definitions[index]),
//                     partOfSpeech == null
//                         ? const SizedBox()
//                         : partOfSpeechText(partOfSpeech),
//                     definitions[index].example == null
//                         ? const SizedBox()
//                         : exampleText(definitions[index]),
//                   ],
//                 );
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }

//   //

//   Widget wordWidgetAndSpeakButton() {
//     return Builder(builder: (context) {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text(
//             wordModel.word!,
//             style: context.textTheme.headline6!.copyWith(
//               color: const Color.fromARGB(255, 255, 17, 0),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               physics: const ClampingScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: wordModel.phonetics!.length,
//               itemBuilder: (context, index) {
//                 return Text(wordModel.phonetics![index].text ?? "");
//               },
//             ),
//           ),
//           // SpeakButton(data: wordModel.word!),
//         ],
//       );
//     });
//   }

//   //

//   Widget definitionText(Definition definition) {
//     return Builder(builder: (context) {
//       return RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: "Definition: ",
//               style: context.textTheme.bodyMedium!.copyWith(
//                 color: Colors.blue,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//             TextSpan(
//               text: definition.definition,
//               style: context.textTheme.bodySmall!.copyWith(),
//             ),
//           ],
//         ),
//       );
//     });
//   }

//   //

//   Widget partOfSpeechText(String partOfSpeech) {
//     return Builder(builder: (context) {
//       return RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: "Part Of Speech: ",
//               style: context.textTheme.bodyMedium!.copyWith(
//                 color: const Color.fromARGB(255, 255, 113, 19),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             TextSpan(
//               text: partOfSpeech,
//               style: context.textTheme.bodySmall!.copyWith(),
//             ),
//           ],
//         ),
//       );
//     });
//   }

//   //

//   Widget exampleText(Definition definitions) {
//     return Builder(builder: (context) {
//       return RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: "Example: ",
//               style: context.textTheme.bodyMedium!.copyWith(
//                 color: Colors.green,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//             TextSpan(
//               text: definitions.example,
//               style: context.textTheme.bodySmall!.copyWith(),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
