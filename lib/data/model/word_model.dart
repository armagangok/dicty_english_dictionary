// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:english_accent_dictionary/data/entity/word_entity.dart';

import 'license.dart';
import 'meaning.dart';
import 'phonetic.dart';

part 'word_model.g.dart';

@HiveType(typeId: 1)
class WordModel extends WordEntity {
  @override
  @HiveField(0)
  String? word;

  @override
  @HiveField(1)
  String? origin;

  @override
  @HiveField(2)
  List<Phonetic>? phonetics;

  @override
  @HiveField(3)
  List<Meaning>? meanings;

  @override
  @HiveField(4)
  License? license;

  @override
  @HiveField(5)
  List<dynamic>? sourceUrls;

  @override
  @HiveField(6)
  bool isSelected;

  WordModel({
    this.word,
    this.origin,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
    required this.isSelected,
  });

  WordModel copyWith({
    String? word,
    String? origin,
    List<Phonetic>? phonetics,
    List<Meaning>? meanings,
    License? license,
    List<dynamic>? sourceUrls,
    bool? isSelected,
  }) {
    return WordModel(
      word: word ?? this.word,
      origin: origin ?? this.origin,
      phonetics: phonetics ?? this.phonetics,
      meanings: meanings ?? this.meanings,
      license: license ?? this.license,
      sourceUrls: sourceUrls ?? this.sourceUrls,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'origin': origin,
      'phonetics': phonetics?.map((x) => x.toMap()).toList(),
      'meanings': meanings?.map((x) => x.toMap()).toList(),
      'license': license?.toMap(),
      'sourceUrls': sourceUrls,
      'isSelected': isSelected,
    };
  }

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      word: map['word'] != null ? map['word'] as String : null,
      origin: map['origin'] != null ? map['origin'] as String : null,
      phonetics: map['phonetics'] != null
          ? List<Phonetic>.from(
              (map['phonetics'] as List).map<Phonetic?>(
                (x) => Phonetic.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      meanings: map['meanings'] != null
          ? List<Meaning>.from(
              (map['meanings'] as List).map<Meaning?>(
                (x) => Meaning.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      license: map['license'] != null
          ? License.fromMap(map['license'] as Map<String, dynamic>)
          : null,
      sourceUrls: map['sourceUrls'] != null
          ? List<dynamic>.from((map['sourceUrls'] as List<dynamic>))
          : null,
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory WordModel.fromJson(String source) =>
      WordModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WordModel(word: $word, origin: $origin, phonetics: $phonetics, meanings: $meanings, license: $license, sourceUrls: $sourceUrls, isSelected: $isSelected)';
  }

  @override
  bool operator ==(covariant WordModel other) {
    if (identical(this, other)) return true;

    return other.word == word &&
        other.origin == origin &&
        listEquals(other.phonetics, phonetics) &&
        listEquals(other.meanings, meanings) &&
        other.license == license &&
        listEquals(other.sourceUrls, sourceUrls) &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return word.hashCode ^
        origin.hashCode ^
        phonetics.hashCode ^
        meanings.hashCode ^
        license.hashCode ^
        sourceUrls.hashCode ^
        isSelected.hashCode;
  }
}
