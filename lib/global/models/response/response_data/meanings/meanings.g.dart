// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meanings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meanings _$$_MeaningsFromJson(Map<String, dynamic> json) => _$_Meanings(
      partOfSpeech: json['partOfSpeech'] as String?,
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((e) => Definitions.fromJson(e as Map<String, dynamic>))
          .toList(),
      synonyms: json['synonyms'] as List<dynamic>?,
      antonyms: json['antonyms'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_MeaningsToJson(_$_Meanings instance) =>
    <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'definitions': instance.definitions,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
    };
