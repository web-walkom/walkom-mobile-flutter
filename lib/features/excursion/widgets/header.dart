import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/features/excursion/widgets/action_item.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';

class ActionsHeader extends StatelessWidget {
  const ActionsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Ink(
          width: 45,
          height: 45,
          child: IconButton(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.white,
            style: IconButton.styleFrom(
              backgroundColor: blackTransparent,
            ),
          ),
        ),
        Ink(
          width: 45,
          height: 45,
          child: IconButton(
            onPressed: () {
              actionsExcursion(context);
            },
            icon: const Icon(Icons.more_vert_rounded),
            color: Colors.white,
            style: IconButton.styleFrom(
              backgroundColor: blackTransparent,
            ),
          ),
        )
      ],
    );
  }

  actionsExcursion(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext c) {
        return const SingleChildScrollView(
          child: Card(
            elevation: 0,
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                SizedBox(height: 10),
                ActionItem(
                  title: TEXT_ADD_FAVORITE,
                  icon: Icons.bookmark_rounded,
                ),
                ActionItem(
                  title: TEXT_REPORT_ERROR,
                  icon: Icons.report_rounded,
                ),
                ActionItem(
                  title: TEXT_DELETE_FILES,
                  icon: Icons.delete_rounded,
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        );
      },
    );
  }
}
