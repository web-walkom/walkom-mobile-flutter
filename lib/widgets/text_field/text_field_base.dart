import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

class TextFieldBase extends StatelessWidget {
  const TextFieldBase({
    super.key,
    required this.controller,
    required this.placeholder,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String placeholder;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: darkGray,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(
          color: Colors.black,
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
