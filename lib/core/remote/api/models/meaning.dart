import 'dart:convert';

import 'definition.dart';

class Meaning {
  final String? partOfSpeech;
  final List<Definition>? definitions;
  final List<dynamic>? synonyms;
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
