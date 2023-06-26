import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/features/auth/bloc/auth_bloc.dart';
import 'package:walkom_mobile_flutter/repositories/auth/auth_repository.dart';
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
  final _authBloc = AuthBloc(
    GetIt.I<AuthRepository>(),
  );

  final _emailController = TextEditingController();
  bool? validEmail;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      if (_emailController.text.isEmpty) {
        validEmail = null;
      } else if (isValidEmail()) {
        validEmail = true;
      } else {
        validEmail = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(_emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: _authBloc,
      builder: (context, state) {
        if (state is AuthSented) {
          AutoRouter.of(context).push(
            CodeVerifyRoute(email: _emailController.text),
          );
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
                padding: const EdgeInsets.only(bottom: 80.0),
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
                      TEXT_AUTH_BY_EMAIL,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                        color: darkGray,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        TEXT_DESCRIPTION_AUTH_BY_EMAIL,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: darkGray,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _emailController,
                      cursorColor: darkGray,
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
                        suffixIcon: validEmail == true
                            ? const Icon(
                                Icons.check_circle_rounded,
                                color: Colors.green,
                              )
                            : validEmail == false
                                ? Icon(
                                    Icons.error_rounded,
                                    color: red,
                                  )
                                : null,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: (state is AuthError)
                          ? const ErrorCard(message: ERROR_SEND_CODE_EMAIL)
                          : null,
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MainButton(
                    title: BUTTON_CONTINUE,
                    onClick: validEmail == true && state is! AuthSenting
                        ? () {
                            _authBloc
                                .add(AuthByEmail(email: _emailController.text));
                          }
                        : null,
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
