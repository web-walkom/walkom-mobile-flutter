import 'package:flutter/material.dart';

class ActionItem extends StatelessWidget {
  const ActionItem({
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
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xFF414141),
                  size: 21,
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.62,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color(0xFF414141),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xFF414141),
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
