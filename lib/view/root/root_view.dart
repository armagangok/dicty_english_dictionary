import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../gift/gift_view.dart';
import '../home/home_view.dart';
import '../recent/recent_view.dart';
import '../search/search_view.dart';
import '../settings/setting_view.dart';
import 'controller/bottom_navy_controller.dart';

class RootView extends StatelessWidget {
  RootView({Key? key}) : super(key: key);

  final BottomNavyController controller = Get.put(BottomNavyController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
      ),
    );
  }

  BottomNavigationBarItem bottomNavyBarItem(
    String label,
    IconData iconData,
  ) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(iconData),
    );
  }

  final List<Widget> _pages = [
    HomeView(),
    RecentView(),
    SearchResultView(),
    const GiftView(),
    const SettingView(),
  ];
}
