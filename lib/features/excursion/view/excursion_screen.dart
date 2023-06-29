import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/features/excursion/bloc/excursion_bloc.dart';
import 'package:walkom_mobile_flutter/features/excursion/widgets/widgets.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';
import 'package:walkom_mobile_flutter/router/router.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

@RoutePage()
class ExcursionScreen extends StatefulWidget {
  const ExcursionScreen({
    super.key,
    required this.excursion,
  });

  final Excursion excursion;

  @override
  State<ExcursionScreen> createState() => _ExcursionScreenState();
}

class _ExcursionScreenState extends State<ExcursionScreen> {
  final _excursionBloc = ExcursionBloc(
    GetIt.I<ExcursionsRepository>(),
  );

  LocationData? currentLocation;
  // Position? _currentPosition;

  @override
  void initState() {
    _excursionBloc.add(LoadExcursion(excursionId: widget.excursion.id));
    super.initState();
  }

  // Future<LocationData?> _getLocation() async {
  //   final location = await getLocation();
  //   return location;
  // }

  Future<LocationData?> _getLocation() async {
    // Location _location = Location();
    // LocationData _locationData;
    //
    // bool _serviceEnabled;
    // PermissionStatus _permissionGranted;
    //
    // _serviceEnabled = await _location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await _location.requestService();
    //   if (!_serviceEnabled) {
    //     return null;
    //   }
    // }
    //
    // _permissionGranted = await _location.hasPermission();
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted = await _location.requestPermission();
    //   if (_permissionGranted != PermissionStatus.granted) {
    //     return null;
    //   }
    // }
    //
    // _locationData = await _location.getLocation();
    // return _locationData;
  }

  // _getCurrentLocation() {
  //   print("_getCurrentLocation");
  //   Geolocator
  //     .getCurrentPosition(forceAndroidLocationManager: true)
  //     .then((Position position) {
  //       print(position);
  //       setState(() {
  //         _currentPosition = position;
  //       });
  //     }).catchError((e) {
  //       print(e);
  //     });
  // }

  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //   GetIt.I<Talker>().info(serviceEnabled);
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //   GetIt.I<Talker>().info(permission);
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //       'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   return await Geolocator.getCurrentPosition();
  // }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ExcursionBloc, ExcursionState>(
          bloc: _excursionBloc,
          builder: (context, state) {
            return Stack(
              children: [
                const Positioned(
                  top: 50,
                  left: 25,
                  right: 25,
                  child: ToolbarExcursion(),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  child: Ink.image(
                    image: NetworkImage(widget.excursion.photos[0]),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 55 / 100,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 55 / 100 - 40,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 25.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 45 / 100 - 35,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(45.0)),
                    ),
                    child: Column(
                      children: [
                        SelectableText(
                          widget.excursion.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Expanded(
                          child: (state is ExcursionLoaded)
                              ? SelectableText(
                                  state.excursion.description,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                )
                              : (state is ExcursionError)
                                  ? ErrorLoad(tryAgain: () {
                                      _excursionBloc.add(LoadExcursion(
                                          excursionId: widget.excursion.id));
                                    })
                                  : const Loader(),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 30,
                  right: 30,
                  child: Column(
                    children: [
                      // if (_currentPosition != null)
                      //   Text(
                      //     "Location: ${_currentPosition?.latitude}, ${_currentPosition?.longitude}",
                      //   ),
                      // if (_currentPosition == null)
                      //   const Text("Location: null"),
                        
                      if (currentLocation != null)
                        Text(
                          "Location: ${currentLocation?.latitude}, ${currentLocation?.longitude}",
                        ),
                      if (currentLocation == null)
                        const Text("Location: null"),
                      
                      MainButton(
                        title: BUTTON_RUN_EXCURSION,
                        isLoading: state is ExcursionLoading,
                        onClick: () {
                          if (state is ExcursionLoaded) {
                            // AutoRouter.of(context).push(
                            //   FlutterMapRoute(
                            //     placemarks: state.excursion.placemarks,
                            //     waypoints: state.excursion.waypoints,
                            //   ),
                            // );

                            AutoRouter.of(context).push(
                              MapboxMapRoute(
                                placemarks: state.excursion.placemarks,
                                waypoints: state.excursion.waypoints,
                              ),
                            );
                          }

                          // AutoRouter.of(context).push(const OSMMapRoute());
                          // AutoRouter.of(context).push(const GoogleMapRoute());

                          // _getLocation().then((value) {
                          //   LocationData? location = value;
                          //   setState(() {
                          //     currentLocation = location;
                          //   });
                          // });

                          // _determinePosition().then((value) {
                          //   Position? location = value;
                          //   setState(() {
                          //     _currentPosition = location;
                          //   });
                          // });

                          // _getCurrentLocation();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
