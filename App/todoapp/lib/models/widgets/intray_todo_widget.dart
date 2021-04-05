import 'package:flutter/material.dart';
import '../constants.dart';

class IntrayTodo extends StatefulWidget {
  final String title;
  final Key key;
  IntrayTodo({this.title, this.key});

  @override
  _IntrayTodoState createState() => _IntrayTodoState();
}

class _IntrayTodoState extends State<IntrayTodo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: redColour,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]),
      child: Row(
        children: [
          Radio(),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                widget.title,
                style: darkTodoTitle,
              )
            ],
          )
        ],
      ),
    );
  }
}
