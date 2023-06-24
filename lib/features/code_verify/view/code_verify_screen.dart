import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/features/code_verify/widgets/widgets.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

@RoutePage()
class CodeVerifyScreen extends StatefulWidget {
  const CodeVerifyScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<CodeVerifyScreen> createState() => _CodeVerifyScreenState();
}

class _CodeVerifyScreenState extends State<CodeVerifyScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: MainScreen(
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
              padding: const EdgeInsets.only(bottom: 100.0),
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
                        Icons.verified_user_rounded,
                        size: 30.0,
                        color: lightGray,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    TEXT_CODE_VERIFY,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 23,
                      color: darkGray,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      TEXT_SEND_VERIFY_CODE,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: darkGray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CodeInputItem(first: true, last: false),
                        CodeInputItem(first: false, last: false),
                        CodeInputItem(first: false, last: false),
                        CodeInputItem(first: false, last: false),
                        CodeInputItem(first: false, last: false),
                        CodeInputItem(first: false, last: true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "5:00",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: lightGray,
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
                  onClick: () {},
                ),
                const SizedBox(height: 20)
              ],
            )
          ],
        ),
      ),
    );
  }
}
