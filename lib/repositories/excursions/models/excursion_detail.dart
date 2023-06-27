import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/models.dart';

part 'excursion_detail.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class ExcursionDetail extends Equatable {
  const ExcursionDetail({
    required this.id,
    required this.title,
    required this.photos,
    required this.description,
    required this.placemarks,
    required this.waypoints,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<String> photos;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final List<Placemark> placemarks;

  @HiveField(5)
  final List<Waypoint> waypoints;

  factory ExcursionDetail.fromJson(Map<String, dynamic> json) =>
      _$ExcursionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ExcursionDetailToJson(this);

  @override
  List<Object?> get props => [id, title, photos, description];
}
