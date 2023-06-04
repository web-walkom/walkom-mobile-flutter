import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/models.dart';

part 'excursion_detail.g.dart';

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

  final String id;
  final String title;
  final List<String> photos;
  final String description;
  final List<Placemark> placemarks;
  final List<Waypoint> waypoints;

  factory ExcursionDetail.fromJson(Map<String, dynamic> json) =>
      _$ExcursionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ExcursionDetailToJson(this);

  @override
  List<Object?> get props => [id, title, photos, description];
}
