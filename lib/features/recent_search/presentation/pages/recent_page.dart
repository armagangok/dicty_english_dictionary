// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';
import '../widgets/delete_widget.dart';
import '../widgets/edit_listview_widget.dart';
import '../widgets/listview_widget.dart';
import '../widgets/no_search_widget.dart';
import '../widgets/recent_app_bar.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const RecentAppBar(),
        body: _buildBody(),
      );

  Widget _buildBody() => BlocBuilder<RecentCubit, RecentState>(
        bloc: Injection.recentCubit,
        builder: (context, state) => ValueListenableBuilder(
          valueListenable: Injection.localCubit.getHiveBox.listenable(),
          builder: (context, Box<String> wordBox, _) {
            List<WordResponse> wordList = [];
            for (var element in wordBox.values) {
              var model = WordResponse.fromJson(jsonDecode(element));
              wordList.add(model);
            }
            Injection.localCubit.setWordList = wordList;

            return wordBox.isEmpty
                ? const NoRecentSearchWidget()
                : Column(
                    children: [
                      const DeleteWidget(),
                      _recentBuilder(wordList),
                    ],
                  );
          },
        ),
      );

//
  Widget _recentBuilder(List<WordResponse> wordList) => Builder(
        builder: (context) {
          return Injection.recentCubit.isEditting
              ? EditListViewWidget(wordList: wordList)
              : ListViewWidget(wordList: wordList);
        },
      );

//
}
