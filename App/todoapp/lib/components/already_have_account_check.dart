import 'package:flutter/material.dart';
import 'package:todoapp/models/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool loggedIn;
  final Function press;

  const AlreadyHaveAnAccountCheck({
    Key key,
    this.loggedIn = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          loggedIn ? "Already have an account?" : "Don't have an account?",
          style: TextStyle(color: darkGreyColour.withOpacity(0.8)),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: press,
          child: Text(
            loggedIn ? "Sign in" : "Sign up",
            style:
                TextStyle(color: darkGreyColour, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
