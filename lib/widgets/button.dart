import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/styles/button.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: buttonPrimary,
      child: Text(title),
    );
  }
}
