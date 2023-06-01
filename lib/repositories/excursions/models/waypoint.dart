class Waypoint {
  const Waypoint({
    required this.id,
    required this.audio,
    required this.placemarkId,
    required this.latitude,
    required this.longitude,
  });

  final String id;
  final String audio;
  final String placemarkId;
  final double latitude;
  final double longitude;
}
