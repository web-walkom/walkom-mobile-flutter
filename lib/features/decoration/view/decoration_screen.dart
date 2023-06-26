import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

@RoutePage()
class DecorationScreen extends StatefulWidget {
  const DecorationScreen({
    super.key,
  });

  @override
  State<DecorationScreen> createState() => _DecorationScreenState();
}

enum ThemeApp { light, night, system }

class _DecorationScreenState extends State<DecorationScreen> {
  ThemeApp? _theme = ThemeApp.light;

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Toolbar(title: TEXT_DECORATION),
          const SizedBox(height: 25),
          Text(
            TEXT_THEME_APP,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: darkGray,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const Text(TEXT_THEME_LIGHT),
            leading: Radio<ThemeApp>(
              fillColor: MaterialStateColor.resolveWith((states) => darkGray),
              focusColor: MaterialStateColor.resolveWith((states) => darkGray),
              value: ThemeApp.light,
              groupValue: _theme,
              onChanged: (ThemeApp? value) {
                setState(() {
                  _theme = value;
                });
              },
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const Text(TEXT_THEME_NIGHT),
            leading: Radio<ThemeApp>(
              fillColor: MaterialStateColor.resolveWith((states) => darkGray),
              focusColor: MaterialStateColor.resolveWith((states) => darkGray),
              value: ThemeApp.night,
              groupValue: _theme,
              onChanged: (ThemeApp? value) {
                setState(() {
                  _theme = value;
                });
              },
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const Text(TEXT_THEME_SYSTEM),
            leading: Radio<ThemeApp>(
              fillColor: MaterialStateColor.resolveWith((states) => darkGray),
              focusColor: MaterialStateColor.resolveWith((states) => darkGray),
              value: ThemeApp.system,
              groupValue: _theme,
              onChanged: (ThemeApp? value) {
                setState(() {
                  _theme = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
