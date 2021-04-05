import 'package:flutter/material.dart';
import 'package:todoapp/models/constants.dart';

// The custom container that will hold our TextField so we can colour it
// and give it a border radius
class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final bool hasError;
  const TextFieldContainer({Key key, this.child, this.hasError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: redColour.withOpacity(.4),
        borderRadius: BorderRadius.circular(29),
        //border: hasError ? Border.all(color: Colors.red, width: 2) : Border(),
      ),
      child: child,
    );
  }
}
