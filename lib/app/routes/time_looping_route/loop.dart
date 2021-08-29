import "package:flutter/material.dart";
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(
    new ExampleApp(),
  );
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: TabBarView(
          children: [
            _IntegerExample(),
          ],
        ),
      ),
    );
  }
}

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {
  int _currentIntValue = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[400],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.blue,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      child: Text('Choose loop time as minute!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                  elevation: 8),
              SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                  ),
                  child: NumberPicker(
                    textStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    value: _currentIntValue,
                    minValue: 0,
                    maxValue: 40,
                    step: 1,
                    haptics: true,
                    itemHeight: 60,
                    itemWidth: 360,
                    selectedTextStyle: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w900,
                      fontSize: 50,
                    ),
                    itemCount: 5,
                    onChanged: (value) => setState(
                      () => _currentIntValue = value,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  print(_currentIntValue);
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
