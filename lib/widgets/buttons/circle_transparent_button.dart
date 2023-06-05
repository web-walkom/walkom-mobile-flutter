import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

class CircleTransparentButton extends StatelessWidget {
  const CircleTransparentButton({
    super.key,
    required this.icon,
    required this.onClick,
  });

  final IconData icon;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 45,
      height: 45,
      child: IconButton(
        onPressed: () {
          onClick();
        },
        icon: Icon(icon),
        color: Colors.white,
        style: IconButton.styleFrom(
          backgroundColor: blackTransparent,
        ),
      ),
    );
  }
}
