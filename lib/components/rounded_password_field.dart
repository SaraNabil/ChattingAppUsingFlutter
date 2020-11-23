import 'package:flutter/material.dart';
import '../components/text_field_container.dart';
import '../constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final String validatorText;
  final TextEditingController textEditingController;
  const RoundedPasswordField(
      {Key key, this.textEditingController, this.validatorText})
      : super(key: key);

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
        obscureText: true,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
