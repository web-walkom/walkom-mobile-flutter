import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

class CodeInputItem extends StatelessWidget {
  const CodeInputItem({
    super.key,
    required this.first,
    required this.last,
  });

  final bool first;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      child: TextField(
        // autofocus: true,
        showCursor: false,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22,
          color: darkGray,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 2,
              color: green,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          fillColor: background,
          filled: true,
        ),
      ),
    );
  }
}
