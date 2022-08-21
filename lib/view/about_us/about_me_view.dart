import 'package:flutter/material.dart';

import '../../core/components/custom_app_bar.dart';
import '../../feature/export/export.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar(
          title: Text(AppString.aboutMe),
        ),
        body: Padding(
          padding: context.normalPadding,
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
          onTap: () => UrlLauncherHelper.shared.openUrl(NetworkConstants.myUrl),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(
              "Contact with me!",
              style: context.textTheme.bodyLarge!.copyWith(
                color: AppColor.twitterBlue,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const FaIcon(
              FontAwesomeIcons.twitter,
              color: AppColor.twitterBlue,
            )
          ])));

  Widget get _aboutMeText => Builder(
      builder: (context) => Text(AppString.aboutMeContent,
          style: context.textTheme.subtitle2!.copyWith(
            color: context.colors.primary,
          )));
}
