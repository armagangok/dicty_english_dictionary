// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:hive/hive.dart';

import '../entity/word_entity.dart';
import 'license.dart';

part 'phonetic.g.dart';

@HiveType(typeId: 5)
class Phonetic extends WordEntity {
  @HiveField(0)
  String? audio;
  @HiveField(1)
  String? sourceUrl;
  @override
  @HiveField(2)
  License? license;
  @HiveField(3)
  String? text;
  Phonetic({
    this.audio,
    this.sourceUrl,
    this.license,
    this.text,
  });

  Phonetic copyWith({
    String? audio,
    String? sourceUrl,
    License? license,
    String? text,
  }) {
    return Phonetic(
      audio: audio ?? this.audio,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      license: license ?? this.license,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'audio': audio,
      'sourceUrl': sourceUrl,
      'license': license?.toMap(),
      'text': text,
    };
  }

  factory Phonetic.fromMap(Map<String, dynamic> map) {
    return Phonetic(
      audio: map['audio'] != null ? map['audio'] as String : null,
      sourceUrl: map['sourceUrl'] != null ? map['sourceUrl'] as String : null,
      license: map['license'] != null ? License.fromMap(map['license'] as Map<String,dynamic>) : null,
      text: map['text'] != null ? map['text'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Phonetic.fromJson(String source) => Phonetic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Phonetic(audio: $audio, sourceUrl: $sourceUrl, license: $license, text: $text)';
  }

  @override
  bool operator ==(covariant Phonetic other) {
    if (identical(this, other)) return true;
  
    return 
      other.audio == audio &&
      other.sourceUrl == sourceUrl &&
      other.license == license &&
      other.text == text;
  }

  @override
  int get hashCode {
    return audio.hashCode ^
      sourceUrl.hashCode ^
      license.hashCode ^
      text.hashCode;
  }
}
