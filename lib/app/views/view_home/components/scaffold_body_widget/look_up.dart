import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wordmind/app/views/view_home/components/scaffold_body_widget/widgets/look_up_widgets.dart';

class LookUpScreen extends StatelessWidget {
  final BannerAd? bannerAd6;
  final bool? isLoaded6;

  const LookUpScreen({
    Key? key,
    this.bannerAd6,
    this.isLoaded6,
    BannerAd? ad6,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('words'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError)
            return Text(snapshot.error.toString());
          else {
            return LookUpWidget();
          }
        } else {
          return LookUpWidget();
        }
      },
    );
  }
}
