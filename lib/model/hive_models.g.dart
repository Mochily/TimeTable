// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CellModelAdapter extends TypeAdapter<CellModel> {
  @override
  final int typeId = 0;

  @override
  CellModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CellModel(
      screenNo: fields[0] as int,
      indexNo: fields[1] as String,
      className: fields[2] as String,
      teacherName: fields[3] as String,
      classRoomName: fields[4] as String,
      containerColor: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CellModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.screenNo)
      ..writeByte(1)
      ..write(obj.indexNo)
      ..writeByte(2)
      ..write(obj.className)
      ..writeByte(3)
      ..write(obj.teacherName)
      ..writeByte(4)
      ..write(obj.classRoomName)
      ..writeByte(5)
      ..write(obj.containerColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CellModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PeriodModelAdapter extends TypeAdapter<PeriodModel> {
  @override
  final int typeId = 1;

  @override
  PeriodModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PeriodModel(
      screenNo: fields[0] as int,
      periodNo: fields[1] as String,
      timeTop: fields[2] as String,
      timeBottom: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PeriodModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.screenNo)
      ..writeByte(1)
      ..write(obj.periodNo)
      ..writeByte(2)
      ..write(obj.timeTop)
      ..writeByte(3)
      ..write(obj.timeBottom);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeriodModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
