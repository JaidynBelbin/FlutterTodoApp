import 'package:flutter/material.dart';
import 'package:todoapp/models/constants.dart';

// Background for our Login page, which takes one Widget child in its
// constructor
class Background extends StatelessWidget {
  final Widget child;
  const Background({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  redColour,
                  Colors.green.shade200,
                ])),
          ),
          child,
        ],
      ),
    );
  }
}
