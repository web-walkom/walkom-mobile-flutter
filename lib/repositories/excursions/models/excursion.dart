import 'package:equatable/equatable.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/placemark.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/waypoint.dart';

class ExcursionItem extends Equatable {
  const ExcursionItem({
    required this.id,
    required this.title,
    required this.photos,
  });

  final String id;
  final String title;
  final List<String> photos;

  @override
  List<Object?> get props => [id, title, photos];
}

class ExcursionOpen {
  const ExcursionOpen({
    required this.id,
    required this.title,
    required this.description,
    required this.photos,
    // required this.placemarks,
    // required this.waypoints,
  });

  final String id;
  final String title;
  final String description;
  final List<String> photos;
  // final List<Placemark> placemarks;
  // final List<Waypoint> waypoints;
}
