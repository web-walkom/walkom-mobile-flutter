import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

@RoutePage()
class YandexMapScreen extends StatefulWidget {
  const YandexMapScreen({
    super.key,
    required this.placemarks,
    required this.waypoints,
  });

  final List<Placemark> placemarks;
  final List<Waypoint> waypoints;

  @override
  State<YandexMapScreen> createState() => _YandexMapScreenState();
}

class _YandexMapScreenState extends State<YandexMapScreen> {
  final _mapController = Completer<YandexMapController>();
  late Point startPoint;

  @override
  void initState() {
    super.initState();

    startPoint = Point(
      latitude: widget.waypoints.first.latitude,
      longitude: widget.waypoints.first.longitude,
    );

    _initPermission();
  }

  void _onMapCreated(YandexMapController controller) {
    _mapController.complete(controller);
    // controller.moveCamera(
    //   animation:
    //       const MapAnimation(type: MapAnimationType.linear, duration: 0.5),
    //   CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //       target: startPoint,
    //       zoom: 16,
    //     ),
    //   ),
    // );
  }

  Future<Point> getCurrentLocation() async {
    return Geolocator.getCurrentPosition().then((value) {
      GetIt.I<Talker>().info(value);
      return Point(latitude: value.latitude, longitude: value.longitude);
    }).catchError(
      (_) => startPoint,
    );
  }

  Future<bool> requestPermission() {
    return Geolocator.requestPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  Future<bool> checkPermission() {
    return Geolocator.checkPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  Future<void> _initPermission() async {
    if (!await checkPermission()) {
      await requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    Point location;
    try {
      location = await getCurrentLocation();
    } catch (_) {
      location = startPoint;
    }
    _moveToCurrentLocation(location);
  }

  Future<void> _moveToCurrentLocation(Point point) async {
    (await _mapController.future).moveCamera(
      animation: const MapAnimation(
        type: MapAnimationType.linear,
        duration: 0.5,
      ),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: point.latitude,
            longitude: point.longitude,
          ),
          zoom: 12,
        ),
      ),
    );
  }

  void _addRoute() {}

  void _addPlacemark() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: _onMapCreated,
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
