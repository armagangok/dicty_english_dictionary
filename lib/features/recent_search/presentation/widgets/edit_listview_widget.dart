import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class EditListViewWidget extends StatelessWidget {
  const EditListViewWidget({
    Key? key,
    required this.wordList,
  }) : super(key: key);

  final List<WordResponse> wordList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) => const Divider(),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: wordList.length,
      itemBuilder: (context, index) => CheckboxListTile(
        activeColor: KColor.deepOrange,
        value: wordList[index].isSelected,
        onChanged: (val) async {
          WordResponse word = wordList[index];
          word = word.copyWith(isSelected: !word.isSelected);

          await Injection.localCubit.updateWord(index, word);
        },
        title: Text(
          wordList[index].word ?? "null",
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.primary,
          ),
        ),
      ),
    );
  }
}
