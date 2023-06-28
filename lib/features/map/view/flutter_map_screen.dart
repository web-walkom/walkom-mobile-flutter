import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/features/map/widgets/widgets.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

@RoutePage()
class FlutterMapScreen extends StatefulWidget {
  const FlutterMapScreen({
    super.key,
    required this.placemarks,
    required this.waypoints,
  });

  final List<Placemark> placemarks;
  final List<Waypoint> waypoints;

  @override
  State<FlutterMapScreen> createState() => _FlutterMapScreenState();
}

class _FlutterMapScreenState extends State<FlutterMapScreen> {
  final mapController = MapController();
  // final PopupController _popupLayerController = PopupController();

  late final List<Marker> placemarksPoints;
  final List<LatLng> polylinesPoints = [];

  final apiKeyMapbox = "pk.eyJ1IjoiYjBzaGthIiwiYSI6ImNsamVvbXl4cDBscXkzZHIzd2oxZWt5bXYifQ.AT-dT2ulw2IaKqo3ixsbWw";
  final apiKeyStadiaMaps = "57f7635f-8a1a-442d-bfa1-0b442e5e8a36";
  
  @override
  void initState() {
    super.initState();

    for (var polyline in widget.waypoints) {
      polylinesPoints.add(LatLng(polyline.latitude, polyline.longitude));
    }

    placemarksPoints = [];
    for (var placemark in widget.placemarks) {
      placemarksPoints.add(
        Marker(
          point: LatLng(placemark.latitude, placemark.longitude),
          builder: (ctx) => const Icon(
            Icons.place_rounded, 
            color: Colors.red, 
            size: 28,
          ),
          rotate: true,
        ),
      );
    }
    // placemarksPoints.map(
    //   (markerPosition) => Marker(
    //     point: markerPosition.point,
    //     width: 40,
    //     height: 40,
    //     builder: (_) => const Icon(Icons.location_on, size: 40),
    //     anchorPos: AnchorPos.align(AnchorAlign.top),
    //     rotateAlignment: AnchorAlign.top.rotationAlignment,
    //   ),
    // )
    // .toList();
  }

  @override
  void dispose() {
    mapController.dispose();
    // _popupLayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: polylinesPoints[0],
              zoom: 17.0,
              maxZoom: 18.45,
              minZoom: 2.0,
            ),
            children: [
              TileLayer(
                // urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                // subdomains: const ['a', 'b', 'c'],
                // urlTemplate: 'https://{s}.maps.2gis.com/tiles?x={x}&y={y}&z={z}',
                // subdomains: const ['tile0', 'tile1', 'tile2', 'tile3'],
                urlTemplate: 'https://api.mapbox.com/styles/v1/mapbox/streets-v12/tiles/256/{z}/{x}/{y}@2x?access_token=$apiKeyMapbox',
                additionalOptions: {
                  'accessToken': apiKeyMapbox,
                  'id': 'mapbox.mapbox-streets-v8',
                },
                // urlTemplate: "https://tiles.stadiamaps.com/tiles/osm_bright/{z}/{x}/{y}{r}.png?api_key=$apiKeyStadiaMaps",
                // additionalOptions: {
                //   "api_key": apiKeyStadiaMaps,
                // },
              ),
              // CurrentLocationLayer(
              //   followOnLocationUpdate: FollowOnLocationUpdate.always,
              //   turnOnHeadingUpdate: TurnOnHeadingUpdate.always,
              //   style: const LocationMarkerStyle(
              //     marker: DefaultLocationMarker(
              //       child: Icon(
              //         Icons.navigation,
              //         color: Colors.blue,
              //       ),
              //     ),
              //     markerSize: Size(40, 40),
              //     markerDirection: MarkerDirection.heading,
              //   ),
              // ),
              PolylineLayer(
                polylineCulling: true,
                polylines: [
                  Polyline(
                    points: polylinesPoints,
                    color: Colors.blue,
                    strokeWidth: 5.0,
                    isDotted: false,
                  ),
                ],
              ),
              MarkerLayer(markers: placemarksPoints),
              // PopupMarkerLayer(
              //   options: PopupMarkerLayerOptions(
              //     popupController: _popupLayerController,
              //     markers: placemarksPoints,
              //     popupDisplayOptions: PopupDisplayOptions(
              //       builder: (BuildContext context, Marker marker) =>
              //           PopupPlacemark(marker),
              //     ),
              //   ),
              // ),
            ],
          ),
          Positioned(
            top: 50,
            left: 25,
            right: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  elevation: 3,
                  width: 50,
                  height: 50,
                  onClick: () {
                    AutoRouter.of(context).pop();
                  },
                ),
                CircleButton(
                  icon: Icons.notes_rounded,
                  color: Colors.white,
                  elevation: 3,
                  width: 50,
                  height: 50,
                  onClick: () {
                    listRouteExcursion(context);
                  },
                ),
              ]
            ),
          ),
          Positioned(
            bottom: 100,
            right: 25,
            child:  CircleButton(
              icon: Icons.near_me_rounded,
              color: Colors.white,
              elevation: 3,
              width: 50,
              height: 50,
              iconSize: 25,
              onClick: () {
                
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 25,
            right: 25,
            child: MainButton(
              title: BUTTON_START_EXCURSION,
              onClick: () {
                
              },
            ),
          ),
        ],
      ),
    );
  }

  listRouteExcursion(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext c) {
        return const ModalBottomSheet(
          child: Column(
            children: [
              SizedBox(height: 10),
              ModalBottomSheetItem(
                title: TEXT_ADD_FAVORITE,
                icon: Icons.bookmark_rounded,
              ),
              ModalBottomSheetItem(
                title: TEXT_REPORT_ERROR,
                icon: Icons.report_rounded,
              ),
              ModalBottomSheetItem(
                title: TEXT_DELETE_FILES,
                icon: Icons.delete_rounded,
              ),
              SizedBox(height: 10)
            ],
          ),
        );
      },
    );
  }
}
