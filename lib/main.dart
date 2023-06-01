import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:walkom_mobile_flutter/app.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';

void main() {
  GetIt.I.registerLazySingleton<ExcursionsRepository>(
    () => ExcursionsRepositoryImpl(dio: Dio()),
  );
  runApp(const MyApp());
}
