import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/app.dart';
import 'package:walkom_mobile_flutter/repositories/auth/auth.dart';
import 'package:walkom_mobile_flutter/repositories/excursions/excursions.dart';
import 'package:walkom_mobile_flutter/repositories/users/users.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
    ),
  );

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

  await Hive.initFlutter();

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker, 
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      ),
    ),
  );

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );

  GetIt.I.registerLazySingleton<ExcursionsRepository>(
    () => ExcursionsRepositoryImpl(dio: dio),
  );
  GetIt.I.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(dio: dio),
  );
  GetIt.I.registerLazySingleton<UsersRepository>(
    () => UsersRepositoryImpl(dio: dio),
  );

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(const MyApp()), (error, stack) {
    GetIt.I<Talker>().handle(error, stack);
  });
}
