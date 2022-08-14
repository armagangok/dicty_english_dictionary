import 'package:flutter/material.dart';

import '../../feature/export/export.dart';
import '../gift/gift_view.dart';
import '../home/home_view.dart';
import '../recent/recent_view.dart';
import '../search/search_view.dart';
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
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // BannerAdWidget(
              //   ad: generateAd.ad,
              //   unitID: AdHelper.bannerAdUnitId1,
              // ),
              BottomNavigationBar(
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

  static final List<Widget> _pages = [
    HomeView(),
    RecentView(),
    SearchResultView(),
    const GiftView(),
    const SettingView(),
  ];
}
