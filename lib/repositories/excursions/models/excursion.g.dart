// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excursion.dart';

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
