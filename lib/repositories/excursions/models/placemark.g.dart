// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placemark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Placemark _$PlacemarkFromJson(Map<String, dynamic> json) => Placemark(
      id: json['id'] as String,
      title: json['title'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$PlacemarkToJson(Placemark instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'photos': instance.photos,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
