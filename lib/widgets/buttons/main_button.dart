import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/styles/button.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.onClick,
    this.isLoading = false,
  });

  final String title;
  final Function? onClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick != null
          ? () {
              onClick!();
            }
          : null,
      style: buttonPrimary,
      child: !isLoading ? Text(title) : const Loader(color: Colors.white),
    );
  }
}
