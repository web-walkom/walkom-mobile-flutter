import 'package:flutter/material.dart';

class ModalBottomSheetItem extends StatelessWidget {
  const ModalBottomSheetItem({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF414141),
              size: 21,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                color: Color(0xFF414141),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
