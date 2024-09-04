// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saveModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveModelAdapter extends TypeAdapter<SaveModel> {
  @override
  final int typeId = 6;

  @override
  SaveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveModel(
      author: fields[0] as String,
      content: fields[6] as String,
      description: fields[2] as String,
      name: fields[7] as String,
      publishedAt: fields[5] as String,
      title: fields[1] as String,
      url: fields[3] as String,
      urlToImage: fields[4] as String,
      dateTime: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SaveModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.urlToImage)
      ..writeByte(5)
      ..write(obj.publishedAt)
      ..writeByte(6)
      ..write(obj.content)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
