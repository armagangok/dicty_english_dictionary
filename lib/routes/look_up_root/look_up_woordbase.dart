import 'package:flutter/material.dart';
import 'edit_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              editingField(context);
            },
            title: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                10,
              )),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70,
                          border: Border.all(
                            width: 3,
                            // c),
                          )),
                      height: 110,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              "merhaba",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                    ),
                    color: Colors.black,
                    iconSize: 20,
                    onPressed: () {
                      print(index);
                    },
                  )
                  // IconButton(onPressed: () {}, icon: Icons.access_alarms),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
