import 'package:flutter/material.dart';

class ActionMenuChild {
  const ActionMenuChild({
    required this.title,
    required this.icon,
    required this.onClick,
  });

  final String title;
  final IconData icon;
  final Function onClick;
}
