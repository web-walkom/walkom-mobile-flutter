import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'waypoint.g.dart';

@JsonSerializable()
class Waypoint extends Equatable {
  const Waypoint({
    required this.id,
    required this.audio,
    required this.latitude,
    required this.longitude,
  });

  final String id;
  final String audio;
  final double latitude;
  final double longitude;

  factory Waypoint.fromJson(Map<String, dynamic> json) =>
      _$WaypointFromJson(json);

  Map<String, dynamic> toJson() => _$WaypointToJson(this);

  @override
  List<Object?> get props => [id, audio, latitude, longitude];
}
