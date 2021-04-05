import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Screens/Login/components/background.dart';
import 'package:todoapp/Screens/Signup/signup_screen.dart';
import 'package:todoapp/components/already_have_account_check.dart';
import 'package:todoapp/components/rounded_button.dart';
import 'package:todoapp/components/rounded_input_field.dart';
import 'package:todoapp/components/rounded_password_field.dart';
import 'package:todoapp/models/constants.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var hasEmailError = false;
  var hasPasswordError = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login", style: lightLoginTitle),
          SizedBox(height: size.height * 0.35),
          RoundedInputField(
            hasError:
                hasEmailError, // value passed down the Widget constructors of both input fields
            hintText: "Enter your email",
            controller: emailController,
          ),
          RoundedPasswordField(
              hasError: hasPasswordError, controller: passwordController),
          RoundedButton(
            text: "LOGIN",
            press: () {
              // Do the registration
              if (emailController.text.length > 0 &&
                  passwordController.text.length > 0) {
                _signInUser(
                    context, emailController.text, passwordController.text);
              }
            },
            color: redColour,
            textColor: Colors.white,
          ),
          SizedBox(height: size.height * 0.05),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignUpScreen();
              }));
            },
          )
        ],
      ),
    );
  }

  Future _signInUser(
      BuildContext context, String email, String password) async {
    final firebaseAuth = Provider.of<FirebaseAuth>(context, listen: false);
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        setState(() {
          this.hasPasswordError = true;
          this.hasEmailError = false;
        });
      } else if (e.code == "invalid-email" || e.code == "user-not-found") {
        setState(() {
          this.hasPasswordError = false;
          this.hasEmailError = true;
        });
      }
      print("${e.code}");
    } catch (e) {
      print(e);
    }
  }
}
