import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './components/look_up.dart';
import './components/search_text_field.dart';
import './components/setting_button.dart';
import '../../../core/remote/admob/ad_helper.dart';
import '../../../core/remote/admob/generate_ad.dart';
import '../../core/extension/context_extension.dart';
import '../../feature/components/ad_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => context.dismissKeyboard(),
        child: Scaffold(
          bottomNavigationBar: AdvertisementWidget(
            ad: generateAd.ad,
            unitID: adHelper.bannerAdUnitId1,
          ),
          body: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  children: const [
                    SettingButtonWidget(),
                    SearchTextField(),
                  ],
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(CupertinoIcons.time, size: 13),
                  Text("Recents"),
                ],
              ),
              const LookUpScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
