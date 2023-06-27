import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/domain/models/action_menu_child.dart';
import 'package:walkom_mobile_flutter/features/profile/widgets/widgets.dart';
import 'package:walkom_mobile_flutter/repositories/users/users.dart';
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
        title: TEXT_AUTH,
        icon: Icons.login_rounded,
        onClick: () {
          AutoRouter.of(context).push(const AuthRoute());
        },
      ),
      ActionMenuChild(
        title: TEXT_PERSONAL_DATA,
        icon: Icons.person_rounded,
        onClick: () {
          const user = User(
            id: "6415a13f4c61bca5b4c39fd2", 
            email: "user@gmail.com", 
            photo: "http://cdn1.flamp.ru/a992cfb02dd71b2dc22b2f577067ddd8.jpg", 
            first_name: "Vanya", 
            last_name: "Ivanov",
          );
          AutoRouter.of(context).push(PersonalDataRoute(user: user));
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
      ActionMenuChild(
        title: TEXT_LOG,
        icon: Icons.notes_rounded,
        onClick: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TalkerScreen(
                talker: GetIt.I<Talker>(),
              ),
            ),
          );
        },
      ),
      ActionMenuChild(
        title: TEXT_LOGOUT,
        icon: Icons.logout_rounded,
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
