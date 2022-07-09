// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models/word_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordAdapter extends TypeAdapter<HiveWord> {
  @override
  final int typeId = 1;

  @override
  HiveWord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveWord(
      word: fields[0] as String?,
      origin: fields[1] as String?,
      meaning1: fields[2] as String?,
      meaning2: fields[3] as String?,
      example: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveWord obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.word)
      ..writeByte(1)
      ..write(obj.origin)
      ..writeByte(2)
      ..write(obj.meaning1)
      ..writeByte(3)
      ..write(obj.meaning2)
      ..writeByte(4)
      ..write(obj.example);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
