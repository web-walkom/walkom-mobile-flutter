import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'placemark.g.dart';

@JsonSerializable()
class Placemark extends Equatable {
  final String id;
  final String title;
  final List<String> photos;
  final double latitude;
  final double longitude;

  const Placemark({
    required this.id,
    required this.title,
    required this.photos,
    required this.latitude,
    required this.longitude,
  });

  factory Placemark.fromJson(Map<String, dynamic> json) =>
      _$PlacemarkFromJson(json);

  Map<String, dynamic> toJson() => _$PlacemarkToJson(this);

  @override
  List<Object?> get props => [id, title, photos, latitude, longitude];
}
