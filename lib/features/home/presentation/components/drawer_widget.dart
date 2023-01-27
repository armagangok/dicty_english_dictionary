import 'package:flutter/material.dart';

import '../../../../../global/export/export.dart';

import '../cubit/accent/accent_cubit.dart';
import '../cubit/home/home_cubit.dart';
import 'accent_picker_widget.dart';
import 'drawer_item.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void initState() {
    super.initState();
    getIt.call<AccentCubit>().getAccent();
  }

  final _homeCubit = getIt.call<HomeCubit>();
  final _navigator = getIt.call<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colors.background,
      width: context.width(0.8),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: context.mediumPadding,
          children: _getDrawerItems,
        ),
      ),
    );
  }

  List<Widget> get _getDrawerItems => [
        DrawerItem(
          text: KString.recent,
          iconData: CupertinoIcons.time,
          onPressed: () => _navigator.navigateTo(path: KRoute.RECENT_PAGE),
        ),
        _divider,
        DrawerItem(
          text: KString.wordOfTheDay,
          iconData: CupertinoIcons.calendar_today,
          onPressed: () =>
              _navigator.navigateTo(path: KRoute.WORD_OF_THE_DAY_PAGE),
        ),
        _divider,
        DrawerItem(
          text: KString.accent,
          iconData: CupertinoIcons.speaker_3,
          onPressed: () async => await _showMyDialog(
            const AlertDialog(
              // title: Text('AlertDialog Title'),
              content: SingleChildScrollView(
                child: AccentPickerWidget(),
              ),
            ),
          ),
        ),
        _divider,
        // DrawerItem(
        //   text: KString.darkMode,
        //   iconData: CupertinoIcons.moon,
        //   onPressed: () => _showMyDialog(
        //     const AlertDialog(
        //       content: ThemePickerWidget(),
        //     ),
        //   ),
        // ),
        _divider,
        DrawerItem(
          text: KString.aboutMe,
          iconData: CupertinoIcons.info,
          onPressed: () => _navigator.navigateTo(path: KRoute.ABOUT_ME_PAGE),
        ),
        _divider,
        DrawerItem(
          text: KString.rateUS,
          iconData: CupertinoIcons.star,
          onPressed: () async {
            await _homeCubit.requestRate();
            _navigator.getBack();
          },
        )
      ];

  Future<void> _showMyDialog(Widget widget) async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return widget;
      },
    );
  }

  Widget get _divider => const Divider(thickness: 0.1);
}
