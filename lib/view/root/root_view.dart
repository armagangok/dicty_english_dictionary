import 'package:english_accent_dictionary/view/root/controller/bottom_navy_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_view.dart';
import '../recent/recent_view.dart';
import '../search/search_view.dart';
import '../settings/setting_view.dart';

class RootView extends StatelessWidget {
  RootView({Key? key}) : super(key: key);

  final BottomNavyController controller = Get.put(BottomNavyController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _pages[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (int index) => controller.changeIndex(index),
          items: [
            bottomNavyBarItem("Home", CupertinoIcons.home),
            bottomNavyBarItem("Recent", CupertinoIcons.time),
            bottomNavyBarItem("Search", CupertinoIcons.search),
            bottomNavyBarItem("Special", CupertinoIcons.gift),
            bottomNavyBarItem("Setting", CupertinoIcons.settings),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavyBarItem(
    String label,
    IconData iconData,
  ) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        iconData,
        
      ),
    );
  }

  final List<Widget> _pages = [
    const HomeView(),
    const RecentView(),
    SearchResultView(),
    const GiftView(),
    const SettingView(),
  ];
}

class GiftView extends StatelessWidget {
  const GiftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}
