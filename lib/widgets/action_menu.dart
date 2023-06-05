import 'package:flutter/material.dart';

class ActionMenu extends StatelessWidget {
  const ActionMenu({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 20),
      elevation: 0,
      color: const Color(0xFFF0F0F0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
