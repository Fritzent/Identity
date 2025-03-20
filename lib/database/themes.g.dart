// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'themes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemesAdapter extends TypeAdapter<Themes> {
  @override
  final int typeId = 1;

  @override
  Themes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Themes(
      themeMode: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Themes obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.themeMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
