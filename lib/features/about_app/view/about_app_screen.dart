import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

@RoutePage()
class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({
    super.key,
  });

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      child: Column(
        children: [
          const Toolbar(title: TEXT_ABOUT_APP),
          const SizedBox(height: 30),
          SvgPicture.asset(
            "assets/svg/logo.svg",
            height: 80,
            width: 80,
          ),
          const SizedBox(height: 15),
          const Text(
            "walkom $VERSION",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "Сборка от $DATE_BUILD",
            style: TextStyle(
              fontSize: 16,
              color: lightGray,
            ),
          ),
          const SizedBox(height: 5),
          ActionMenu(
            child: Column(
              children: [
                ActionMenuItem(
                  title: TEXT_SUPPORT,
                  icon: Icons.contact_support_rounded,
                  onClick: () {},
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                  height: 2,
                ),
                ActionMenuItem(
                  title: TEXT_RATE_APP,
                  icon: Icons.star_rounded,
                  onClick: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
