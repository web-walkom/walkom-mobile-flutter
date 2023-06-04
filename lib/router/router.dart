import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/features/excursion/excursion.dart';
import 'package:walkom_mobile_flutter/features/excursions_list/excursions_list.dart';
import 'package:walkom_mobile_flutter/features/profile/profile.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/models.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ExcursionsListRoute.page, path: '/'),
        AutoRoute(page: ExcursionRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ];
}
