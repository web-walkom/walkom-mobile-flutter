import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/widgets/header.dart';
import 'package:walkom_mobile_flutter/widgets/main_screen.dart';

@RoutePage()
class DecorationScreen extends StatefulWidget {
  const DecorationScreen({
    super.key,
  });

  @override
  State<DecorationScreen> createState() => _DecorationScreenState();
}

class _DecorationScreenState extends State<DecorationScreen> {
  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      child: Column(
        children: [
          Header(title: TEXT_DECORATION),
        ],
      ),
    );
  }
}
