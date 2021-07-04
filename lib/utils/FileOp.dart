import 'package:path_provider/path_provider.dart';
import 'dart:io';

class OperateFile {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _fileData async {
    final path = await _localPath;

    return File('$path/anne.data');
  }

  Future<String> readData() async {
    try {
      final file = await _fileData;
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      return '';
    }
  }

  Future<File> writeData(String content) async {
    print('Writing anne.data ...');
    final file = await _fileData;

    return file.writeAsString('$content');
  }
}
