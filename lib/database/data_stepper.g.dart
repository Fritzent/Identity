// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_stepper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataStepperAdapter extends TypeAdapter<DataStepper> {
  @override
  final int typeId = 4;

  @override
  DataStepper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataStepper(
      onProgressDataStep: fields[0] as String,
      isStepOneSelected: fields[1] as bool,
      isStepTwoSelected: fields[2] as bool,
      listStepThirdSelected: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, DataStepper obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.onProgressDataStep)
      ..writeByte(1)
      ..write(obj.isStepOneSelected)
      ..writeByte(2)
      ..write(obj.isStepTwoSelected)
      ..writeByte(3)
      ..write(obj.listStepThirdSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataStepperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
