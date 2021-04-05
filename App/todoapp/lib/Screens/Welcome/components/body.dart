import 'package:flutter/material.dart';
import 'package:todoapp/Screens/Login/login_screen.dart';
import 'package:todoapp/Screens/Signup/signup_screen.dart';
import 'package:todoapp/Screens/Welcome/components/background.dart';
import 'package:todoapp/components/rounded_button.dart';
import 'package:todoapp/models/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome",
              style: intrayTitleStyle,
            ),
            SizedBox(height: size.height * 0.4),
            // Custom button class we made
            RoundedButton(
              text: "Login",
              press: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ));
              },
              color: redColour,
              textColor: Colors.white,
            ),
            SizedBox(
              height: size.height * 0.04,
              child: Center(
                child: Text(
                  "OR",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),
            RoundedButton(
              text: "Sign up",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                }));
              },
              color: Colors.indigo,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
