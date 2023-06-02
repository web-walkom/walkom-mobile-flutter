import 'package:json_annotation/json_annotation.dart';

part 'placemark.g.dart';

@JsonSerializable()
class Placemark {
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
}
