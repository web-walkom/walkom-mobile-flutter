import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

@RoutePage()
class OSMMapScreen extends StatefulWidget {
  const OSMMapScreen({
    super.key,
  });

  @override
  State<OSMMapScreen> createState() => _OSMMapScreenState();
}

class _OSMMapScreenState extends State<OSMMapScreen> {
  final _mapController = MapController.withPosition(
    initPosition: GeoPoint(latitude: 58.010352, longitude: 56.237184),
  );

  var placemarks = <String, String>{};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _mapController.listenerMapSingleTapping.addListener(() async {
        var position = _mapController.listenerMapSingleTapping.value;

        if (position != null) {
          await _mapController.addMarker(
            position,
            markerIcon: const MarkerIcon(
              icon: Icon(
                Icons.pin_drop,
                color: Colors.black,
                size: 48,
              ),
            ),
          );

          var key = '${position.latitude}_${position.longitude}';
          placemarks[key] = placemarks.length.toString();
        }
      });
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: null,
        builder: (context, snapshot) {
          return OSMFlutter(
            controller: _mapController,
            initZoom: 16,
            minZoomLevel: 4,
            maxZoomLevel: 19,
            stepZoom: 1.0,
            androidHotReloadSupport: true,
            enableRotationByGesture: true,
            userLocationMarker: UserLocationMaker(
              personMarker: const MarkerIcon(
                icon: Icon(
                  Icons.personal_injury,
                  color: Colors.black,
                  size: 48,
                ),
              ),
              directionArrowMarker: const MarkerIcon(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.black,
                  size: 48,
                ),
              ),
            ),
            roadConfiguration: const RoadOption(roadColor: Colors.blue),
            markerOption: MarkerOption(
              defaultMarker: const MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: Colors.red,
                  size: 48,
                ),
              ),
            ),
            onMapIsReady: (isReady) async => {
              if (isReady) {
                await Future.delayed(const Duration(seconds: 1), () async {
                  await _mapController.currentLocation();
                })
              }
            },
            onGeoPointClicked: (geoPoint) {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container();
                },
              );
            },
          );
        },
      ),
    );
  }
}
