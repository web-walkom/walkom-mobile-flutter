import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/router/router.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      child: Column(
        children: [
          const Toolbar(title: TEXT_PROFILE),
          ActionMenu(
            child: Column(
              children: [
                ActionMenuItem(
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
                ActionMenuItem(
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
                ActionMenuItem(
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
                ActionMenuItem(
                  title: TEXT_DATA_AND_MEMORY,
                  icon: Icons.storage_rounded,
                  onClick: () {
                    AutoRouter.of(context).push(const DataAndMemoryRoute());
                  },
                ),
              ],
            ),
          ),
          ActionMenu(
            child: Column(
              children: [
                ActionMenuItem(
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
                ActionMenuItem(
                  title: TEXT_PRIVACY_POLICY,
                  icon: Icons.verified_user_rounded,
                  onClick: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
