import 'package:flutter/material.dart';

class ActionMenuChild {
  const ActionMenuChild({
    required this.title,
    required this.icon,
    required this.onClick,
    this.needContext = false,
  });

  final String title;
  final IconData icon;
  final Function onClick;
  final bool needContext;
}
