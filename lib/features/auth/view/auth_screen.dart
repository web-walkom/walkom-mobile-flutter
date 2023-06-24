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
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
        Padding(
          padding: const EdgeInsets.only(bottom: 120.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 0,
                color: background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.alternate_email_rounded,
                    size: 30.0,
                    color: lightGray,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                TEXT_WELCOME,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                  color: darkGray,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _emailController,
                cursorColor: darkGray,
                autovalidateMode: AutovalidateMode.always,
                validator: (input) =>
                    isValidEmail() || input!.isEmpty ? null : "Неверная почта",
                decoration: InputDecoration(
                  hintText: PLACEHOLDER_ENTER_EMAIL,
                  hintStyle: TextStyle(
                    color: darkGray,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: background,
                  filled: true,
                  // suffixIcon: const Icon(
                  //   Icons.check_circle_rounded,
                  //   color: Colors.green,
                  // ),
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MainButton(
              title: BUTTON_CONTINUE,
              onClick: () {
                if (isValidEmail()) {
                  AutoRouter.of(context).push(CodeVerifyRoute(
                    email: _emailController.text,
                  ));
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        )
      ],
    ));
  }

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(_emailController.text);
  }
}
