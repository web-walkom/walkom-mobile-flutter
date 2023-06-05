import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/domain/models/action_menu_child.dart';
import 'package:walkom_mobile_flutter/features/profile/widgets/widgets.dart';
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
    final actionMenuMain = [
      ActionMenuChild(
        title: TEXT_PERSONAL_DATA,
        icon: Icons.person_rounded,
        onClick: () {
          AutoRouter.of(context).push(const PersonalDataRoute());
        },
      ),
      ActionMenuChild(
        title: TEXT_FAVORITE,
        icon: Icons.bookmark_rounded,
        onClick: () {
          AutoRouter.of(context).push(const FavoriteRoute());
        },
      ),
      ActionMenuChild(
        title: TEXT_DECORATION,
        icon: Icons.wb_sunny_rounded,
        onClick: () {
          AutoRouter.of(context).push(const DecorationRoute());
        },
      ),
      ActionMenuChild(
        title: TEXT_DATA_AND_MEMORY,
        icon: Icons.storage_rounded,
        onClick: () {
          AutoRouter.of(context).push(const DataAndMemoryRoute());
        },
      )
    ];

    final actionMenuAdditional = [
      ActionMenuChild(
        title: TEXT_ABOUT_APP,
        icon: Icons.info,
        onClick: () {
          AutoRouter.of(context).push(const AboutAppRoute());
        },
      ),
      ActionMenuChild(
        title: TEXT_PRIVACY_POLICY,
        icon: Icons.verified_user_rounded,
        onClick: () {},
      ),
    ];

    return MainScreen(
      child: Column(
        children: [
          const Toolbar(title: TEXT_PROFILE),
          const SizedBox(height: 20),
          const UserCard(
            name: "Vanya Ivanov",
            email: "user@gmail.com",
            photo: "http://cdn1.flamp.ru/a992cfb02dd71b2dc22b2f577067ddd8.jpg",
          ),
          const SizedBox(height: 20),
          ActionMenu(
            listChild: actionMenuMain,
          ),
          const SizedBox(height: 20),
          ActionMenu(
            listChild: actionMenuAdditional,
          ),
        ],
      ),
    );
  }
}
