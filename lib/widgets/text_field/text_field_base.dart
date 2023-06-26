import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

class TextFieldBase extends StatelessWidget {
  const TextFieldBase({
    super.key,
    required this.controller,
    required this.placeholder,
  });

  final TextEditingController controller;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: darkGray,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          color: darkGray,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
        fillColor: background,
        filled: true,
      ),
    );
  }
}
