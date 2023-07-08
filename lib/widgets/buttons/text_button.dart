import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({
    super.key,
    required this.title,
    required this.onClick,
    required this.color,
  });

  final String title;
  final Function? onClick;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick != null
          ? () {
              onClick!();
            }
          : null,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: color,
        ),
      ),
    );
  }
}
