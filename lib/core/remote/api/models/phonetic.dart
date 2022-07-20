import 'dart:convert';

import 'license.dart';

class Phonetic {
  final String? audio;
  final String? sourceUrl;
  final License? license;
  final String? text;

  const Phonetic({this.audio, this.sourceUrl, this.license, this.text});

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
