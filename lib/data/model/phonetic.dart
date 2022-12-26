import 'dart:convert';

import 'package:hive/hive.dart';

import '../entity/word_entity.dart';
import 'license.dart';

part 'phonetic.g.dart';

@HiveType(typeId: 5)
class Phonetic extends WordEntity {
  @HiveField(0)
  final String? audio;
  @HiveField(1)
  final String? sourceUrl;
  @override
  @HiveField(2)
  final License? license;
  @HiveField(3)
  final String? text;

  Phonetic({this.audio, this.sourceUrl, this.license, this.text});

  factory Phonetic.fromMap(Map<String, dynamic> data) => Phonetic(
        audio: data['audio'] as String?,
        sourceUrl: data['sourceUrl'] as String?,
        license: data['license'] == null
            ? null
            : License.fromMap(data['license'] as Map<String, dynamic>),
        text: data['text'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'audio': audio,
        'sourceUrl': sourceUrl,
        'license': license?.toMap(),
        'text': text,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Phonetic].
  factory Phonetic.fromJson(String data) {
    return Phonetic.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Phonetic] to a JSON string.
  String toJson() => json.encode(toMap());
}
