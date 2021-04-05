import 'package:flutter/material.dart';
import 'package:todoapp/components/text_field_container.dart';
import 'package:todoapp/models/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool hasError;

  const RoundedPasswordField({
    Key key,
    this.controller,
    this.hasError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      hasError: hasError,
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          errorText: hasError ? "Invalid password" : null,
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: darkGreyColour.withOpacity(0.9),
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: darkGreyColour.withOpacity(0.9),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
