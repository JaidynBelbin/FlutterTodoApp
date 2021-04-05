import 'package:flutter/material.dart';
import 'package:todoapp/components/text_field_container.dart';
import 'package:todoapp/models/constants.dart';

// Our generic rounded text input field that we can reuse with different
// icons, hint text and onChanged methods.
class RoundedInputField extends StatelessWidget {
  final String hintText;
  final bool hasError;
  final IconData icon;
  final TextEditingController controller;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.controller,
    this.hasError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        hasError: hasError,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            errorText: hasError ? "Invalid username" : null,
            border: InputBorder.none,
            icon: Icon(
              icon,
              color: darkGreyColour.withOpacity(0.9),
            ),
            hintText: hintText,
            alignLabelWithHint: true,
          ),
        ));
  }
}
