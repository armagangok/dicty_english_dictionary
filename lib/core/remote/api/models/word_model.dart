import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'license.dart';
import 'meaning.dart';
import 'phonetic.dart';

class WordModel {
  final String? word;
  final List<Phonetic>? phonetics;
  final List<Meaning>? definitions;
  final License? license;
  final List<dynamic>? sourceUrls;
  WordModel({
    this.word,
    this.phonetics,
    this.definitions,
    this.license,
    this.sourceUrls,
  });

  WordModel copyWith({
    String? word,
    List<Phonetic>? phonetics,
    List<Meaning>? meanings,
    License? license,
    List<dynamic>? sourceUrls,
  }) {
    return WordModel(
      word: word ?? this.word,
      phonetics: phonetics ?? this.phonetics,
      definitions: meanings ?? definitions,
      license: license ?? this.license,
      sourceUrls: sourceUrls ?? this.sourceUrls,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'phonetics': phonetics?.map((x) => x.toMap()).toList(),
      'meanings': definitions?.map((x) => x.toMap()).toList(),
      'license': license?.toMap(),
      'sourceUrls': sourceUrls,
    };
  }

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      word: map['word'],
      phonetics: map['phonetics'] != null
          ? List<Phonetic>.from(
              map['phonetics']?.map((x) => Phonetic.fromMap(x)))
          : null,
      definitions: map['meanings'] != null
          ? List<Meaning>.from(map['meanings']?.map((x) => Meaning.fromMap(x)))
          : null,
      license: map['license'] != null ? License.fromMap(map['license']) : null,
      sourceUrls: List<dynamic>.from(map['sourceUrls']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WordModel.fromJson(String source) =>
      WordModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyModel(word: $word, phonetics: $phonetics, meanings: $definitions, license: $license, sourceUrls: $sourceUrls)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordModel &&
        other.word == word &&
        listEquals(other.phonetics, phonetics) &&
        listEquals(other.definitions, definitions) &&
        other.license == license &&
        listEquals(other.sourceUrls, sourceUrls);
  }

  @override
  int get hashCode {
    return word.hashCode ^
        phonetics.hashCode ^
        definitions.hashCode ^
        license.hashCode ^
        sourceUrls.hashCode;
  }
}
