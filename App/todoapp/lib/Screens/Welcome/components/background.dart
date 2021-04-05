import 'package:flutter/material.dart';
import 'package:todoapp/models/constants.dart';

// Our reusable background, which takes a Widget child in its constructor
// which we place on top of the gradient background.
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
