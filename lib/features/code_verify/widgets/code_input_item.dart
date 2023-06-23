import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';


class CodeInputItem extends StatelessWidget {
  const CodeInputItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          else {
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
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