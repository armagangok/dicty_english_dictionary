import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final _textController = TextController.instance;
  final _navigator = getIt<NavigationService>.call();
  final _searchCubit = getIt.call<SearchCubit>();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Builder(
        builder: (context) {
          return CustomTextField(
            controller: _textController.search,
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onTap: () async => _searchForTheWord,
          );
        },
      ),
      actions: [
        IconButton(
          splashRadius: 0.1,
          icon: const Icon(
            CupertinoIcons.settings,
            color: Colors.transparent,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  void get _searchForTheWord async {
    if (_textController.search.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SizedBox(
            height: context.height(0.04),
            child: Column(
              children: const [
                Text("Warning"),
                Text("Please enter a text to search for!"),
              ],
            ),
          ),
        ),
      );
    } else {
      _navigator.navigateTo(path: KRoute.SEARCH_RESULT_PAGE);
      _searchCubit.fetchWord(word: _textController.search.text);
      _textController.search.clear();
    }
  }
}
