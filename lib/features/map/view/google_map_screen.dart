import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({
    super.key,
  });

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late final GoogleMapController _controller;

  static const LatLng sourceLocation = LatLng(58.010485, 56.237491);
  static const LatLng destinationLocation = LatLng(58.012790, 56.244087);

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    polylineCoordinates.add(sourceLocation);
    polylineCoordinates.add(destinationLocation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: null,
        builder: (context, snapshot) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: sourceLocation,
                  zoom: 17,
                ),
                onMapCreated: _onMapCreated,
                mapType: MapType.normal,
                myLocationEnabled: true,
                markers: _markers,
                polylines: _polyline,
              ),
            ],
          );
        },
      ),
    );
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      _controller = controllerParam;
      _markers.add(Marker(
        markerId: MarkerId(sourceLocation.toString()),
        position: sourceLocation,
        infoWindow: const InfoWindow(
          title: 'Awesome Polyline tutorial',
          snippet: 'This is a snippet',
        ),
      ));

      _polyline.add(Polyline(
          polylineId: const PolylineId('route'),
          visible: true,
          points: polylineCoordinates,
          width: 4,
          color: Colors.blue,
          jointType: JointType.round));
    });
  }
}
