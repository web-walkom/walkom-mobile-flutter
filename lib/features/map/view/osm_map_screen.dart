import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/models.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

@RoutePage()
class OSMMapScreen extends StatefulWidget {
  const OSMMapScreen({
    super.key,
    required this.placemarks,
    required this.waypoints,
  });

  final List<Placemark> placemarks;
  final List<Waypoint> waypoints;

  @override
  State<OSMMapScreen> createState() => _OSMMapScreenState();
}

class _OSMMapScreenState extends State<OSMMapScreen> {
  final startPoint = GeoPoint(latitude: 55.173067, longitude: 61.518140);
  // final _mapController = MapController.withPosition(
  //   initPosition: GeoPoint(latitude: 55.173067, longitude: 61.518140),
  // );
  final _mapController = MapController.withUserPosition(
    trackUserLocation: const UserTrackingOption(
      enableTracking: true,
      unFollowUser: true,
    ),
  );

  final List<GeoPoint> placemarksPoints = [];
  final List<GeoPoint> polylinesPoints = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      for (var waypoint in widget.waypoints) {
        polylinesPoints.add(
          GeoPoint(
            latitude: waypoint.latitude,
            longitude: waypoint.longitude,
          ),
        );
      }

      for (var placemark in widget.placemarks) {
        placemarksPoints.add(
          GeoPoint(
            latitude: placemark.latitude,
            longitude: placemark.longitude,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _onMapCreated(bool isReady) async {
    if (isReady) {
      await Future.delayed(const Duration(seconds: 1), () async {
        await _mapController.currentLocation();
        _mapController
            .myLocation()
            .then((value) => {GetIt.I<Talker>().info(value)});
      });

      // _addRoute();
      // _addPlacemark();
    }
  }

  void _addRoute() async {
    _mapController.drawRoadManually(
      polylinesPoints,
      const RoadOption(
        roadWidth: 10,
        roadColor: Colors.blue,
        zoomInto: true,
      ),
    );
  }

  void _addPlacemark() {
    for (var placemark in placemarksPoints) {
      _mapController.addMarker(
        placemark,
        markerIcon: const MarkerIcon(
          icon: Icon(
            Icons.location_on,
            color: Colors.red,
            size: 48,
          ),
        ),
      );
    }
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
              OSMFlutter(
                controller: _mapController,
                initZoom: 16,
                minZoomLevel: 14,
                maxZoomLevel: 19,
                stepZoom: 1.0,
                androidHotReloadSupport: true,
                enableRotationByGesture: true,
                userTrackingOption: const UserTrackingOption(
                  enableTracking: true,
                  unFollowUser: false,
                ),
                userLocationMarker: UserLocationMaker(
                  personMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.navigation_rounded,
                      color: Colors.blue,
                      size: 48,
                    ),
                  ),
                  directionArrowMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.navigation_rounded,
                      color: Colors.blue,
                      size: 48,
                    ),
                  ),
                ),
                markerOption: MarkerOption(
                  defaultMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                ),
                onMapIsReady: (isReady) async => _onMapCreated(isReady),
                onGeoPointClicked: (geoPoint) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container();
                    },
                  );
                },
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
                    ]),
              ),
              Positioned(
                bottom: 100,
                right: 25,
                child: CircleButton(
                  icon: Icons.near_me_rounded,
                  color: Colors.white,
                  elevation: 3,
                  width: 50,
                  height: 50,
                  iconSize: 25,
                  onClick: () {},
                ),
              ),
              Positioned(
                bottom: 20,
                left: 25,
                right: 25,
                child: MainButton(
                  title: BUTTON_START_EXCURSION,
                  onClick: () {},
                ),
              ),
            ],
          );
        },
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
