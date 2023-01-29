import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';
import '../pages/recent_detail_page.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.wordList,
  }) : super(key: key);

  final List<WordResponse> wordList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: wordList.length,
      itemBuilder: (context, index) {
        var wordModel = wordList[index];

        return ListTile(
          onTap: () async {
            Injection.localCubit.fetchWord(word: wordModel);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecentDetailPage(
                  wordModel: wordModel,
                ),
              ),
            );
          },
          title: Text(
            wordModel.word!,
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.primary,
            ),
          ),
        );
      },
    );
  }
}
