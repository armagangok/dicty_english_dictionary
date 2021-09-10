import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordmind/app/database/hive.dart';
import 'package:wordmind/app/routes/home_screen/home_screen.dart';
import 'models/words.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.initFlutter(directory.path);
  Hive.registerAdapter(WordAdapter());

  var _prefs = await SharedPreferences.getInstance();
  if (_prefs.getInt("firstRun") == null) {
    setLangToLanguageBox();
    setTimeToTimeBox();
    await _prefs.setInt("firstRun", 1);
    print("everything is fine");
  } else {
    print("*");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
