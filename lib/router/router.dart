import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/features/about_app/about_app.dart';
import 'package:walkom_mobile_flutter/features/auth/auth.dart';
import 'package:walkom_mobile_flutter/features/code_verify/code_verify.dart';
import 'package:walkom_mobile_flutter/features/data_and_memory/data_and_memory.dart';
import 'package:walkom_mobile_flutter/features/decoration/decoration.dart';
import 'package:walkom_mobile_flutter/features/excursion/excursion.dart';
import 'package:walkom_mobile_flutter/features/excursions_list/excursions_list.dart';
import 'package:walkom_mobile_flutter/features/favorite/favorite.dart';
import 'package:walkom_mobile_flutter/features/map/map.dart';
import 'package:walkom_mobile_flutter/features/personal_data/personal_data.dart';
import 'package:walkom_mobile_flutter/features/profile/profile.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/models/models.dart';
import 'package:walkom_mobile_flutter/repositories/users/models/models.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ExcursionsListRoute.page, path: '/'),
        AutoRoute(page: ExcursionRoute.page),
        AutoRoute(page: ProfileRoute.page, path: '/profile'),
        AutoRoute(page: OSMMapRoute.page),
        AutoRoute(page: GoogleMapRoute.page),
        AutoRoute(page: FlutterMapRoute.page),
        AutoRoute(page: PersonalDataRoute.page),
        AutoRoute(page: FavoriteRoute.page),
        AutoRoute(page: DecorationRoute.page),
        AutoRoute(page: DataAndMemoryRoute.page),
        AutoRoute(page: AboutAppRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: CodeVerifyRoute.page),
      ];
}
