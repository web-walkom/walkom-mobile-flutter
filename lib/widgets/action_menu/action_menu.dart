import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/domain/models/action_menu_child.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

class ActionMenu extends StatelessWidget {
  const ActionMenu({
    super.key,
    required this.listChild,
  });

  final List<ActionMenuChild> listChild;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    listChild.asMap().forEach(
      (index, child) {
        children.add(
          ActionMenuItem(
            title: child.title,
            icon: child.icon,
            onClick: child.onClick,
          ),
        );

        if (index != listChild.length - 1) {
          children.add(
            const Divider(
              color: Colors.white,
              thickness: 2,
              height: 2,
            ),
          );
        }
      },
    );

    return Card(
      margin: const EdgeInsets.only(top: 20),
      elevation: 0,
      color: const Color(0xFFF0F0F0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: children,
      ),
    );
  }
}
