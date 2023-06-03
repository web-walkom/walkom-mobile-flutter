import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/app.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';

void main() async {
  final talker = TalkerFlutter.init();

  GetIt.I.registerSingleton(talker);
  GetIt.I.registerLazySingleton<ExcursionsRepository>(
    () => ExcursionsRepositoryImpl(dio: Dio()),
  );

  await Hive.initFlutter();

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(const MyApp()), (error, stack) {
    GetIt.I<Talker>().handle(error, stack);
  });
}
