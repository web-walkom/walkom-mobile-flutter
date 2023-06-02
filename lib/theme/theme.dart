import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: const TextTheme(),
);
