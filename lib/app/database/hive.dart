import 'package:hive/hive.dart';
import 'package:wordmind/models/words.dart';

void addData(Word word) async {
  await Hive.openBox("words");
  final box = Hive.box('words');
  box.add(word);
}

String getData(int index) {
  final wordBox = Hive.box("words");
  final data = wordBox.getAt(index) as Word;
  return data.word;
}

void putData(int index, Word data) {
  print(index);
  print(index.runtimeType);
  final wordBox = Hive.box("words");
  wordBox.putAt(index, data.word);
}

void deleteAt(index) {
  final wordBox = Hive.box("words");
  wordBox.deleteAt(index);
}
