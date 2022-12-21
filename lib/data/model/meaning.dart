import 'dart:convert';


import 'package:hive/hive.dart';

import '../entity/word_entity.dart';
import 'definition.dart';

part 'meaning.g.dart';

@HiveType(typeId: 3)
class Meaning extends WordEntity {
  @override
  @HiveField(0)
  final String? partOfSpeech;
  @override
  @HiveField(1)
  final List<Definition>? definitions;
  @override
  @HiveField(2)
  final List<dynamic>? synonyms;
  @override
  @HiveField(3)
  final List<dynamic>? antonyms;

  const Meaning({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  factory Meaning.fromMap(Map<String, dynamic> data) => Meaning(
        partOfSpeech: data['partOfSpeech'] as String?,
        definitions: (data['definitions'] as List<dynamic>?)
            ?.map((e) => Definition.fromMap(e as Map<String, dynamic>))
            .toList(),
        synonyms: data['synonyms'] as List<dynamic>?,
        antonyms: data['antonyms'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'partOfSpeech': partOfSpeech,
        'definitions': definitions?.map((e) => e.toMap()).toList(),
        'synonyms': synonyms,
        'antonyms': antonyms,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Meaning].
  factory Meaning.fromJson(String data) {
    return Meaning.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Meaning] to a JSON string.
  String toJson() => json.encode(toMap());
}
