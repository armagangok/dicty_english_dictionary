// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:english_accent_dictionary/data/entity/word_entity.dart';

import 'definition.dart';

part 'meaning.g.dart';

@HiveType(typeId: 3)
class Meaning extends WordEntity {
  @override
  @HiveField(0)
  String? partOfSpeech;
  @override
  @HiveField(1)
  List<Definition>? definitions;
  @override
  @HiveField(2)
  List<dynamic>? synonyms;
  @override
  @HiveField(3)
  List<dynamic>? antonyms;
  Meaning({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  Meaning copyWith({
    String? partOfSpeech,
    List<Definition>? definitions,
    List<dynamic>? synonyms,
    List<dynamic>? antonyms,
  }) {
    return Meaning(
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      definitions: definitions ?? this.definitions,
      synonyms: synonyms ?? this.synonyms,
      antonyms: antonyms ?? this.antonyms,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'partOfSpeech': partOfSpeech,
      'definitions': definitions == null
          ? {}
          : definitions!.map((x) => x.toMap()).toList(),
      'synonyms': synonyms,
      'antonyms': antonyms,
    };
  }

  factory Meaning.fromMap(Map<String, dynamic> map) {
    return Meaning(
      partOfSpeech:
          map['partOfSpeech'] != null ? map['partOfSpeech'] as String : null,
      definitions: map['definitions'] != null
          ? List<Definition>.from(
              (map['definitions'] ).map<Definition?>(
                (x) => Definition.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      synonyms: map['synonyms'] != null
          ? List<dynamic>.from((map['synonyms'] as List<dynamic>))
          : null,
      antonyms: map['antonyms'] != null
          ? List<dynamic>.from((map['antonyms'] as List<dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meaning.fromJson(String source) =>
      Meaning.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Meaning(partOfSpeech: $partOfSpeech, definitions: $definitions, synonyms: $synonyms, antonyms: $antonyms)';
  }

  @override
  bool operator ==(covariant Meaning other) {
    if (identical(this, other)) return true;

    return other.partOfSpeech == partOfSpeech &&
        listEquals(other.definitions, definitions) &&
        listEquals(other.synonyms, synonyms) &&
        listEquals(other.antonyms, antonyms);
  }

  @override
  int get hashCode {
    return partOfSpeech.hashCode ^
        definitions.hashCode ^
        synonyms.hashCode ^
        antonyms.hashCode;
  }
}
