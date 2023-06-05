import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/widgets/header.dart';
import 'package:walkom_mobile_flutter/widgets/main_screen.dart';

@RoutePage()
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      child: Column(
        children: [
          Header(title: TEXT_FAVORITE),
        ],
      ),
    );
  }
}
