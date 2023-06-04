import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Colors.black,
          strokeWidth: 1.5,
        ),
      ),
    );
  }
}