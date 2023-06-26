import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:walkom_mobile_flutter/core/constants.dart';
import 'package:walkom_mobile_flutter/styles/color.dart';
import 'package:walkom_mobile_flutter/widgets/widgets.dart';

@RoutePage()
class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({
    super.key,
  });

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MainButton(
                title: BUTTON_SAVE,
                onClick: () {},
              ),
              const SizedBox(height: 20),
            ],
          )
        ],
      ),
    );
  }
}
