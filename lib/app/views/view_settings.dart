import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '../../core/local/database/viewmodels/word_viewmodel.dart';
import '../../core/remote/admob/ad_helper.dart';
import '../theme/theme_service.dart';

class SettingView extends StatefulWidget {
  final BannerAd ad2;
  final bool isLoaded2;

  const SettingView({
    Key? key,
    required this.ad2,
    required this.isLoaded2,
  }) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  var _switchValue = ThemeService().isSavedDarkMode();
  final items = [
    'English-GB',
    'English-US',
    'English-IE',
    'English-AU',
    'English-IN',
    'English-ZA',
  ];

  @override
  Widget build(BuildContext context) {
    final WordViewModel _wordViewModel = Provider.of<WordViewModel>(context);
    return FutureBuilder(
      future: _wordViewModel.getLanguage(),
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
          debugPrint("${snapshot.data}");
          return Scaffold(
            bottomNavigationBar: AdHelper().checkForAd(
              widget.isLoaded2,
              widget.ad2,
            ),
            appBar: AppBar(title: const Text("Settings")),
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Dark Mode"),
                            CupertinoSwitch(
                              value: _switchValue,
                              onChanged: (value) {
                                setState(() {
                                  _switchValue = value;
                                  ThemeService().changeTheme();
                                });
                              },
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("English Accent"),
                            SizedBox(
                              height: 100,
                              width: MediaQuery.of(context).size.width / 4,
                              child: CupertinoPicker(
                                scrollController: FixedExtentScrollController(
                                    initialItem: snapshot.data!),
                                useMagnifier: true,
                                magnification: 1.1,
                                itemExtent: 30,
                                onSelectedItemChanged: (value) async {
                                  await _wordViewModel.saveLanguage(value);
                                  int a = await _wordViewModel.getLanguage();
                                  print("get $a");
                                },
                                children: items
                                    .map((item) => Custom(data: item))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          debugPrint("${snapshot.error}");
          return Scaffold(body: Text("ERROR"));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class Custom extends StatelessWidget {
  final String data;
  const Custom({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        data,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
