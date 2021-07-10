import 'package:flutter/material.dart';
import 'edit_text.dart';
import 'package:wordmind/utils/database_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> rows = List<Map<String, dynamic>>.empty();

  Future<List<Map<String, dynamic>>> passData() async {
    List<Map<String, dynamic>> queryRows =
        await DatabaseHelper.instance.queryAll();

    return queryRows;
  }

  @override
  void initState() {
    super.initState();
    nonAsync();
  }

  void nonAsync() async {
    rows = await passData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: passData(),
      builder: (context, snapshot) {
        if (snapshot.hasData == null) {
          return Container();
        } else {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: ListView.builder(
              itemCount: rows.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    editingField(context);
                  },
                  title: Card(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.yellow[50],
                            height: 100,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  rows[index]["words"],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                          ),
                          color: Colors.blue,
                          highlightColor: Colors.red,
                          onPressed: () {},
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
      },
    );
  }
}
