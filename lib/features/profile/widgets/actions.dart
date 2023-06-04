import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/features/profile/widgets/action_item.dart';

class ListActions extends StatelessWidget {
  const ListActions({
    super.key,
  });

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
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActionItem(
              title: TEXT_FAVORITE,
              icon: Icons.bookmark_rounded,
            ),
            Divider(
              color: Colors.white,
              thickness: 1.5,
              height: 2,
            ),
            ActionItem(
              title: TEXT_DATA_AND_MEMORY,
              icon: Icons.memory_rounded,
            ),
            Divider(
              color: Colors.white,
              thickness: 1.5,
              height: 2,
            ),
            ActionItem(
              title: TEXT_SETTINGS,
              icon: Icons.settings,
            ),
            Divider(
              color: Colors.white,
              thickness: 1.5,
              height: 2,
            ),
            ActionItem(
              title: TEXT_ABOUT_APP,
              icon: Icons.info,
            ),
          ],
        ),
      ),
    );
  }
}
