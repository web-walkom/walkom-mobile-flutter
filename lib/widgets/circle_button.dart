import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
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
        color: Colors.black,
        style: IconButton.styleFrom(
          backgroundColor: background,
          iconSize: 22,
        ),
      ),
    );
  }
}
