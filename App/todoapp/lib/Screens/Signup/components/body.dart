import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Screens/Login/components/background.dart';
import 'package:todoapp/Screens/Login/login_screen.dart';
import 'package:todoapp/components/already_have_account_check.dart';
import 'package:todoapp/components/rounded_button.dart';
import 'package:todoapp/components/rounded_input_field.dart';
import 'package:todoapp/components/rounded_password_field.dart';
import 'package:todoapp/models/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final firebaseAuth = Provider.of<FirebaseAuth>(context);

    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Sign Up",
          style: lightLoginTitle,
        ),
        SizedBox(
          height: size.height * 0.35,
        ),
        RoundedInputField(
          hintText: "Enter your email",
          controller: emailController,
        ),
        RoundedPasswordField(controller: passwordController),
        RoundedButton(
          text: "SIGN UP",
          press: () {
            // Do the registration
            if (emailController.text.length > 0 &&
                passwordController.text.length > 0) {
              _registerNewUser(
                  context, emailController.text, passwordController.text);
            }
          },
          color: Colors.indigo,
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        AlreadyHaveAnAccountCheck(
          loggedIn: true,
          press: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }));
          },
        )
      ],
    ));
  }

  Future _registerNewUser(
      BuildContext context, String email, String password) async {
    final firebaseAuth = Provider.of<FirebaseAuth>(context, listen: false);
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.pop(
          context); // Popping the sign-in page off the stack if registration
      // was successful.
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        print('The email provided is not valid.');
      }
    } catch (e) {
      print(e);
    }
  }
}
