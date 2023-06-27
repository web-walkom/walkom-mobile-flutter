// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excursion_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExcursionDetailAdapter extends TypeAdapter<ExcursionDetail> {
  @override
  final int typeId = 3;

  @override
  ExcursionDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExcursionDetail(
      id: fields[0] as String,
      title: fields[1] as String,
      photos: (fields[2] as List).cast<String>(),
      description: fields[3] as String,
      placemarks: (fields[4] as List).cast<Placemark>(),
      waypoints: (fields[5] as List).cast<Waypoint>(),
    );
  }

  @override
  void write(BinaryWriter writer, ExcursionDetail obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.photos)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.placemarks)
      ..writeByte(5)
      ..write(obj.waypoints);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExcursionDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExcursionDetail _$ExcursionDetailFromJson(Map<String, dynamic> json) =>
    ExcursionDetail(
      id: json['id'] as String,
      title: json['title'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      placemarks: (json['placemarks'] as List<dynamic>)
          .map((e) => Placemark.fromJson(e as Map<String, dynamic>))
          .toList(),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map((e) => Waypoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExcursionDetailToJson(ExcursionDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'photos': instance.photos,
      'description': instance.description,
      'placemarks': instance.placemarks,
      'waypoints': instance.waypoints,
    };
