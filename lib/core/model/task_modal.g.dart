// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModalAdapter extends TypeAdapter<TaskModal> {
  @override
  final int typeId = 1;

  @override
  TaskModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModal(
      title: fields[0] as String,
      note: fields[1] as String,
      date: fields[2] as String,
      starttime: fields[3] as String,
      endtime: fields[4] as String,
      isCompleted: fields[5] as bool,
      color: fields[6] as int,
      id: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModal obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.starttime)
      ..writeByte(4)
      ..write(obj.endtime)
      ..writeByte(5)
      ..write(obj.isCompleted)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
