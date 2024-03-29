import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

@RoutePage()
class DataAndMemoryScreen extends StatefulWidget {
  const DataAndMemoryScreen({
    super.key,
  });

  @override
  State<DataAndMemoryScreen> createState() => _DataAndMemoryScreenState();
}

class _DataAndMemoryScreenState extends State<DataAndMemoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      child: Column(
        children: [
          Toolbar(title: TEXT_DATA_AND_MEMORY),
        ],
      ),
    );
  }
}
