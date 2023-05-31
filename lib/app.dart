import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/router/router.dart';
import 'package:walkom_mobile_flutter/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walkom App',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
