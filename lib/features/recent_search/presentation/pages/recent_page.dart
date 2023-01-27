// import 'package:flutter/material.dart';

// import '../../../../global/export/export.dart';

// class RecentPage extends StatefulWidget {
//   const RecentPage({Key? key}) : super(key: key);

//   @override
//   State<RecentPage> createState() => _RecentPageState();
// }

// class _RecentPageState extends State<RecentPage> {
//   late final RecentCubit _recentCubit;
//   late final LocalCubit _localCubit;

//   @override
//   void initState() {
//     _recentCubit = getIt.call<RecentCubit>();
//     _localCubit = getIt.call<LocalCubit>();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: _buildAppBar(),
//         body: _buildBody(),
//       );

//   Widget _buildBody() => BlocBuilder<RecentCubit, RecentState>(
//         bloc: _recentCubit,
//         builder: (context, state) => ValueListenableBuilder(
//           valueListenable: _localCubit.getHiveBox.listenable(),
//           builder: (context, Box<String> wordBox, _) {
//             List<String> a = [];

//             for (var element in wordBox.values) {
//               a.add(element);
//             }

//             return wordBox.isEmpty
//                 ? _noRecentSearch()
//                 : Column(
//                     children: [
//                       _deleteWidget(),
//                       _recentBuilder(a),
//                       // Expanded(
//                       //   child: ListView(
//                       //     shrinkWrap: true,
//                       //     physics: const ClampingScrollPhysics(),
//                       //     children: [

//                       //     ],
//                       //   ),
//                       // ),
//                     ],
//                   );
//           },
//         ),
//       );

//   Widget _deleteWidget() => Builder(
//         builder: (context) => AnimatedContainer(
//           height: _recentCubit.isEditting ? context.height(0.07) : 0,
//           color: const Color.fromARGB(255, 141, 160, 255).withOpacity(0.2),
//           duration: const Duration(milliseconds: 300),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _deleteButton,
//               _deleteAllButton,
//             ],
//           ),
//         ),
//       );

//   TextButton get _deleteAllButton => TextButton(
//         onPressed: () async {
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return IosDeleteDialog(
//                   title: "Warning",
//                   message: "Do you want to delete all items?",
//                   dialogAction: () async {
//                     await _localCubit.deleteAllWords();
//                   },
//                 );
//               });
//         },
//         child: const Text(
//           KString.deleteAll,
//           style: TextStyle(color: Colors.red),
//         ),
//       );

//   Widget get _deleteButton => TextButton(
//         onPressed: () async {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return IosDeleteDialog(
//                 title: "Warning",
//                 message: "Do you want to delete selected items?",
//                 dialogAction: () => _localCubit.wordList.forEach(
//                   (element) async => await _localCubit.deleteByName(element),
//                 ),
//               );
//             },
//           );
//         },
//         child: const Text(
//           KString.delete,
//           style: TextStyle(color: Colors.red),
//         ),
//       );

//   CustomAppBar _buildAppBar() => CustomAppBar(
//         title: const Text(KString.recent),
//         widget: Builder(
//           builder: (context) => TextButton(
//             style: ButtonStyle(
//                 padding: MaterialStateProperty.all(EdgeInsets.zero)),
//             onPressed: () {
//               _recentCubit.edit();
//             },
//             child: Text(
//               _recentCubit.isEditting ? KString.done : KString.edit,
//               style: context.textTheme.bodyMedium!.copyWith(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       );

// //
//   Widget _recentBuilder(List<String> wordList) => Builder(
//         builder: (context) {
//           return _recentCubit.isEditting
//               ? editListView(wordList)
//               : listView(wordList);
//         },
//       );

//   ListView listView(List<String> wordList) {
//     return ListView.separated(
//       separatorBuilder: (context, index) => const Divider(),
//       shrinkWrap: true,
//       physics: const ClampingScrollPhysics(),
//       itemCount: wordList.length,
//       itemBuilder: (context, index) {
//         var word = wordList[index];

//         return ListTile(
//           onTap: () async {
//             await _localCubit.fetchWord(word: word);

//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => RecentDetailPage(
//                   wordModel: word,
//                 ),
//               ),
//             );
//           },
//           title: Text(
//             word,
//             style: context.textTheme.bodyMedium!.copyWith(
//               color: context.primary,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   ListView editListView(List<String> wordList) => ListView.separated(
//         padding: EdgeInsets.zero,
//         separatorBuilder: (context, index) => const Divider(),
//         shrinkWrap: true,
//         physics: const ClampingScrollPhysics(),
//         itemCount: wordList.length,
//         itemBuilder: (context, index) => CheckboxListTile(
//           activeColor: KColor.deepOrange,
//           value: wordList[index].isSelected,
//           onChanged: (val) async {
//             var word = wordList[index];
//             word.isSelected = val!;
//             await _localCubit.updateWord(index, word);
//           },
//           title: Text(
//             wordList[index].word ?? "null",
//             style: context.textTheme.bodyMedium!.copyWith(
//               color: context.primary,
//             ),
//           ),
//         ),
//       );

// //
//   Widget _noRecentSearch() => Builder(
//         builder: (context) => Center(
//           child: Padding(
//             padding: context.lowPadding,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 MyErrorWidget(
//                   errorModel: ErrorModel(
//                     title: KString.resultViewSearchTitle,
//                     message: KString.resultViewResultMessage,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
// }
