import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

@RoutePage()
class FlutterMapScreen extends StatefulWidget {
  const FlutterMapScreen({
    super.key,
  });

  @override
  State<FlutterMapScreen> createState() => _FlutterMapScreenState();
}

class _FlutterMapScreenState extends State<FlutterMapScreen> {
  final mapController = MapController();
  
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: LatLng(58.010352, 56.237184),
        zoom: 16.0,
        maxZoom: 18.45,
        minZoom: 2.0,
      ),
      children: [
        TileLayer(
          // urlTemplate: 'https://{s}.maps.2gis.com/tiles?x={x}&y={y}&z={z}',
          // subdomains: const ['tile0', 'tile1', 'tile2', 'tile3'],
          // urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          urlTemplate: 'https://api.mapbox.com/styles/v1/b0shka/cljeopzw3006501paf66za793/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYjBzaGthIiwiYSI6ImNsamVvbXl4cDBscXkzZHIzd2oxZWt5bXYifQ.AT-dT2ulw2IaKqo3ixsbWw',
          additionalOptions: const {
            'accessToken': 'pk.eyJ1IjoiYjBzaGthIiwiYSI6ImNsamVvbXl4cDBscXkzZHIzd2oxZWt5bXYifQ.AT-dT2ulw2IaKqo3ixsbWw',
            'id': 'mapbox.mapbox-streets-v8',
          },
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: [
                LatLng(58.010495, 56.237483), 
                LatLng(58.010605, 56.237895), 
                LatLng(58.010928, 56.237592),
                LatLng(58.011184, 56.238490),
              ],
              color: Colors.blue,
              strokeWidth: 5.0,
            ),
          ],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(58.010495, 56.237483),
              builder: (ctx) => const Icon(
                Icons.place_rounded, 
                color: Colors.red, 
                size: 28,
              ),
              rotate: true,
            ),
            Marker(
              point: LatLng(58.011184, 56.238490),
              builder: (ctx) => const Icon(
                Icons.place_rounded, 
                color: Colors.red, 
                size: 28,
              ),
              rotate: true,
            ),
          ],
        ),
      ],
    );
  }
}
