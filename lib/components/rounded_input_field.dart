import 'package:flutter/material.dart';
import '../components/text_field_container.dart';
import '../constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String validatorText;
  final TextEditingController textEditingController;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.textEditingController,
    this.validatorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: textEditingController,
        validator: (value) {
          if (value.isEmpty) {
            return validatorText;
          }
        },
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
