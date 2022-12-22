import 'package:flutter/material.dart';
import '../../../../core/components/ios_dialog.dart';
import '../../../../global/export/export.dart';


class RecentView extends StatefulWidget {
  const RecentView({Key? key}) : super(key: key);

  @override
  State<RecentView> createState() => _RecentViewState();
}

class _RecentViewState extends State<RecentView> {
  final _recentController = RecentController.instance;

  final _hiveController = SearchCubit();

  final navigator = getIt<NavigationServiceContract>.call();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: ValueListenableBuilder(
          valueListenable: _hiveController.getHiveBox.listenable(),
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
                          _recentBuilder(_hiveController.getAll()),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      );

  Widget _deleteWidget() => Builder(
        builder: (context) {
          return AnimatedContainer(
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
          );
        },
      );

  TextButton get _deleteAllButton => TextButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (context) {
                return IosDeleteDialog(
                  title: "Warning",
                  message: "Do you want to delete all items?",
                  dialogAction: () async {
                    await _hiveController.deleteAllWords();
                  },
                );
              });
        },
        child: const Text(
          KString.deleteAll,
          style: TextStyle(color: Colors.red),
        ),
      );

  Widget get _deleteButton => TextButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return IosDeleteDialog(
                title: "Warning",
                message: "Do you want to delete selected items?",
                dialogAction: () => _hiveController.wordList.forEach(
                  (element) async => await _hiveController.deleteByName(
                    element,
                  ),
                ),
              );
            },
          );
        },
        child: const Text(
          KString.delete,
          style: TextStyle(color: Colors.red),
        ),
      );

  CustomAppBar _buildAppBar() => CustomAppBar(
        title: const Text(KString.recent),
        widget: Builder(
          builder: (context) => TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            onPressed: () {
              _recentController.edit();
            },
            child: Text(
              _recentController.isEditting ? KString.done : KString.edit,
              style: context.textTheme.bodyMedium!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

//
  Widget _recentBuilder(List<WordModel> wordList) => Builder(
        builder: (context) {
          return _recentController.isEditting
              ? buildEditListView(wordList)
              : buildListView(wordList);
        },
      );

  ListView buildListView(List<WordModel> wordList) => ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: wordList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              _hiveController.fetchWord("wordList[index]");
              navigator.navigateTo(
                path: KRoute.RECENT_DETAIL_PAGE,
              );

              // Get.to(RecentDetailWiew(wordModel: wordList[index]));
            },
            title: Text(
              wordList[index].word ?? "null word",
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
          activeColor: KColor.deepOrange,
          value: wordList[index].isSelected,
          onChanged: (val) async {
            wordList[index].isSelected = val!;
            // await HiveController.instance.save(index, wordList[index]);
          },
          title: Text(
            wordList[index].word ?? "null word",
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
                    title: KString.resultViewSearchTitle,
                    message: KString.resultViewResultMessage,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
