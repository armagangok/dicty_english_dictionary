// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meanings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meaning _$$_MeaningFromJson(Map<String, dynamic> json) => _$_Meaning(
      partOfSpeech: json['partOfSpeech'] as String?,
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList(),
      synonyms: json['synonyms'] as List<dynamic>?,
      antonyms: json['antonyms'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_MeaningToJson(_$_Meaning instance) =>
    <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'definitions': instance.definitions,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
    };
