import 'package:flutter/material.dart';

class ErrorLoad extends StatelessWidget {
  const ErrorLoad({
    super.key,
    required this.tryAgain,
  });

  final Function tryAgain;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Ошибка при получении данных'),
          TextButton(
            onPressed: () {
              tryAgain();
            },
            child: const Text('Попробвать снова'),
          )
        ],
      ),
    );
  }
}
