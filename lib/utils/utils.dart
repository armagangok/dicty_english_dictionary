import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<String> get getFilePath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  static Future<File> get getFile async {
    final path = await getFilePath;
    return File("$path/wordbase.txt");
  }

  static Future<File> saveToFile(String data) async {
    final file = await getFile;
    return file.writeAsString(data, mode: FileMode.append);
  }

  // static Future<String> readFromFile() async {
  //   try {
  //     final file = await getFile;
  //     String fileContents = await file.readAsString();
  //     print(fileContents);
  //     return fileContents;
  //   } catch (e) {
  //     return '';
  //   }
  // }
}
