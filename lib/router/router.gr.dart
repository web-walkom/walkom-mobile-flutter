// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CodeVerifyRoute.name: (routeData) {
      final args = routeData.argsAs<CodeVerifyRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CodeVerifyScreen(
          key: args.key,
          email: args.email,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthScreen(),
      );
    },
    MapboxMapRoute.name: (routeData) {
      final args = routeData.argsAs<MapboxMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MapboxMapScreen(
          key: args.key,
          placemarks: args.placemarks,
          waypoints: args.waypoints,
        ),
      );
    },
    FlutterMapRoute.name: (routeData) {
      final args = routeData.argsAs<FlutterMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FlutterMapScreen(
          key: args.key,
          placemarks: args.placemarks,
          waypoints: args.waypoints,
        ),
      );
    },
    OSMMapRoute.name: (routeData) {
      final args = routeData.argsAs<OSMMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OSMMapScreen(
          key: args.key,
          placemarks: args.placemarks,
          waypoints: args.waypoints,
        ),
      );
    },
    AboutAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutAppScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    DecorationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DecorationScreen(),
      );
    },
    PersonalDataRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalDataRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PersonalDataScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    FavoriteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteScreen(),
      );
    },
    ExcursionsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExcursionsListScreen(),
      );
    },
    DataAndMemoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DataAndMemoryScreen(),
      );
    },
    ExcursionRoute.name: (routeData) {
      final args = routeData.argsAs<ExcursionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExcursionScreen(
          key: args.key,
          excursion: args.excursion,
        ),
      );
    },
  };
}

/// generated route for
/// [CodeVerifyScreen]
class CodeVerifyRoute extends PageRouteInfo<CodeVerifyRouteArgs> {
  CodeVerifyRoute({
    Key? key,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          CodeVerifyRoute.name,
          args: CodeVerifyRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'CodeVerifyRoute';

  static const PageInfo<CodeVerifyRouteArgs> page =
      PageInfo<CodeVerifyRouteArgs>(name);
}

class CodeVerifyRouteArgs {
  const CodeVerifyRouteArgs({
    this.key,
    required this.email,
  });

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'CodeVerifyRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapboxMapScreen]
class MapboxMapRoute extends PageRouteInfo<MapboxMapRouteArgs> {
  MapboxMapRoute({
    Key? key,
    required List<Placemark> placemarks,
    required List<Waypoint> waypoints,
    List<PageRouteInfo>? children,
  }) : super(
          MapboxMapRoute.name,
          args: MapboxMapRouteArgs(
            key: key,
            placemarks: placemarks,
            waypoints: waypoints,
          ),
          initialChildren: children,
        );

  static const String name = 'MapboxMapRoute';

  static const PageInfo<MapboxMapRouteArgs> page =
      PageInfo<MapboxMapRouteArgs>(name);
}

class MapboxMapRouteArgs {
  const MapboxMapRouteArgs({
    this.key,
    required this.placemarks,
    required this.waypoints,
  });

  final Key? key;

  final List<Placemark> placemarks;

  final List<Waypoint> waypoints;

  @override
  String toString() {
    return 'MapboxMapRouteArgs{key: $key, placemarks: $placemarks, waypoints: $waypoints}';
  }
}

/// generated route for
/// [FlutterMapScreen]
class FlutterMapRoute extends PageRouteInfo<FlutterMapRouteArgs> {
  FlutterMapRoute({
    Key? key,
    required List<Placemark> placemarks,
    required List<Waypoint> waypoints,
    List<PageRouteInfo>? children,
  }) : super(
          FlutterMapRoute.name,
          args: FlutterMapRouteArgs(
            key: key,
            placemarks: placemarks,
            waypoints: waypoints,
          ),
          initialChildren: children,
        );

  static const String name = 'FlutterMapRoute';

  static const PageInfo<FlutterMapRouteArgs> page =
      PageInfo<FlutterMapRouteArgs>(name);
}

class FlutterMapRouteArgs {
  const FlutterMapRouteArgs({
    this.key,
    required this.placemarks,
    required this.waypoints,
  });

  final Key? key;

  final List<Placemark> placemarks;

  final List<Waypoint> waypoints;

  @override
  String toString() {
    return 'FlutterMapRouteArgs{key: $key, placemarks: $placemarks, waypoints: $waypoints}';
  }
}

/// generated route for
/// [OSMMapScreen]
class OSMMapRoute extends PageRouteInfo<OSMMapRouteArgs> {
  OSMMapRoute({
    Key? key,
    required List<Placemark> placemarks,
    required List<Waypoint> waypoints,
    List<PageRouteInfo>? children,
  }) : super(
          OSMMapRoute.name,
          args: OSMMapRouteArgs(
            key: key,
            placemarks: placemarks,
            waypoints: waypoints,
          ),
          initialChildren: children,
        );

  static const String name = 'OSMMapRoute';

  static const PageInfo<OSMMapRouteArgs> page = PageInfo<OSMMapRouteArgs>(name);
}

class OSMMapRouteArgs {
  const OSMMapRouteArgs({
    this.key,
    required this.placemarks,
    required this.waypoints,
  });

  final Key? key;

  final List<Placemark> placemarks;

  final List<Waypoint> waypoints;

  @override
  String toString() {
    return 'OSMMapRouteArgs{key: $key, placemarks: $placemarks, waypoints: $waypoints}';
  }
}

/// generated route for
/// [AboutAppScreen]
class AboutAppRoute extends PageRouteInfo<void> {
  const AboutAppRoute({List<PageRouteInfo>? children})
      : super(
          AboutAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutAppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DecorationScreen]
class DecorationRoute extends PageRouteInfo<void> {
  const DecorationRoute({List<PageRouteInfo>? children})
      : super(
          DecorationRoute.name,
          initialChildren: children,
        );

  static const String name = 'DecorationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonalDataScreen]
class PersonalDataRoute extends PageRouteInfo<PersonalDataRouteArgs> {
  PersonalDataRoute({
    Key? key,
    required User user,
    List<PageRouteInfo>? children,
  }) : super(
          PersonalDataRoute.name,
          args: PersonalDataRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonalDataRoute';

  static const PageInfo<PersonalDataRouteArgs> page =
      PageInfo<PersonalDataRouteArgs>(name);
}

class PersonalDataRouteArgs {
  const PersonalDataRouteArgs({
    this.key,
    required this.user,
  });

  final Key? key;

  final User user;

  @override
  String toString() {
    return 'PersonalDataRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [FavoriteScreen]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExcursionsListScreen]
class ExcursionsListRoute extends PageRouteInfo<void> {
  const ExcursionsListRoute({List<PageRouteInfo>? children})
      : super(
          ExcursionsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExcursionsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DataAndMemoryScreen]
class DataAndMemoryRoute extends PageRouteInfo<void> {
  const DataAndMemoryRoute({List<PageRouteInfo>? children})
      : super(
          DataAndMemoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DataAndMemoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExcursionScreen]
class ExcursionRoute extends PageRouteInfo<ExcursionRouteArgs> {
  ExcursionRoute({
    Key? key,
    required Excursion excursion,
    List<PageRouteInfo>? children,
  }) : super(
          ExcursionRoute.name,
          args: ExcursionRouteArgs(
            key: key,
            excursion: excursion,
          ),
          initialChildren: children,
        );

  static const String name = 'ExcursionRoute';

  static const PageInfo<ExcursionRouteArgs> page =
      PageInfo<ExcursionRouteArgs>(name);
}

class ExcursionRouteArgs {
  const ExcursionRouteArgs({
    this.key,
    required this.excursion,
  });

  final Key? key;

  final Excursion excursion;

  @override
  String toString() {
    return 'ExcursionRouteArgs{key: $key, excursion: $excursion}';
  }
}
