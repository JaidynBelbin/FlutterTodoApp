import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoapp/models/constants.dart';

import '../models/widgets/intray_todo_widget.dart';

class IntrayPage extends StatefulWidget {
  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  List<IntrayTodo> listItems = [];

  @override
  Widget build(BuildContext context) {
    listItems = getList();

    return Container(
        color: darkGreyColour,
        child: ReorderableListView(
          scrollDirection: Axis.vertical,
          onReorder: _onReorder,
          padding: EdgeInsets.only(top: 250),
          children: listItems,
        ));
  }

  List<Widget> getList() {
    List<IntrayTodo> list = [];

    for (int i = 0; i < 10; i++) {
      list.add(IntrayTodo(
        key: Key('$i'),
        title: "Hello",
      ));
    }

    return list;
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final IntrayTodo item = listItems.removeAt(oldIndex);
      listItems.insert(newIndex, item);
    });
  }
}
