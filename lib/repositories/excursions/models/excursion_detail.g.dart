// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excursion_detail.dart';

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
    );

Map<String, dynamic> _$ExcursionDetailToJson(ExcursionDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'photos': instance.photos,
      'description': instance.description,
    };
