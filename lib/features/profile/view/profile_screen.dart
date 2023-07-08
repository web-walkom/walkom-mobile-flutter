import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/domain/models/action_menu_child.dart';
import 'package:walkom_mobile_flutter/features/profile/widgets/widgets.dart';
import 'package:walkom_mobile_flutter/repositories/users/users.dart';
import 'package:walkom_mobile_flutter/router/router.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';
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

    logoutUser() {
      USER = null;
      GetIt.I<Box<User>>().clear();
      AutoRouter.of(context).replaceAll([const ExcursionsListRoute()]);
    }

    confirmLogout(context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return ModalBottomSheet(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Title_(text: TEXT_CONFIRM_LOGOUT),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonText(
                      title: TEXT_LOGOUT, 
                      onClick: logoutUser, 
                      color: green,
                    ),
                    const SizedBox(width: 10),
                    ButtonText(
                      title: TEXT_CANCEL, 
                      onClick: (){
                        AutoRouter.of(context).pop();
                      }, 
                      color: red,
                    ),
                  ],
                ),
                const SizedBox(height: 15)
              ],
            ),
          );
        },
      );
    }

    final actionMenuMain = [
      if (USER == null)
        ActionMenuChild(
          title: TEXT_AUTH,
          icon: Icons.lock_rounded,
          onClick: () {
            AutoRouter.of(context).push(const AuthRoute());
          },
        ),
      if (USER != null)
        ActionMenuChild(
          title: TEXT_PERSONAL_DATA,
          icon: Icons.person_rounded,
          onClick: () {
            final user = User(
              id: USER!.id, 
              email: USER!.email, 
              photo: USER!.photo, 
              firstName: USER!.firstName, 
              lastName: USER!.lastName,
              accessToken: USER!.accessToken,
            );
            AutoRouter.of(context).push(PersonalDataRoute(user: user));
          }
        ),
      if (USER != null)
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
      if (USER != null)
        ActionMenuChild(
          title: TEXT_LOGOUT,
          icon: Icons.logout_rounded,
          onClick: confirmLogout,
          needContext: true,
        ),
    ];

    return MainScreen(
      child: Column(
        children: [
          const Toolbar(title: TEXT_PROFILE),
          if (USER != null)
            const SizedBox(height: 20),
          if (USER != null)
            UserCard(
              firstName: USER!.firstName != "" ? USER!.firstName : TEXT_WITHOUT_NAME,
              lastName: USER!.lastName,
              email: USER!.email,
              photo: USER!.photo,
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
