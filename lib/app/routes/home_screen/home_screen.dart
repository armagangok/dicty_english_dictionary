import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/app/routes/home_screen/text_widget.dart';
import 'package:wordmind/app/routes/listening_root/listen.dart';
import 'package:wordmind/app/routes/look_up_root/look_up.dart';
import 'package:wordmind/app/routes/settings_route/settings.dart';
import 'package:wordmind/app/routes/word_adding_root/add_word.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double _itemHeight = 60;
  final int _itemCount = 100;
  final _scrollController = FixedExtentScrollController();
  late String countryLanguage;
  late int loopTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        height: double.infinity,
        child: ClickableListWheelScrollView(
          scrollController: _scrollController,
          itemHeight: _itemHeight,
          itemCount: _itemCount,
          onItemTapCallback: (index) async {
            if (_scrollController.hasClients) {
              if (index == 0) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AddingPage();
                }));
              } else if (index == 2) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              } else if (index == 4) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ListenPage();
                }));
              } else if (index == 6) {
                countryLanguage = await getCountry();
                loopTime = await getTime();

                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Setting(
                    currentTime: loopTime,
                    countryLanguage: countryLanguage,
                  );
                }));
              }
            }
          },
          child: ListWheelScrollView(
            controller: _scrollController,
            itemExtent: _itemHeight,
            magnification: 1.8,
            useMagnifier: true,
            physics: FixedExtentScrollPhysics(),
            children: [
              homeText(text: 'Add A Word'),
              const SizedBox(height: 10),
              homeText(text: 'Look Up'),
              const SizedBox(height: 10),
              homeText(text: 'Listen'),
              const SizedBox(height: 10),
              homeText(text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}
