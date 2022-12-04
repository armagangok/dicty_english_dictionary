// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DefinitionAdapter extends TypeAdapter<Definition> {
  @override
  final int typeId = 4;

  @override
  Definition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Definition(
      definition: fields[0] as String?,
      synonyms: (fields[1] as List?)?.cast<dynamic>(),
      antonyms: (fields[2] as List?)?.cast<dynamic>(),
      example: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Definition obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.definition)
      ..writeByte(1)
      ..write(obj.synonyms)
      ..writeByte(2)
      ..write(obj.antonyms)
      ..writeByte(3)
      ..write(obj.example);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DefinitionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
