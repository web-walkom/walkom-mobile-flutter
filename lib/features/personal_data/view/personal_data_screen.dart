import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/widgets/header.dart';
import 'package:walkom_mobile_flutter/widgets/main_screen.dart';

@RoutePage()
class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({
    super.key,
  });

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      child: Column(
        children: [
          Header(title: TEXT_PERSONAL_DATA),
        ],
      ),
    );
  }
}
