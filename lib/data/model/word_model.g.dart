// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordModelAdapter extends TypeAdapter<WordModel> {
  @override
  final int typeId = 1;

  @override
  WordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordModel(
      word: fields[0] as String?,
      origin: fields[1] as String?,
      phonetics: (fields[2] as List?)?.cast<Phonetic>(),
      meanings: (fields[3] as List?)?.cast<Meaning>(),
      license: fields[4] as License?,
      sourceUrls: (fields[5] as List?)?.cast<dynamic>(),
      isSelected: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.word)
      ..writeByte(1)
      ..write(obj.origin)
      ..writeByte(2)
      ..write(obj.phonetics)
      ..writeByte(3)
      ..write(obj.meanings)
      ..writeByte(4)
      ..write(obj.license)
      ..writeByte(5)
      ..write(obj.sourceUrls)
      ..writeByte(6)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
