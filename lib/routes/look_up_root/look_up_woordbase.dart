import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = '';
  List newData = [];
  void fetchFileData() async {
    String fetchData;

    fetchData = await rootBundle.loadString('TEXT_FILES/wordbase.txt');
    setState(() {
      data = fetchData;
      newData = data.split('\n');
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: newData.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
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
                  onPressed: () {},
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
