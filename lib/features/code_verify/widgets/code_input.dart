import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

class CodeInputItem extends StatelessWidget {
  CodeInputItem({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 20,
      color: darkGray,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: background,
      border: Border.all(color: background),
      borderRadius: BorderRadius.circular(12),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      length: 6,
      showCursor: false,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyDecorationWith(
        border: Border.all(color: green, width: 1.7),
      ),
    );
  }
}
