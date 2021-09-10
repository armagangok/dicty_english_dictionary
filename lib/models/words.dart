import 'package:hive/hive.dart';
part 'words.g.dart';

@HiveType(typeId: 1)
class Word extends HiveObject {
  @HiveField(0)
  final String word;

  Word(this.word);
}

@HiveType(typeId: 2)
class Time extends HiveObject {
  @HiveField(0)
  final int time;

  Time(this.time);
}

@HiveType(typeId: 3)
class Language extends HiveObject {
  @HiveField(0)
  final int language;

  Language(this.language);
}
