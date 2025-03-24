// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CvPdfFileAdapter extends TypeAdapter<CvPdfFile> {
  @override
  final int typeId = 2;

  @override
  CvPdfFile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CvPdfFile(
      fileName: fields[0] as String,
      fileBytes: (fields[1] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, CvPdfFile obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fileName)
      ..writeByte(1)
      ..write(obj.fileBytes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CvPdfFileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
