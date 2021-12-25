import 'package:flutter/material.dart';
import '../../../core/remote/admob/ad_helper.dart';
import '../../../core/remote/admob/generate_ad.dart';
import '../home/components/widgets/ad_widget.dart';
import 'components/stacks/stacks.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AdvertisementWidget(
        unitID: adHelper.bannerAdUnitId2,
        ad: createAd.ad,
      ),
      appBar: AppBar(title: const Text("Settings")),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 70,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const ThemePickerWidget(),
                  const Divider(),
                  AccentPickerWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
