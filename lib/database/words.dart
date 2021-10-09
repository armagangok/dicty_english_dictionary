import 'package:hive/hive.dart';
part 'words.g.dart';

@HiveType(typeId: 1)
class Word extends HiveObject {
  @HiveField(0)
  final String word;
  Word(this.word);
}

