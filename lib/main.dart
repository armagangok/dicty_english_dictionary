import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:wordmind/routes/look_up_root/look_up_woordbase.dart';
import 'package:wordmind/routes/time_looping_route/loop.dart';
import 'package:wordmind/routes/word_listenin_root/listen.dart';
import './routes/word_adding_root/add_word.dart';

void main() => runApp(MyApp());

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
      backgroundColor: Colors.grey[200],
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
                  return ExampleApp();
                }));
              } else if (index == 6) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ListenPage();
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
              SizedBox(height: 15),
              homeText(text: 'Look Up'),
              SizedBox(height: 15),
              homeText(text: 'Looping'),
              SizedBox(height: 15),
              homeText(text: 'Listen'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget homeText({String text = ''}) {
  return Column(children: [
    Text(
      text,
      style: TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.w800,
      ),
    ),
  ]);
}
