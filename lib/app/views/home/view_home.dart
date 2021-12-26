import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/remote/admob/ad_helper.dart';
import '../../../core/remote/admob/generate_ad.dart';
import 'components/stacks/look_up.dart';
import 'components/stacks/search_text_field.dart';
import 'components/stacks/setting_button.dart';
import '../../global/components/common/ad_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: AdvertisementWidget(
          ad: createAd.ad,
          unitID: adHelper.bannerAdUnitId1,
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 155,
                    child: const LookUpScreen(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
