import 'package:flutter/material.dart';

import '../../../global/export/export.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar(
          title: Text(KString.aboutMe),
        ),
        body: Padding(
          padding: context.mediumPadding,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                _aboutMeText,
                SizedBox(height: context.bigHeight),
                _contactMeButton,
              ],
            ),
          ),
        ),
      );

  Widget get _contactMeButton => Builder(
      builder: (context) => GestureDetector(
          onTap: () => UrlLauncherHelper.shared.openUrl(KNetwork.myUrl),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(
              "Contact with me ",
              style: context.textTheme.bodyLarge!.copyWith(
                color: KColor.twitterBlue,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const FaIcon(
              FontAwesomeIcons.twitter,
              color: KColor.twitterBlue,
            )
          ])));

  Widget get _aboutMeText => Builder(
      builder: (context) => Text(KString.aboutMeContent,
          style: context.textTheme.subtitle2!.copyWith(
            color: context.colors.primary,
          )));
}
