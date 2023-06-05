import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/styles/button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.onClick,
  });

  final String title;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onClick();
      },
      style: buttonPrimary,
      child: Text(title),
    );
  }
}
