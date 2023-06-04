import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/router/router.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          TEXT_EXCURSIONS,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
        ),
        Ink(
          width: 45,
          height: 45,
          child: IconButton(
            onPressed: () {
              AutoRouter.of(context).push(const ProfileRoute());
            },
            icon: const Icon(Icons.person_rounded),
            color: Colors.black,
            style: IconButton.styleFrom(
              backgroundColor: background,
              iconSize: 22,
            ),
          ),
        )
      ],
    );
  }
}
