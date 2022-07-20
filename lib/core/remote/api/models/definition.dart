import 'dart:convert';

class Definition {
  final String? definition;
  final List<dynamic>? synonyms;
  final List<dynamic>? antonyms;
  final String? example;

  const Definition(
      {this.definition, this.synonyms, this.antonyms, this.example});

  factory Definition.fromMap(Map<String, dynamic> data) => Definition(
        definition: data['definition'] as String?,
        synonyms: data['synonyms'] as List<dynamic>?,
        antonyms: data['antonyms'] as List<dynamic>?,
        example: data['example'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'definition': definition,
        'synonyms': synonyms,
        'antonyms': antonyms,
        'example': example,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Definition].
  factory Definition.fromJson(String data) {
    return Definition.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Definition] to a JSON string.
  String toJson() => json.encode(toMap());
}
