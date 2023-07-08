import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

class ErrorLoad extends StatelessWidget {
  const ErrorLoad({
    super.key,
    required this.tryAgain,
  });

  final Function tryAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(ERROR_BY_GET_DATA),
        ButtonText(
          title: TEXT_TRY_AGAIN, 
          onClick: tryAgain, 
          color: green,
        ),
      ],
    );
  }
}
