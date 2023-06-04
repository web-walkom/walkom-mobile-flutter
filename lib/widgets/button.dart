import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/styles/button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.pressedFunc,
  });

  final String title;
  final Function pressedFunc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        pressedFunc();
      },
      style: buttonPrimary,
      child: Text(title),
    );
  }
}
