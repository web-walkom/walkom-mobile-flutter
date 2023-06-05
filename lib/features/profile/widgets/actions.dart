import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/features/profile/widgets/action_item.dart';
import 'package:walkom_mobile_flutter/router/router.dart';

class ListActions extends StatelessWidget {
  const ListActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.only(top: 20),
          elevation: 0,
          color: const Color(0xFFF0F0F0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ActionItem(
                title: TEXT_PERSONAL_DATA,
                icon: Icons.person_rounded,
                onClick: () {
                  AutoRouter.of(context).push(const PersonalDataRoute());
                },
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
                height: 2,
              ),
              ActionItem(
                title: TEXT_FAVORITE,
                icon: Icons.bookmark_rounded,
                onClick: () {
                  AutoRouter.of(context).push(const FavoriteRoute());
                },
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
                height: 2,
              ),
              ActionItem(
                title: TEXT_DECORATION,
                icon: Icons.wb_sunny_rounded,
                onClick: () {
                  AutoRouter.of(context).push(const DecorationRoute());
                },
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
                height: 2,
              ),
              ActionItem(
                title: TEXT_DATA_AND_MEMORY,
                icon: Icons.storage_rounded,
                onClick: () {
                  AutoRouter.of(context).push(const DataAndMemoryRoute());
                },
              ),
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.only(top: 12),
          elevation: 0,
          color: const Color(0xFFF0F0F0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ActionItem(
                title: TEXT_ABOUT_APP,
                icon: Icons.info,
                onClick: () {
                  AutoRouter.of(context).push(const AboutAppRoute());
                },
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
                height: 2,
              ),
              ActionItem(
                title: TEXT_PRIVACY_POLICY,
                icon: Icons.verified_user_rounded,
                onClick: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
