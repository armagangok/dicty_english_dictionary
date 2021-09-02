import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'app/routes/look_up_root/look_up_woordbase.dart';
import 'app/routes/settings_route/settings.dart';
import 'app/routes/word_adding_root/add_word.dart';
import 'app/routes/word_listening_root/listen.dart';
import 'models/words.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.initFlutter(directory.path);
  Hive.registerAdapter(WordAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordmind',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scrollController = FixedExtentScrollController();
    const double _itemHeight = 60;
    const int _itemCount = 100;

    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        height: double.infinity,
        child: ClickableListWheelScrollView(
          scrollController: _scrollController,
          itemHeight: _itemHeight,
          itemCount: _itemCount,
          onItemTapCallback: (index) {
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Setting();
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
              SizedBox(height: 10),
              homeText(text: 'Look Up'),
              SizedBox(height: 10),
              homeText(text: 'Listen'),
              SizedBox(height: 10),
              homeText(text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget homeText({String text = ''}) {
  return Column(
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    ],
  );
}
