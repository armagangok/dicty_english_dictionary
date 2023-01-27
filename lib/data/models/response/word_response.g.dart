// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WordResponse _$$_WordResponseFromJson(Map<String, dynamic> json) =>
    _$_WordResponse(
      word: json['word'] as String?,
      phonetics: (json['phonetics'] as List<dynamic>?)
          ?.map((e) => Phonetics.fromJson(e as Map<String, dynamic>))
          .toList(),
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((e) => Meanings.fromJson(e as Map<String, dynamic>))
          .toList(),
      license: json['license'] == null
          ? null
          : License.fromJson(json['license'] as Map<String, dynamic>),
      sourceUrls: (json['sourceUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_WordResponseToJson(_$_WordResponse instance) =>
    <String, dynamic>{
      'word': instance.word,
      'phonetics': instance.phonetics,
      'meanings': instance.meanings,
      'license': instance.license,
      'sourceUrls': instance.sourceUrls,
    };
