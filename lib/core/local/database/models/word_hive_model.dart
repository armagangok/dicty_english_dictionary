import 'package:hive/hive.dart';

part '../words.g.dart';

@HiveType(typeId: 1)
class HiveWord extends HiveObject {
  @HiveField(0)
  String? word = "";
  @HiveField(1)
  String? origin = "";
  @HiveField(2)
  String? meaning1 = "";
  @HiveField(3)
  String? meaning2 = "";
  @HiveField(4)
  String? example = "";
  HiveWord({
    required this.word,
    required this.origin,
    required this.meaning1,
    required this.meaning2,
    required this.example,
  });
}
