import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final textController = TextController.instance;
  final searchController = SearchController.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          drawer: _buildDrawer,
          appBar: _buildAppBar,
          body: Padding(
            padding: context.bigPadding,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _dictyText,
                    SizedBox(height: context.normalHeight),
                    _followButton,
                  ],
                ),
                const Spacer(),
                _blinkingButton,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _blinkingButton => Align(
        alignment: Alignment.bottomRight,
        child: MyBlinkingButton(
          onTap: () async =>
              await UrlLauncherHelper.shared.openUrl(KNetwork.myUrl),
          text: KString.madeBy,
        ),
      );

  Widget get _followButton => Builder(
        builder: (context) => GestureDetector(
          onTap: () async =>
              await UrlLauncherHelper.shared.openUrl(KNetwork.appUrl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                KString.followUs,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: KColor.twitterBlue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const FaIcon(
                FontAwesomeIcons.twitter,
                color: KColor.twitterBlue,
              )
            ],
          ),
        ),
      );

  Widget get _dictyText => Builder(
      builder: (context) => AutoSizeText(
            KString.dictyText,
            style: context.textTheme.headline4!.copyWith(
              color: context.colors.primary,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800,
            ),
            maxLines: 1,
          ));

  Widget get _buildDrawer => Builder(
      builder: (context) => Drawer(
          backgroundColor: context.colors.background,
          width: context.width(0.8),
          child: Center(
              child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: context.mediumPadding,
            children: _getDrawerItems,
          ))));

  Widget get _divider => const Divider(thickness: 0.1);

  Widget _drawerItem({
    final String? text,
    final IconData? iconData,
    final Function? onPressed,
  }) =>
      Builder(
          builder: (context) => GestureDetector(
              onTap: () => onPressed!(),
              child: Container(
                  color: Colors.transparent,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              iconData,
                              size: 28,
                              color: context.colors.primary.withOpacity(0.8),
                            ),
                            SizedBox(width: context.mediumWidth),
                            AutoSizeText(
                              text!,
                              style: context.textTheme.bodySmall!.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                                color: context.colors.primary.withOpacity(0.8),
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                        Icon(
                          CupertinoIcons.forward,
                          size: 28,
                          color: context.colors.primary.withOpacity(0.8),
                        )
                      ]))));

  AppBar get _buildAppBar => AppBar(
          title: Builder(builder: (context) {
            return Column(
              children: [
                CustomTextField(
                  controller: textController.search,
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onTap: () async => searchForTheWord,
                ),
              ],
            );
          }),
          actions: [
            IconButton(
              splashRadius: 0.1,
              icon: const Icon(
                CupertinoIcons.settings,
                color: Colors.transparent,
              ),
              onPressed: () {},
            )
          ]);

  void get searchForTheWord async {
    if (textController.search.text.isEmpty) {
      Get.snackbar(
        "Warning",
        "Please enter a text to search for!",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(milliseconds: 3000),
      );
    } else {
      Get.to(SearchResultView());
      await searchController.fetchWord(textController.search.text);
      textController.search.clear();
    }
  }

  buildDialog(Widget child) => Get.dialog(Builder(
      builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.9, sigmaY: 0.9),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width(0.05),
                  vertical: context.width(0.05),
                ),
                child: child,
              ),
            ),
          )));

  List<Widget> get _getDrawerItems => [
        _drawerItem(
          text: KString.recent,
          iconData: CupertinoIcons.time,
          onPressed: () => Get.toNamed(Routes.recent),
        ),
        _divider,
        _drawerItem(
          text: KString.wordOfTheDay,
          iconData: CupertinoIcons.calendar_today,
          onPressed: () => Get.toNamed(Routes.wordOfTheDay),
        ),
        _divider,
        _drawerItem(
          text: KString.accent,
          iconData: CupertinoIcons.speaker_3,
          onPressed: () => buildDialog(const AccentPickerWidget()),
        ),
        _divider,
        _drawerItem(
          text: KString.darkMode,
          iconData: CupertinoIcons.moon,
          onPressed: () => buildDialog(const ThemePickerWidget()),
        ),
        _divider,
        _drawerItem(
          text: KString.aboutMe,
          iconData: CupertinoIcons.info,
          onPressed: () => Get.toNamed(Routes.aboutMe),
        ),
        _divider,
        _drawerItem(
          text: KString.rateUS,
          iconData: CupertinoIcons.star,
          onPressed: () async => await RatingHelper.shared.requestReview(),
        )
      ];
}
