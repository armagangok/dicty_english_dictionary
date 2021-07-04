import 'package:flutter/material.dart';
import 'package:wordmind/utils/utils.dart';
import 'edit_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = '';
  List newData = [];
  getfiledata() async {
    await fetchFileData();
  }

  Future<void> fetchFileData() async {
    String fetchData;

    final file = await FileUtils.getFile;

    if (await file.exists()) {
      fetchData = await file.readAsString();
      setState(() {
        data = fetchData;
        newData = data.split('\n');
      });
      print(newData);
    }
  }

  @override
  void initState() {
    print(newData);
    super.initState();
    getfiledata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: newData.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              editingField(context);
            },
            title: Card(
              child: Row(children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.yellow[50],
                    height: 100,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          newData[index],
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
                  onPressed: () {
                    print("will delete!");
                  },
                )
                // IconButton(onPressed: () {}, icon: Icons.access_alarms),
              ]),
            ),
          );
        },
      ),
    );
  }
}
