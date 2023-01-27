// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phonetics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Phonetics _$$_PhoneticsFromJson(Map<String, dynamic> json) => _$_Phonetics(
      audio: json['audio'] as String?,
      sourceUrl: json['sourceUrl'] as String?,
      license: json['license'] == null
          ? null
          : License.fromJson(json['license'] as Map<String, dynamic>),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$_PhoneticsToJson(_$_Phonetics instance) =>
    <String, dynamic>{
      'audio': instance.audio,
      'sourceUrl': instance.sourceUrl,
      'license': instance.license,
      'text': instance.text,
    };
