// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class studentmodelAdapter extends TypeAdapter<studentmodel> {
  @override
  final int typeId = 1;

  @override
  studentmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return studentmodel(
      age: fields[1] as String,
      name: fields[0] as String,
      email: fields[2] as String,
      phone: fields[3] as String,
      id: fields[4] as int,
      image: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, studentmodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is studentmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
