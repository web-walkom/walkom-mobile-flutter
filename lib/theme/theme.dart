import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFF0F0F0),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF0F0F0),
    titleTextStyle: TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: const TextTheme(),
);
