import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/widgets/header.dart';
import 'package:walkom_mobile_flutter/widgets/main_screen.dart';

@RoutePage()
class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({
    super.key,
  });

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      child: Column(
        children: [
          Header(title: TEXT_ABOUT_APP),
        ],
      ),
    );
  }
}
