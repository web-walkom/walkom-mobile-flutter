// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excursion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExcursionAdapter extends TypeAdapter<Excursion> {
  @override
  final int typeId = 2;

  @override
  Excursion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Excursion(
      id: fields[0] as String,
      title: fields[1] as String,
      photos: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Excursion obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.photos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExcursionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Excursion _$ExcursionFromJson(Map<String, dynamic> json) => Excursion(
      id: json['id'] as String,
      title: json['title'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ExcursionToJson(Excursion instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'photos': instance.photos,
    };
