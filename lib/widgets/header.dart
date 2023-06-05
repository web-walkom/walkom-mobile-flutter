import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

class Header extends StatelessWidget {
  const Header({
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
          child: Ink(
            width: 45,
            height: 45,
            child: IconButton(
              onPressed: () {
                AutoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: Colors.black,
              style: IconButton.styleFrom(
                backgroundColor: background,
                iconSize: 22,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
