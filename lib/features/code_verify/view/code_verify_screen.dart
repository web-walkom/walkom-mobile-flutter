import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pinput/pinput.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/features/auth/bloc/auth_bloc.dart';
import 'package:walkom_mobile_flutter/features/code_verify/bloc/code_verify_bloc.dart';
import 'package:walkom_mobile_flutter/features/code_verify/widgets/widgets.dart';
import 'package:walkom_mobile_flutter/repositories/auth/auth.dart';
import 'package:walkom_mobile_flutter/router/router.dart';
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
  final _authBloc = AuthBloc(
    GetIt.I<AuthRepository>(),
  );
  final _codeVerifyBloc = CodeVerifyBloc(
    GetIt.I<AuthRepository>(),
  );

  final _codeController = TextEditingController();
  bool codeValid = false;

  @override
  void initState() {
    super.initState();
    _codeController.addListener(() {
      if (_codeController.text.length != 6) {
        codeValid = false;
      } else {
        codeValid = true;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeVerifyBloc, CodeVerifyState>(
      bloc: _codeVerifyBloc,
      builder: (context, state) {
        if (codeValid) {
          _codeVerifyBloc.add(CheckSecretCode(
            email: widget.email,
            code: int.parse(_codeController.text),
          ));
        }

        if (state is CodeVerifyChecked && state.result.status) {
          AutoRouter.of(context)
              .replaceAll([const ExcursionsListRoute()]);
        }

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
                padding: const EdgeInsets.only(bottom: 50.0),
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
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: TEXT_SEND_CODE_VERIFY_PART_1,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: lightGray,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.email,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.blue,
                              ),
                            ),
                            TextSpan(
                              text: TEXT_SEND_CODE_VERIFY_PART_2,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: lightGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CodeInputItem(controller: _codeController),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: (state is CodeVerifyChecked && !state.result.status)
                          ? ErrorCard(message: state.result.error)
                          : (state is CodeVerifyError) 
                            ? const ErrorCard(message: ERROR_CHECK_CODE_VERIFY) 
                            : null,
                    ),
                    const SizedBox(height: 10),
                    ButtonText(
                      title: TEXT_RESEND_CODE_VERIFY,
                      onClick: state is! CodeVerifyChecking
                          ? () {
                              _authBloc.add(AuthByEmail(email: widget.email));
                            }
                          : null,
                      color: green,
                    )
                  ],
                ),
              ),
              if (state is CodeVerifyChecking)
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 40,
                  child: Loader(),
                ),
            ],
          ),
        );
      },
    );
  }
}
