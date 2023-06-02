// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Waypoint _$WaypointFromJson(Map<String, dynamic> json) => Waypoint(
      id: json['id'] as String,
      audio: json['audio'] as String,
      placemarkId: json['placemarkId'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$WaypointToJson(Waypoint instance) => <String, dynamic>{
      'id': instance.id,
      'audio': instance.audio,
      'placemarkId': instance.placemarkId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
