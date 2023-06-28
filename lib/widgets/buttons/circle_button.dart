import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.icon,
    required this.onClick,
    this.color = const Color(0xFFF0F0F0),
    this.iconColor = Colors.black,
    this.elevation = 0.0,
    this.width = 45.0,
    this.height = 45.0,
    this.iconSize = 22,
  });

  final IconData icon;
  final Function onClick;
  final Color color;
  final Color iconColor;
  final double elevation;
  final double width;
  final double height;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Ink(
        width: width,
        height: height,
        child: IconButton(
          onPressed: () {
            onClick();
          },
          icon: Icon(icon),
          color: iconColor,
          style: IconButton.styleFrom(
            backgroundColor: color,
            iconSize: iconSize,
          ),
        ),
      ),
    );
  }
}
