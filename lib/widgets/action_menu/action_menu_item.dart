import 'package:flutter/material.dart';

class ActionMenuItem extends StatelessWidget {
  const ActionMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onClick,
    this.needContext = false,
  });

  final String title;
  final IconData icon;
  final Function onClick;
  final bool needContext;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (needContext) {
          onClick(context);
        }
        else {
          onClick();
        }
      },
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
