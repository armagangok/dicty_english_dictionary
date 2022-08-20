import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../feature/export/export.dart';
import '../../global/constant/app_color/app_color.dart';
import '../about_us/about_us_view.dart';
import '../recent/recent_view.dart';
import '../search_result/search_result_view.dart';
import '../word_of_the_day/word_of_the_day_view.dart';
import 'components/accent_picker_widget.dart';
import 'components/theme_picker_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final TextController textController = Get.find();
  final SearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          drawer: _buildDrawer(),
          appBar: _buildAppBar(),
          body: Padding(
            padding: EdgeInsets.all(context.normalWidth),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Dicty English Dictionary"),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              
                            },
                            icon: const FaIcon(FontAwesomeIcons.twitter),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() => Builder(
        builder: (context) => Drawer(
          backgroundColor: AppColor.drawerBackground,
          width: context.width(0.8),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: context.mediumPadding,
              children: _getDrawerItems,
            ),
          ),
        ),
      );

  Widget _divider() => const Divider(thickness: 0.1);

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
                      color: AppColor.primaryColor.withOpacity(0.66),
                    ),
                    SizedBox(width: context.mediumWidth),
                    AutoSizeText(
                      text!,
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: AppColor.primaryColor,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                Icon(
                  CupertinoIcons.forward,
                  size: 28,
                  color: AppColor.primaryColor.withOpacity(0.66),
                )
              ],
            ),
          ),
        ),
      );

  AppBar _buildAppBar() => AppBar(
        title: Column(
          children: [
            CustomTextField(
              controller: textController.search,
              icon: const Icon(Icons.search),
              onTap: () async => searchForTheWord(),
            ),
          ],
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

  void searchForTheWord() async {
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

  buildDialog(Widget child) => Get.dialog(
        Builder(
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
          ),
        ),
      );

  List<Widget> get _getDrawerItems => [
        _drawerItem(
          text: "Recent",
          iconData: CupertinoIcons.time,
          onPressed: () => Get.to(() => RecentView()),
        ),
        _divider(),
        _drawerItem(
          text: "Word of the day",
          iconData: CupertinoIcons.calendar_today,
          onPressed: () => Get.to(() => const WordOfTheDayView()),
        ),
        _divider(),
        _drawerItem(
          text: "Speaker accent",
          iconData: CupertinoIcons.speaker_3,
          onPressed: () {
            Get.back();
            buildDialog(const AccentPickerWidget());
          },
        ),
        _divider(),
        _drawerItem(
            text: "Dark mode",
            iconData: CupertinoIcons.moon,
            onPressed: () {
              Get.back();
              buildDialog(const ThemePickerWidget());
            }),
        _divider(),
        _drawerItem(
          text: "About us",
          iconData: CupertinoIcons.info,
          onPressed: () => Get.to(() => const AboutUsView()),
        ),
        _divider(),
        _drawerItem(
          text: "Rate us",
          iconData: CupertinoIcons.star,
          onPressed: () => Get.to(() => const AboutUsView()),
        ),
      ];
}
