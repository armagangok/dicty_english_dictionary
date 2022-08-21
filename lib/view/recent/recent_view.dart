// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:english_accent_dictionary/core/components/error_widget.dart';
import 'package:english_accent_dictionary/core/remote/api/model/model.dart';
import 'package:flutter/material.dart';

import '../../../feature/export/export.dart';
import 'controller/recent_controller.dart';

class RecentView extends StatelessWidget {
  RecentView({Key? key}) : super(key: key);

  // final TextToSpeech _textToSpeech = Get.put(TextToSpeech.instance);
  final RecentController _recentController = Get.put(RecentController.instance);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: ValueListenableBuilder(
          valueListenable: HiveController.instance.getHiveBox.listenable(),
          builder: (context, Box<WordModel> wordBox, _) => wordBox.isEmpty
              ? _noRecentSearch()
              : Column(
                  children: [
                    _deleteWidget(),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        children: [
                          _recentBuilder(HiveController.instance.getAll()),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      );

  Widget _deleteWidget() => Builder(
        builder: (context) {
          return Obx(
            () => AnimatedContainer(
              height: _recentController.isEditting ? context.height(0.07) : 0,
              color: const Color.fromARGB(255, 141, 160, 255).withOpacity(0.2),
              duration: const Duration(milliseconds: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _deleteButton,
                  _deleteAllButton,
                ],
              ),
            ),
          );
        },
      );

  TextButton get _deleteAllButton => TextButton(
        onPressed: () async => await HiveController.instance.deleteAllWords(),
        child: const Text(
          AppString.deleteAll,
          style: TextStyle(color: Colors.red),
        ),
      );

  Widget get _deleteButton => TextButton(
        onPressed: () async => HiveController.instance.wordList.forEach(
          (element) async => await HiveController.instance.deleteByName(
            element,
          ),
        ),
        child: const Text(
          AppString.delete,
          style: TextStyle(color: Colors.red),
        ),
      );

  AppBar _buildAppBar() => AppBar(
        title: const Text(AppString.recent),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              onPressed: () => _recentController.edit(),
              child: Text(
                AppString.edit,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );

  //
  Widget _recentBuilder(List<WordModel> wordList) => Builder(
        builder: (context) {
          return Obx(() {
            return _recentController.isEditting
                ? buildEditListView(wordList)
                : buildListView(wordList);
          });
        },
      );

  ListView buildListView(List<WordModel> wordList) => ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: wordList.length,
        itemBuilder: (context, index) {
          return ListTile(
            // onTap: ()=> Get.to(SearchResultView()),
            title: Text(
              wordList[index].word!,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.primary,
              ),
            ),
          );
        },
      );

  ListView buildEditListView(List<WordModel> wordList) => ListView.separated(
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => const Divider(),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: wordList.length,
        itemBuilder: (context, index) => CheckboxListTile(
          activeColor: AppColor.deepOrange,
          value: wordList[index].isSelected,
          onChanged: (val) async {
            wordList[index].isSelected = val!;
            await HiveController.instance.save(index, wordList[index]);
          },
          title: Text(
            wordList[index].word!,
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.primary,
            ),
          ),
        ),
      );

  //
  Widget _noRecentSearch() => Builder(
        builder: (context) => Center(
          child: Padding(
            padding: context.lowPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyErrorWidget(
                  errorModel: ErrorModel(
                    title: AppString.resultViewSearchTitle,
                    message: AppString.resultViewResultMessage,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
