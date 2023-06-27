import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.validEmail,
  });

  final TextEditingController controller;
  final String placeholder;
  final bool? validEmail;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: darkGray,
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
        suffixIcon: validEmail == true
            ? const Icon(
                Icons.check_circle_rounded,
                color: Colors.green,
              )
            : validEmail == false
                ? Icon(
                    Icons.error_rounded,
                    color: red,
                  )
                : null,
      ),
    );
  }
}
