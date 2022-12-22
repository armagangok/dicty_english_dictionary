// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../entity/word_entity.dart';

part 'definition.g.dart';

@HiveType(typeId: 4)
class Definition extends WordEntity {
  @override
  @HiveField(0)
  String? definition;
  @override
  @HiveField(1)
  List<dynamic>? synonyms;
  @override
  @HiveField(2)
  List<dynamic>? antonyms;
  @override
  @HiveField(3)
  String? example;
  Definition({
    this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });

  Definition copyWith({
    String? definition,
    List<dynamic>? synonyms,
    List<dynamic>? antonyms,
    String? example,
  }) {
    return Definition(
      definition: definition ?? this.definition,
      synonyms: synonyms ?? this.synonyms,
      antonyms: antonyms ?? this.antonyms,
      example: example ?? this.example,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'definition': definition,
      'synonyms': synonyms,
      'antonyms': antonyms,
      'example': example,
    };
  }

  factory Definition.fromMap(Map<String, dynamic> map) {
    return Definition(
      definition:
          map['definition'] != null ? map['definition'] as String : null,
      synonyms: map['synonyms'] != null
          ? List<dynamic>.from((map['synonyms'] as List<dynamic>))
          : null,
      antonyms: map['antonyms'] != null
          ? List<dynamic>.from((map['antonyms'] as List<dynamic>))
          : null,
      example: map['example'] != null ? map['example'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Definition.fromJson(String source) =>
      Definition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Definition(definition: $definition, synonyms: $synonyms, antonyms: $antonyms, example: $example)';
  }

  @override
  bool operator ==(covariant Definition other) {
    if (identical(this, other)) return true;

    return other.definition == definition &&
        listEquals(other.synonyms, synonyms) &&
        listEquals(other.antonyms, antonyms) &&
        other.example == example;
  }

  @override
  int get hashCode {
    return definition.hashCode ^
        synonyms.hashCode ^
        antonyms.hashCode ^
        example.hashCode;
  }
}
