// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phonetic.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhoneticAdapter extends TypeAdapter<Phonetic> {
  @override
  final int typeId = 5;

  @override
  Phonetic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Phonetic(
      audio: fields[0] as String?,
      sourceUrl: fields[1] as String?,
      license: fields[2] as License?,
      text: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Phonetic obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.audio)
      ..writeByte(1)
      ..write(obj.sourceUrl)
      ..writeByte(2)
      ..write(obj.license)
      ..writeByte(3)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneticAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
