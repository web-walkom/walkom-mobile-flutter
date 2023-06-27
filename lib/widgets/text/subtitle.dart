import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: lightGray,
      ),
    );
  }
}
