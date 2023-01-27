// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import '../../../../global/export/export.dart';

// class RecentDetailPage extends StatefulWidget {
//   const RecentDetailPage({
//     Key? key,
//     required this.wordModel,
//   }) : super(key: key);

//   final WordModel wordModel;

//   @override
//   State<RecentDetailPage> createState() => _SearchResultPageState();
// }

// class _SearchResultPageState extends State<RecentDetailPage> {
//   @override
//   void initState() {
//     _navigator = getIt.call<NavigationService>();
//     _localCubit = getIt.call<LocalCubit>();

//     super.initState();
//   }

//   late final NavigationService _navigator;
//   late final LocalCubit _localCubit;

//   @override
//   Widget build(BuildContext context) => GestureDetector(
//         onTap: () => context.dismissKeyboard(),
//         child: Scaffold(
//           appBar: _buildAppBar,
//           body: _buildBody,
//         ),
//       );

//   CustomAppBar get _buildAppBar => CustomAppBar(
//         title: const Text("Result"),
//         onTap: () => _navigator.getBack(),
//       );

//   Widget get _buildBody => BlocBuilder<LocalCubit, LocalState>(
//         bloc: _localCubit,
//         builder: (context, state) {
//           if (state is LocalFailed) {
//             return MyErrorWidget(
//               errorModel: ErrorModel(
//                 message: state.errorMessage,
//                 title: state.errorTitle,
//               ),
//             );
//           } else {
//             return WordWidget(
//               wordModel: widget.wordModel,
//               cubit: _localCubit,
//               tabCubit: getIt.call<TabCubit>(),
//             );
//           }
//         },
//       );
// }
