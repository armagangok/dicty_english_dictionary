import 'package:flutter/material.dart';

import '../../../../global/export/export.dart';
import 'components/drawer_widget.dart';
import 'components/home_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  late final _homeCubit = getIt.call<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.dismissKeyboard(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          drawer: const DrawerWidget(),
          appBar: const HomeAppBar(),
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() => BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is RateFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("An Error occured."),
              ),
            );
          }
        },
        bloc: _homeCubit,
        builder: (context, state) {
          if (state is RateRequested) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: context.bigPadding,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _dictyText,
                      SizedBox(height: context.normalHeight),
                      _followButton,
                    ],
                  ),
                  const Spacer(),
                  _blinkingButton,
                ],
              ),
            );
          }
        },
      );

  Widget get _blinkingButton => Align(
        alignment: Alignment.bottomRight,
        child: MyBlinkingButton(
          onTap: () async =>
              await UrlLauncherHelper.shared.openUrl(KNetwork.myUrl),
          text: KString.madeBy,
        ),
      );

  Widget get _followButton => Builder(
        builder: (context) => GestureDetector(
          onTap: () async =>
              await UrlLauncherHelper.shared.openUrl(KNetwork.appUrl),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                KString.followUs,
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
            ],
          ),
        ),
      );

  Widget get _dictyText => Builder(
        builder: (context) => AutoSizeText(
          KString.dictyText,
          style: context.textTheme.headline4!.copyWith(
            color: context.colors.primary,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w800,
          ),
          maxLines: 1,
        ),
      );
}
