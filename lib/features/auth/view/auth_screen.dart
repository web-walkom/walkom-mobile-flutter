import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/router/router.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CircleButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onClick: () {
                AutoRouter.of(context).pop();
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                APP_NAME, 
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                  color: darkGray,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: PLACEHOLDER_ENTER_EMAIL,
                  hintStyle: TextStyle(
                    color: darkGray, 
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  fillColor: background,
                  filled: true,
                ),
              ),
              const SizedBox(height: 12),
              MainButton(
                title: BUTTON_CONTINUE,
                onClick: () {
                  AutoRouter.of(context).push(const CodeVerifyRoute());
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}
