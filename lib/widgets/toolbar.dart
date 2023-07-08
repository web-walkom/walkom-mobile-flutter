import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CircleButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onClick: () {
              AutoRouter.of(context).pop();
            },
          ),
        ),
        Title_(text: title),
      ],
    );
  }
}
