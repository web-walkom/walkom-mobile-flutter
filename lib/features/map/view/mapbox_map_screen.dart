import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

@RoutePage()
class MapboxMapScreen extends StatefulWidget {
  const MapboxMapScreen({
    super.key,
    required this.placemarks,
    required this.waypoints,
  });

  final List<Placemark> placemarks;
  final List<Waypoint> waypoints;

  @override
  State<MapboxMapScreen> createState() => _MapboxMapScreenState();
}

class _MapboxMapScreenState extends State<MapboxMapScreen> {
  late MapboxMapController mapController;
  late CameraPosition _initialCameraPosition;
  LatLng currentLocation = const LatLng(58.036947, 56.125779);

  final List<LatLng> placemarksPoints = [];
  final List<LatLng> polylinesPoints = [];

  final apiKeyMapbox = "sk.eyJ1IjoiYjBzaGthIiwiYSI6ImNsamc1N3hkZDAyM3UzZXFpZ3hiMzM2eGcifQ.3Ed8QctY-Hkmtucs5ctoxw";
  final styleUrl = 'mapbox://styles/b0shka/cljeopzw3006501paf66za793';
  // final styleUrl = 'mapbox://styles/mapbox/streets-v12';

  // Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  @override
  void initState() {
    super.initState();
    locationPermission();

    _initialCameraPosition = CameraPosition(
      target: currentLocation,
      zoom: 16,
    );

    for (var waypoint in widget.waypoints) {
      polylinesPoints.add(LatLng(waypoint.latitude, waypoint.longitude));
    }

    for (var placemark in widget.placemarks) {
      placemarksPoints.add(LatLng(placemark.latitude, placemark.longitude));
    }

    // placemarksPoints = [];
    // for (var placemark in widget.placemarks) {
    //   placemarksPoints.add(
    //     Marker(
    //       point: LatLng(placemark.latitude, placemark.longitude),
    //       builder: (ctx) => const Icon(
    //         Icons.place_rounded, 
    //         color: Colors.red, 
    //         size: 28,
    //       ),
    //       rotate: true,
    //     ),
    //   );
    // }
  }

  void locationPermission() async {
    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {
    //     return;
    //   }
    // }

    // _permissionGranted = await location.hasPermission();
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted = await location.requestPermission();
    //   if (_permissionGranted != PermissionStatus.granted) {
    //     return;
    //   }
    // }

    // _locationData = await location.getLocation();

    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   GetIt.I<Talker>().info(currentLocation);
    // });
  }

  void _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
  }

  void _onStyleLoaded() async {
    // LatLng? location = await mapController.requestMyLocationLatLng();
    // GetIt.I<Talker>().info(location);
    // if (location != null) {
    //   mapController.animateCamera(CameraUpdate.newLatLng(location));
    // }
    _addRoute();
    _addPlacemark();
  }

  void _addRoute() {
    LineOptions lineOptions = LineOptions(
      geometry: polylinesPoints,
      lineColor: "#4f92f7",
      lineWidth: 4.0,
    );
    mapController.addLine(lineOptions);
  }

  void _addPlacemark() {
    for (var placemark in placemarksPoints) {
      SymbolOptions symbolOptions = SymbolOptions(
        geometry: placemark,
        iconImage: 'assets/png/placemark.png',
        iconSize: 1.5,
      );
      mapController.addSymbol(symbolOptions);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapboxMap(
            accessToken: apiKeyMapbox,
            initialCameraPosition: _initialCameraPosition,
            styleString: styleUrl,
            onMapCreated: _onMapCreated,
            onStyleLoadedCallback: _onStyleLoaded,
            myLocationEnabled: true,
            myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
            minMaxZoomPreference: const MinMaxZoomPreference(14, 18),
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
