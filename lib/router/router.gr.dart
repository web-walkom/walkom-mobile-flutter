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
    ExcursionsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExcursionsListScreen(),
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
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    MapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MapScreen(),
      );
    },
  };
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
/// [MapScreen]
class MapRoute extends PageRouteInfo<void> {
  const MapRoute({List<PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
