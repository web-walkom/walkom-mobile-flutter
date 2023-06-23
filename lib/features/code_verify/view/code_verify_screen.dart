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
  });

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
                TEXT_SEND_VERIFY_CODE, 
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: darkGray,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              const Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CodeInputItem(),
                    CodeInputItem(),
                    CodeInputItem(),
                    CodeInputItem(),
                    CodeInputItem(),
                    CodeInputItem(),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MainButton(
                title: BUTTON_CONTINUE,
                onClick: () {
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}
