import 'package:flutter/material.dart';

import '../../feature/export/export.dart';
import 'components/look_up_widgets.dart';

class RecentView extends StatelessWidget {
  const RecentView({Key? key}) : super(key: key);
  @override
  build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: AdvertisementWidget(
      //   ad: generateAd.ad,
      //   unitID: AdHelper.bannerAdUnitId4,
      // ),
      body: FutureBuilder(
        future: Hive.openBox('words'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const LookUpWidget();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text("Something went wrong...."),
            );
          }
        },
      ),
    );
  }
}
