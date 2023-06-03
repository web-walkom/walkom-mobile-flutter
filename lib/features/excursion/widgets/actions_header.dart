import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
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
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      builder: (BuildContext c) {
        return SizedBox(
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  contentPadding: EdgeInsets.only(left: 20, right: 20),
                  leading: Icon(Icons.bookmark_outline_rounded),
                  title: Text(TEXT_ADD_FAVORITE),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  contentPadding: EdgeInsets.only(left: 20, right: 20),
                  leading: Icon(Icons.delete_outline_rounded),
                  title: Text(TEXT_DELETE_FILES),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
