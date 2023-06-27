import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pinput/pinput.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/features/personal_data/bloc/personal_data_bloc.dart';
import 'package:walkom_mobile_flutter/repositories/users/users.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

@RoutePage()
class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final _personalDataBloc = PersonalDataBloc(
    GetIt.I<UsersRepository>(),
  );

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  bool validFirstName = false;

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(() {
      if (_firstNameController.text.isEmpty) {
        validFirstName = false;
      } else {
        validFirstName = true;
      }
      setState(() {});
    });

    _firstNameController.setText(widget.user.first_name);
    _lastNameController.setText(widget.user.last_name);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalDataBloc, PersonalDataState>(
      bloc: _personalDataBloc,
      builder: (context, state) {
        if (state is PersonalDataUpdated && state.result.status) {
          AutoRouter.of(context).pop();
        }

        return MainScreen(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Toolbar(title: TEXT_PERSONAL_DATA),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 0,
                    color: background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Icon(
                        Icons.person_rounded,
                        size: 35.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFieldBase(
                    controller: _firstNameController,
                    placeholder: PLACEHOLDER_ENTER_FIRST_NAME,
                  ),
                  const SizedBox(height: 10),
                  TextFieldBase(
                    controller: _lastNameController,
                    placeholder: PLACEHOLDER_ENTER_LAST_NAME,
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: (state is PersonalDataError)
                          ? const ErrorCard(message: ERROR_UPDATE_USER)
                          : null,
                    )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MainButton(
                    title: BUTTON_SAVE,
                    isLoading: state is PersonalDataUpdating,
                    onClick: validFirstName == true
                        ? () {
                            if (state is! PersonalDataUpdating) {
                              _personalDataBloc.add(
                                UpdateUser(
                                  id: widget.user.id,
                                  photo: "",
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                ),
                              );
                            }
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
